#include "api.h"
#include "def.h"
#include "macros.h"
#include "structures.h"
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <thread>
#include "blockingconcurrentqueue.h"

/*


*/

/*
Initialize the device
*/
int device_max_compute_units = 1;
int init_device()
{
  cu_device *device = (cu_device *)calloc(1, sizeof(cu_device));
  if (device == NULL)
    return C_ERROR_MEMALLOC;

  device->max_compute_units = std::thread::hardware_concurrency();
  device->max_compute_units = 4;
  std::cout << device->max_compute_units
            << " concurrent threads are supported.\n";
  device_max_compute_units = device->max_compute_units;

  // initialize scheduler
  int ret = scheduler_init(*device);
  if (ret != C_SUCCESS)
    return ret;

  return C_SUCCESS;
}

// Create Kernel
static int kernelIds = 0;
cu_kernel *create_kernel(const void *func, dim3 gridDim, dim3 blockDim,
                         void **args, size_t sharedMem, cudaStream_t stream)
{
  cu_kernel *ker = (cu_kernel *)calloc(1, sizeof(cu_kernel));

  // set the function pointer
  ker->start_routine = (void *(*)(void *))func;
  ker->args = args;

  ker->gridDim = gridDim;
  ker->blockDim = blockDim;

  ker->shared_mem = sharedMem;

  ker->stream = stream;

  ker->totalBlocks = gridDim.x * gridDim.y * gridDim.z;

  ker->blockSize = blockDim.x * blockDim.y * blockDim.z;
  return ker;
}

// scheduler
static cu_pool *scheduler;

__thread int block_size = 0;
__thread int block_size_x = 0;
__thread int block_size_y = 0;
__thread int block_size_z = 0;
__thread int grid_size_x = 0;
__thread int grid_size_y = 0;
__thread int grid_size_z = 0;
__thread int block_index = 0;
__thread int block_index_x = 0;
__thread int block_index_y = 0;
__thread int block_index_z = 0;
__thread int thread_memory_size = 0;
__thread int *dynamic_shared_memory = NULL;
__thread int warp_shfl[32] = {
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
};

/*
    Enqueue Kernel (k) to the scheduler kernelQueue
*/
int schedulerEnqueueKernel(cu_kernel *k)
{
  int totalBlocks = k->totalBlocks; // calculate gpu_block_to_execute_per_cpu_thread
  int gpuBlockToExecutePerCpuThread =
      (totalBlocks + device_max_compute_units - 1) /
      device_max_compute_units;
  for (int startBlockIdx = 0; startBlockIdx < totalBlocks; startBlockIdx += gpuBlockToExecutePerCpuThread)
  {
    cu_kernel *p = new cu_kernel(*k);
    p->startBlockId = startBlockIdx;
    p->endBlockId = std::min(startBlockIdx + gpuBlockToExecutePerCpuThread - 1, totalBlocks - 1);
    scheduler->kernelQueue->enqueue(p);
  }

  printf("total: %d  execute per cpu: %d\n", totalBlocks,
         gpuBlockToExecutePerCpuThread);
  return C_SUCCESS;
}

/*
  Kernel Launch with numBlocks and numThreadsPerBlock
*/
int cuLaunchKernel(cu_kernel **k)
{
  if (!scheduler)
  {
    init_device();
  }
  std::cout << "launch\n"
            << std::flush;
  // Calculate Block Size N/numBlocks
  cu_kernel *ker = *k;
  int status = C_RUN;
  // stream == 0 add to the kernelQueue
  if (ker->stream == 0)
  {
    schedulerEnqueueKernel(ker);
  }
  else
  {
    printf("MultiStream no implemente\n");
    exit(1);
  }
  return 0;
}

/*
    Thread Gets Work
*/
int get_work(c_thread *th)
{
  int dynamic_shared_mem_size = 0;
  dim3 gridDim;
  dim3 blockDim;
  while (true)
  {
    // try to get a task from the queue
    cu_kernel *k;
    bool getTask = scheduler->kernelQueue->wait_dequeue_timed(k, std::chrono::milliseconds(5));
    if (getTask)
    {
      // set runtime configuration
      gridDim = k->gridDim;
      blockDim = k->blockDim;
      dynamic_shared_mem_size = k->shared_mem;
      block_size = k->blockSize;
      block_size_x = blockDim.x;
      block_size_y = blockDim.y;
      block_size_z = blockDim.z;
      grid_size_x = gridDim.x;
      grid_size_y = gridDim.y;
      grid_size_z = gridDim.z;
      if (dynamic_shared_mem_size > 0)
        dynamic_shared_memory = (int *)malloc(dynamic_shared_mem_size);
      // execute GPU blocks
      printf("exec: from: %d to : %d\n",k->startBlockId, k->endBlockId);
      for (block_index = k->startBlockId; block_index < k->endBlockId + 1; block_index++)
      {
        int tmp = block_index;
        block_index_x = tmp / (grid_size_y * grid_size_z);
        tmp = tmp % (grid_size_y * grid_size_z);
        block_index_y = tmp / (grid_size_z);
        tmp = tmp % (grid_size_z);
        block_index_z = tmp;
        k->start_routine(k->args);
      }
      printf("done: from: %d to : %d\n",k->startBlockId, k->endBlockId);
    }
    // if cannot get tasks, check whether programs stop
    else if (scheduler->threadpool_shutdown_requested)
    {
      return true; // thread exit
    }
  }
  return 0;
}

void *driver_thread(void *p)
{
  struct c_thread *td = (struct c_thread *)p;
  int is_exit = 0;
  td->exit = false;
  // get work
  printf("before getwork\n");
  is_exit = get_work(td);
  printf("after getwork\n");

  // exit the routine
  if (is_exit)
  {
    td->exit = true;
    // pthread_exit
    printf("pthread exit\n");
    pthread_exit(NULL);
  }
  else
  {
    printf("driver thread stop incorrectly\n");
    exit(1);
  }
}

/*
Initialize the scheduler
*/
int scheduler_init(cu_device device)
{
  scheduler = (cu_pool *)calloc(1, sizeof(cu_pool));
  scheduler->num_worker_threads = device.max_compute_units;
  scheduler->num_kernel_queued = 0;

  scheduler->thread_pool = (struct c_thread *)calloc(
      scheduler->num_worker_threads, sizeof(c_thread));
  scheduler->kernelQueue = new kernel_queue;

  scheduler->idle_threads = 0;
  for (int i = 0; i < scheduler->num_worker_threads; i++)
  {
    scheduler->thread_pool[i].index = i;
    pthread_create(&scheduler->thread_pool[i].thread, NULL, driver_thread,
                   (void *)&scheduler->thread_pool[i]);
  }

  return C_SUCCESS;
}

void scheduler_uninit()
{
  printf("No Implemente\n");
  exit(1);
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
void cuSynchronizeBarrier()
{
  while (scheduler->kernelQueue->size_approx() > 0)
    ;
  printf("size: %d\n",scheduler->kernelQueue->size_approx());
}
