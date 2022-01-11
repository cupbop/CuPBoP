#ifndef C_STRUCTURES_H
#define C_STRUCTURES_H

#include "pthread.h"
#define cudaStream_t cstreamData
typedef struct device {
  int max_compute_units;
  int device_id;
} cu_device;

typedef struct c_thread {
  pthread_t thread;
  unsigned long executed_commands;
  unsigned index;
  bool exit;
} cu_ptd;

typedef struct scheduler_pool {

  struct c_thread *thread_pool;

  size_t num_worker_threads;
  size_t local_mem_size;
  int num_kernel_launch;
  int num_kernel_finished;
  int num_kernel_queued;
  size_t idle_threads;

  pthread_cond_t wake_pool;

  int threadpool_shutdown_requested;

  // lock for scheduler
  pthread_mutex_t work_queue_lock;

  // C99 array at the end
  // user kernel queue for only user called functions
  struct kernel_queue *kernelQueue;

} cu_pool;

struct kernel_queue {

  struct kernel *head;
  struct kernel *tail;

  // finish command count
  unsigned long finish_count;

  // waiting to be run on threads
  unsigned long waiting_count;

  // running count
  unsigned long running_count;

  // total count
  unsigned long kernel_count;

  // current index for task to be run
  unsigned long current_index;
};

typedef struct command {

  struct kernel *ker;

  struct command *next;
  struct command *prev;

} cu_command;

typedef struct argument {
  // size of the argument to allocation
  size_t size;
  void *value;
  unsigned int index;
} cu_argument;

typedef struct input_arg {
  // real values for the input
  char *p;
  struct argument *argus[];
  // (TODO): implement meta_data
  // the type of metadata will need to change to list of ints or something
  // so that we can parse the arguments p
} cu_input;

struct dim3 {
  size_t x;
  size_t y;
  size_t z;
  dim3(int d1) {
    x = d1;
    y = z = 1;
  }
  dim3() { x = y = z = 1; }
};

enum StreamType {
  DEFAULT,
  LOW,
  HIGH,
  EXT,
};

struct cStreamDataInternal {
  /*
      status of the stream (run , wait)
      Run: Stream will asynchronously assign the kernel assign with this stream
      Wait: Stream will halt kernels from exiting the scheduler
  */
  int status;
  /*
     if status == wait, wait on the number of kernels to wait to become 0
  */
  unsigned long numKernelsToWait;
  unsigned int lastKernelIdToWait;
  unsigned int count; // number of task left in the stream
};

typedef struct streamData {

  // execution status of current event monitor
  struct cStreamDataInternal ev;
  pthread_mutex_t stream_lock; // lock on the stream
  StreamType stream_priority;
  unsigned int id;
  unsigned int stream_flags;

  // queue of the kernels in this stream
  struct kernel_queue *kernelQueue;

} cstreamData;
// kernel information
typedef struct kernel {

  void *(*start_routine)(void *);

  void **args;

  dim3 gridDim;
  dim3 blockDim;

  struct kernel *next;
  struct kernel *prev;

  size_t shared_mem;

  cstreamData *stream;

  struct event *barrier;

  int status;

  int totalBlocks;
  int N;

  int blockSize;
  int kernelId;

  // current blockId
  int blockId;

  void *shared_mem_loc;

} cu_kernel;

typedef struct asyncKernel {
  unsigned int numBlocks;
  unsigned int numThreads;
  struct event *evt;
  struct kernel *ker;

  struct asyncKernel *prev;
  struct asyncKernel *next;

} asyncKernel;

// command queue of command nodes

typedef struct kernel_arg_array {
  size_t size;
  unsigned int index;
} karg_arr;

typedef struct kernel_image_arg {
  size_t size;
  unsigned int index;
} k_arg;

#endif // HEADER_FILE
