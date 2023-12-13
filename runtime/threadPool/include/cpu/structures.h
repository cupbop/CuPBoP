#ifndef C_STRUCTURES_H
#define C_STRUCTURES_H

#include "blockingconcurrentqueue.h"
#include "cuda_runtime.h"
#include "pthread.h"

typedef struct device {
  int max_compute_units;
  int device_id;
} cu_device;

typedef struct c_thread {
  pthread_t thread;
  unsigned long executed_commands;
  unsigned index;
  bool exit;
  bool busy;
  int completeTask;
} cu_ptd;

// kernel information
typedef struct kernel {

  void *(*start_routine)(void *);

  void **args;

  dim3 gridDim;
  dim3 blockDim;

  size_t shared_mem;

  cudaStream_t stream;

  struct event *barrier;

  int status;

  int totalBlocks;

  int blockSize;

  int startBlockId;
  int endBlockId;

  kernel(const kernel &obj)
      : start_routine(obj.start_routine), args(obj.args),
        shared_mem(obj.shared_mem), blockSize(obj.blockSize),
        gridDim(obj.gridDim), blockDim(obj.blockDim),
        totalBlocks(obj.totalBlocks) {}
} cu_kernel;

using kernel_queue = moodycamel::BlockingConcurrentQueue<kernel *>;

typedef struct scheduler_pool {

  struct c_thread *thread_pool;

  size_t num_worker_threads;
  size_t local_mem_size;
  int num_kernel_launch;
  int num_kernel_finished;
  int num_kernel_queued;
  size_t idle_threads;

  pthread_cond_t wake_pool;
  pthread_cond_t wake_host;

  int threadpool_shutdown_requested;

  // lock for scheduler
  pthread_mutex_t work_queue_lock;

  kernel_queue *kernelQueue;

} cu_pool;

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

  kernel_queue *kernelQueue;

} cstreamData;

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

typedef struct callParams {
  dim3 gridDim;
  dim3 blockDim;
  size_t shareMem;
  void *stream;
} callParams;

#endif // HEADER_FILE
