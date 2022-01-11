#include "cudaRuntimeImpl.h"
#include "api.h"
#include <stdio.h>
#include <stdlib.h>
cudaError_t cudaDeviceReset(void) { scheduler_uninit(); }
cudaError_t cudaDeviceSynchronize(void) { cuSynchronizeBarrier(); }
cudaError_t cudaFree(void *devPtr) { free(devPtr); }
cudaError_t cudaLaunchKernel(const void *func, dim3 gridDim, dim3 blockDim,
                             void **args, size_t sharedMem,
                             cudaStream_t stream) {
  // if scheduler is null init device

  cu_kernel *ker =
      create_kernel(func, gridDim, blockDim, &args, sharedMem, stream);

  int lstatus = cuLaunchKernel(&ker);
}
cudaError_t cudaMalloc(void **devPtr, size_t size) {
  *devPtr = malloc(size);
  if (devPtr == NULL)
    return cudaErrorMemoryAllocation;
  return cudaSuccess;
}
cudaError_t cudaMemcpy(void *dst, const void *src, size_t count,
                       cudaMemcpyKind kind) {
  if (kind == cudaMemcpyHostToHost) {
    memcpy(dst, src, count);
  } else if (kind == cudaMemcpyDeviceToHost) {
    // how does the code know which device accessing the memory
    memcpy(dst, src, count);
  } else if (kind == cudaMemcpyHostToDevice) {
    // how does the code know which device accessing the memory
    memcpy(dst, src, count);
  } else if (kind == cudaMemcpyDeviceToHost) {
    // how does the code know which device accessing the memory
    memcpy(dst, src, count);
  } else if (kind == cudaMemcpyDeviceToDevice) {

    memcpy(dst, dst, count);
  } else if (kind == cudaMemcpyDefault) {
    memcpy(dst, src, count);
  }
  return cudaSuccess;
}

cudaError_t cudaSetDevice(int device) {
  // error checking
  init_device();
}

cudaError_t cudaStreamCopyAttributes(cudaStream_t dst, cudaStream_t src) {
  cstreamData *dst_stream = (cstreamData *)dst;
  cstreamData *src_stream = (cstreamData *)src;

  if (dst_stream == NULL || src_stream == NULL) {
    return cudaErrorInvalidValue; // 1
  }

  dst_stream->stream_priority = src_stream->stream_priority;
  dst_stream->stream_flags = src_stream->stream_flags;

  return cudaSuccess; // 0
}

cudaError_t cudaStreamCreate(cudaStream_t *pStream) {
  cstreamData *s = (cstreamData *)calloc(1, sizeof(cstreamData));
  if (s == NULL)
    return cudaErrorMemoryAllocation;
  s->ev.status = C_RUN;
  s->id = stream_counter;
  stream_counter++;
  s->stream_priority = DEFAULT;
  create_KernelQueue(&(s->kernelQueue));

  INIT_LOCK(s->stream_lock);
  *pStream = (cudaStream_t)(s);

  return cudaSuccess;
}

cudaError_t cudaStreamDestroy(cudaStream_t stream) {
  cstreamData *s = (cstreamData *)(stream);

  free(s->kernelQueue);

  DESTROY_LOCK(s->stream_lock);

  free(s);

  return cudaSuccess;
}

cudaError_t cudaStreamSynchronize(cudaStream_t stream) {
  cstreamData *e = ((cstreamData *)(stream));
  MUTEX_LOCK(e->stream_lock);

  e->ev.status = C_SYNCHRONIZE;
  e->ev.numKernelsToWait = e->kernelQueue->waiting_count;
  MUTEX_UNLOCK(e->stream_lock);
}
