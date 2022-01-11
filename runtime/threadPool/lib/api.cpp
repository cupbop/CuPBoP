#include <stdio.h>
#include <stdlib.h>
#include <thread>

#include "api.h"
#include "def.h"
#include "macros.h"
#include "structures.h"

/*
Initialize the device
*/
int init_device() {

  cu_device *device = (cu_device *)calloc(1, sizeof(cu_device));
  if (device == NULL)
    return C_ERROR_MEMALLOC;

  device->max_compute_units = std::thread::hardware_concurrency();

  // initialize scheduler
  int ret = scheduler_init(*device);

  if (ret != C_SUCCESS)
    return ret;

  return C_SUCCESS;
}

/*
    Create Kernel

*/
static int kernelIds = 0;
cu_kernel *create_kernel(const void *func, dim3 gridDim, dim3 blockDim,
                         void ***args, size_t sharedMem, cstreamData *stream) {
  cu_kernel *ker = (cu_kernel *)calloc(1, sizeof(cu_kernel));

  // set the function pointer
  ker->start_routine = (void *(*)(void *))func;
  // ker->start_routine(args);
  ker->args = *args;

  ker->gridDim = gridDim;
  ker->blockDim = blockDim;

  ker->shared_mem = sharedMem;

  // malloc shared memory dynamic (heap , needs to be on the stack)
  // each thread create their own shared memory // after the task submission
  ker->shared_mem_loc = calloc(1, sharedMem);

  ker->stream = stream;

  ker->blockId = 0;

  ker->totalBlocks = gridDim.x;

  ker->N = blockDim.x;

  ker->kernelId = kernelIds;
  kernelIds += 1;

  ker->blockSize = blockDim.x;

  return ker;
}

/*
    Create Kernel Queue
*/
int create_KernelQueue(kernel_queue **q) {
  *q = (kernel_queue *)calloc(1, sizeof(kernel_queue));

  if (*q == NULL) {
    return C_ERROR_MEMALLOC;
  }

  (*q)->kernel_count = 0;
  (*q)->running_count = 0;
  (*q)->waiting_count = 0;
  (*q)->finish_count = 0;
  (*q)->current_index = 0;

  return C_SUCCESS;
}

int dequeKernelLL(struct kernel_queue **qu) {

  struct kernel_queue *q = *qu;
  q->finish_count += 1;

  // free the pointer
  if (q->head == NULL) {
    return C_QUEUE_EMPTY;
  } else {
    //*ker = *(q->head);
    q->head = (q->head)->next;
    if (q->head != NULL) {
      q->head->prev = NULL;
    }
  }

  return C_SUCCESS;
}

int enqueueKernel(struct kernel_queue **qu, cu_kernel **ker) {
  struct kernel_queue *q = *qu;
  cu_kernel *p = *ker;

  if (q->head == NULL) {
    q->head = p;
    q->tail = p;
  } else {
    p->prev = q->tail;
    q->tail->next = p;
    q->tail = p;
    p->next = NULL;
  }
  q->kernel_count += 1;
  q->waiting_count += 1;

  // user kernel command

  return C_SUCCESS;
}

// scheduler
static cu_pool *scheduler;

__thread int block_index = 0;
__thread int thread_memory_size = 0;

/*
    Enqueue Kernel (k) to the scheduler kernelQueue
*/
int schedulerEnqueueKernel(cu_kernel **k) {
  cu_kernel *ker = *k;
  MUTEX_LOCK(scheduler->work_queue_lock);

  enqueueKernel(&scheduler->kernelQueue, &ker);

  pthread_cond_broadcast(&(scheduler->wake_pool));
  MUTEX_UNLOCK(scheduler->work_queue_lock);
}

/*
  Kernel Launch with numBlocks and numThreadsPerBlock
*/
int cuLaunchKernel(cu_kernel **k) {

  // Calculate Block Size N/numBlocks

  cu_kernel *ker = *k;
  int status = C_RUN;

  MUTEX_LOCK(scheduler->work_queue_lock);
  scheduler->num_kernel_queued += 1;
  MUTEX_UNLOCK(scheduler->work_queue_lock);

  // stream == 0 add to the kernelQueue
  if (ker->stream == 0) {

    schedulerEnqueueKernel(&ker);
  } else {
    // add to it's stream queue
    // stream queue can be waiting or running with or without tasks
    MUTEX_LOCK(((cstreamData *)(ker->stream))->stream_lock);
    status = ((cstreamData *)(ker->stream))->ev.status;

    // if stream queue status is run (first kernel) (enqueue to the kernel
    // queue)
    cstreamData *e = ((cstreamData *)(ker->stream));
    // synchronized is called after no job in the queue so stream is stuck on
    // synchronize
    if (e->ev.status == C_SYNCHRONIZE) {
      if ((e->kernelQueue->finish_count) == (e->kernelQueue->kernel_count)) {
        e->ev.status = C_RUN;
      }
    }

    if (e->ev.status == C_RUN) {
      // change the status to wait
      e->ev.status == C_WAIT;
      MUTEX_UNLOCK(((cstreamData *)(ker->stream))->stream_lock);

      schedulerEnqueueKernel(&ker);
    } else {
      // the status of stream queue is wait so just enqueue to the stream
      enqueueKernel(&((cstreamData *)(ker->stream))->kernelQueue, &ker);
      MUTEX_UNLOCK(((cstreamData *)(ker->stream))->stream_lock);
    }
  }
}

/*
    Get Work Item: get the kernel from the queue and increment blockId
*/
int getWorkItem(struct kernel_queue **qu, cu_kernel **kern, int blockId) {
  struct kernel_queue *q = *qu;
  if (q->waiting_count > 0) {
    *kern = q->head;
    cu_kernel *ker = *kern;
    if (blockId + 1 == q->head->totalBlocks) {
      // deque the head
      dequeKernelLL(qu);
      ker->status = C_COMPLETE;
      q->waiting_count -= 1;
    } else {
      q->head->blockId += 1;
    }
    q->finish_count += 1;
  } else {
    return C_QUEUE_EMPTY;
  }
  return C_SUCCESS;
}

/*
    Thread Gets Work
*/
int get_work(c_thread *th) {

  cu_kernel ker;

  MUTEX_LOCK(scheduler->work_queue_lock);

RETRY:

  int is_exit = 0;
  int is_command_not_null = 0;

  int blockId;
  int localBlockSize;
  int status;
  int completion_status = 0;

  is_exit = scheduler->threadpool_shutdown_requested;

  MUTEX_UNLOCK(scheduler->work_queue_lock);

  if (!is_exit) {

    MUTEX_LOCK(scheduler->work_queue_lock);

    // if kernel waiting to be complete is not zero
    if (scheduler->kernelQueue->waiting_count > 0) {
      blockId = scheduler->kernelQueue->head->blockId;
      localBlockSize = scheduler->kernelQueue->head->blockSize;
      // set status as success fully queue
      status = C_SUCCESS;
      ker = *(scheduler->kernelQueue->head);
      // if the blockId + 1 is equal to the goal block size ,
      // then its the last block

      if (blockId + 1 == scheduler->kernelQueue->head->totalBlocks) {
        // deque the head
        dequeKernelLL(&scheduler->kernelQueue);

        ker.status = C_COMPLETE;
        scheduler->kernelQueue->waiting_count -= 1;
      } else {
        // increment the blockId
        scheduler->kernelQueue->head->blockId =
            scheduler->kernelQueue->head->blockId + 1;
      }
      // status = getWorkItem(&scheduler->kernelQueue, &ker, blockId);
    } else {
      status = C_QUEUE_EMPTY;
    }
    MUTEX_UNLOCK(scheduler->work_queue_lock);
  }

  if (status != C_QUEUE_EMPTY) {

    block_index = blockId;
    thread_memory_size = ker.shared_mem;
    ker.start_routine(ker.args);

    is_command_not_null = 1;
    if (ker.status == C_COMPLETE) {

      // check if this kernel's stream has more jobs to run (enqueue the next
      // job)
      if (ker.stream != NULL) {
        bool synchronize = false;

        MUTEX_LOCK(((cstreamData *)(ker.stream))->stream_lock);

        if (((cstreamData *)(ker.stream))->ev.status == C_SYNCHRONIZE) {
          // synchronize stream
          if (((cstreamData *)(ker.stream))->ev.numKernelsToWait > 0) {
            ((cstreamData *)(ker.stream))->ev.numKernelsToWait -= 1;
          }

          MUTEX_LOCK(((cstreamData *)(ker.stream))->stream_lock);

          if (((cstreamData *)(ker.stream))->ev.status == C_SYNCHRONIZE) {
            // synchronize stream
            if (((cstreamData *)(ker.stream))->ev.numKernelsToWait > 0) {
              ((cstreamData *)(ker.stream))->ev.numKernelsToWait -= 1;
            }

            if (((cstreamData *)(ker.stream))->ev.numKernelsToWait == 0) {
              synchronize = false;
            } else {
              synchronize = true;
            }
          }
          if (synchronize == false) {
            if (((cstreamData *)(ker.stream))->kernelQueue->waiting_count > 0) {
              ((cstreamData *)(ker.stream))->ev.status = C_WAIT;

              MUTEX_UNLOCK(((cstreamData *)(ker.stream))->stream_lock);
              cu_kernel *kern =
                  ((cstreamData *)(ker.stream))->kernelQueue->head;
              schedulerEnqueueKernel(&kern);
              dequeKernelLL(&((cstreamData *)(ker.stream))->kernelQueue);

            } else {

              // switch the stream to run to allow for the next execution
              ((cstreamData *)(ker.stream))->ev.status = C_RUN;

              MUTEX_UNLOCK(((cstreamData *)(ker.stream))->stream_lock);
            }
          }
        }
      }
      MUTEX_LOCK(scheduler->work_queue_lock);
      scheduler->num_kernel_finished += 1;
      MUTEX_UNLOCK(scheduler->work_queue_lock);
    }
  }

  MUTEX_LOCK(scheduler->work_queue_lock);

  if ((is_exit == 0 && is_command_not_null == 0)) {
    // all threads in condition wait
    scheduler->idle_threads += 1;
    pthread_cond_wait(&(scheduler->wake_pool), &(scheduler->work_queue_lock));
    scheduler->idle_threads -= 1;
    goto RETRY;
  }
  MUTEX_UNLOCK(scheduler->work_queue_lock);

  return is_exit;
}

void *driver_thread(void *p) {
  struct c_thread *td = (struct c_thread *)p;
  int is_exit = 0;
  td->exit = false;

  while (1) {
    // get work
    is_exit = get_work(td);

    // exit the routine
    if (is_exit) {
      td->exit = true;
      // pthread_exit
      pthread_exit(NULL);
    }
  }
}

/*
Initialize the scheduler
*/
int scheduler_init(cu_device device) {

  scheduler = (cu_pool *)calloc(1, sizeof(cu_pool));
  scheduler->num_worker_threads = device.max_compute_units;

  scheduler->thread_pool = (struct c_thread *)calloc(
      scheduler->num_worker_threads, sizeof(c_thread));
  kernel_queue *asq;
  create_KernelQueue(&asq);
  scheduler->kernelQueue = asq;

  INIT_LOCK(scheduler->work_queue_lock);
  pthread_cond_init(&scheduler->wake_pool, NULL);
  scheduler->idle_threads = 0;

  for (int i = 0; i < scheduler->num_worker_threads; i++) {
    scheduler->thread_pool[i].index = i;
    pthread_create(&scheduler->thread_pool[i].thread, NULL, driver_thread,
                   (void *)&scheduler->thread_pool[i]);
  }

  return C_SUCCESS;
}

void scheduler_uninit() {
  unsigned i;

  int r = pthread_mutex_lock(&scheduler->work_queue_lock);
  assert(r == 0);
  scheduler->threadpool_shutdown_requested = 1;
  pthread_cond_broadcast(&scheduler->wake_pool);

  int r1 = pthread_mutex_unlock(&scheduler->work_queue_lock);
  assert(r1 == 0);

  for (i = 0; i < scheduler->num_worker_threads; i++) {

    pthread_join(scheduler->thread_pool[i].thread, NULL);
  }
  free(scheduler->thread_pool);
  free(scheduler->kernelQueue);

  pthread_mutex_destroy(&scheduler->work_queue_lock);
  pthread_cond_destroy(&scheduler->wake_pool);

  scheduler->threadpool_shutdown_requested = 0;
}

int cuWait(cstreamData *evt) {

AGAIN:
  int r = pthread_mutex_lock(&evt->stream_lock);
  assert(r == 0);
  if (evt->ev.status != C_COMPLETE) {
    int r1 = pthread_mutex_unlock(&evt->stream_lock);
    assert(r1 == 0);
    goto AGAIN;
  }
  return C_SUCCESS;
}

/*
  Barrier for Kernel Launch

  During kernel launch, increment the number of work items required to finish
  Each kernel will point to the same event

  During Running Command, decrement the event.work_item count
  when count is 0, all work items for this kernel launch is finish

  Sense Like Barrier
  Counting Barrier basically
*/
void cuSynchronizeBarrier() {
AGAIN:

  MUTEX_LOCK(scheduler->work_queue_lock);

  if (scheduler->num_kernel_finished != scheduler->num_kernel_queued ||
      scheduler->idle_threads != scheduler->num_worker_threads) {
    MUTEX_UNLOCK(scheduler->work_queue_lock);
    goto AGAIN;
  } else {
    MUTEX_UNLOCK(scheduler->work_queue_lock);
  }
}
