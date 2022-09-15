#include "cudaRuntimeImpl.h"
#include "api.h"
#include "cuda_runtime.h"
#include "debug.hpp"
#include "def.h"
#include "macros.h"
#include "structures.h"
#include <iostream>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
cudaError_t cudaGetDevice(int *devPtr) {
  *devPtr = 0;
  return cudaSuccess;
}
const char *cudaGetErrorName(cudaError_t error) { return "SUCCESS\n"; }
cudaError_t cudaDeviceReset(void) {
  scheduler_uninit();
  return cudaSuccess;
}
cudaError_t cudaDeviceSynchronize(void) {
  cuSynchronizeBarrier();
  return cudaSuccess;
}
cudaError_t cudaThreadSynchronize(void) {
  cuSynchronizeBarrier();
  return cudaSuccess;
}
cudaError_t cudaFree(void *devPtr) {
  free(devPtr);
  return cudaSuccess;
}
cudaError_t cudaFreeHost(void *devPtr) {
  free(devPtr);
  return cudaSuccess;
}

cudaError_t cudaLaunchKernel(const void *func, dim3 gridDim, dim3 blockDim,
                             void **args, size_t sharedMem,
                             cudaStream_t stream) {
  DEBUG_INFO(
      "cudaLaunchKernel : Grid: x:%d y:%d z:%d Block: %d, %d, %d ShMem: %d\n",
      gridDim.x, gridDim.y, gridDim.z, blockDim.x, blockDim.y, blockDim.z,
      sharedMem);

  cu_kernel *ker =
      create_kernel(func, gridDim, blockDim, args, sharedMem, stream);

  int lstatus = cuLaunchKernel(&ker);

  return cudaSuccess;
}
cudaError_t cudaMalloc(void **devPtr, size_t size) {
  *devPtr = malloc(size);
  if (devPtr == NULL)
    return cudaErrorMemoryAllocation;
  return cudaSuccess;
}
cudaError_t cudaMemset(void *devPtr, int value, size_t count) {
  memset(devPtr, value, count);
  return cudaSuccess;
}
cudaError_t cudaMemcpy(void *dst, const void *src, size_t count,
                       cudaMemcpyKind kind) {
  if (kind == cudaMemcpyHostToHost) {
    memcpy(dst, src, count);
  } else if (kind == cudaMemcpyDeviceToHost) {
    memcpy(dst, src, count);
  } else if (kind == cudaMemcpyHostToDevice) {
    memcpy(dst, src, count);
  } else if (kind == cudaMemcpyDeviceToHost) {
    memcpy(dst, src, count);
  } else if (kind == cudaMemcpyDeviceToDevice) {
    memcpy(dst, dst, count);
  } else if (kind == cudaMemcpyDefault) {
    memcpy(dst, src, count);
  }
  return cudaSuccess;
}

cudaError_t cudaMemcpyToSymbol_host(void *dst, const void *src, size_t count,
                                    size_t offset, cudaMemcpyKind kind) {
  assert(offset == 0 && "DO not support offset !=0\n");
  memcpy(dst, (char *)src + offset, count);
  return cudaSuccess;
}

cudaError_t cudaSetDevice(int device) {
  init_device();
  return cudaSuccess;
}

cudaError_t cudaStreamCopyAttributes(cudaStream_t dst, cudaStream_t src) {
  cstreamData *dst_stream = (cstreamData *)dst;
  cstreamData *src_stream = (cstreamData *)src;

  if (dst_stream == NULL || src_stream == NULL) {
    return cudaErrorInvalidValue;
  }

  dst_stream->stream_priority = src_stream->stream_priority;
  dst_stream->stream_flags = src_stream->stream_flags;

  return cudaSuccess;
}

static int stream_counter = 1;
/*
  cudaStream_t is a Opaque Structure
  Overwrites cudaStream_t into custom cstreamData structure
  (does hardware uses the cudaStream_t stream)
*/
cudaError_t cudaStreamCreate(cudaStream_t *pStream) {
  assert(0 && "cudaStreamCreate no Implement\n");
}

cudaError_t cudaStreamDestroy(cudaStream_t stream) {
  assert(0 && "cudaStreamDestroy No Implement\n");
}

cudaError_t cudaStreamSynchronize(cudaStream_t stream) {
  assert(0 && "cudaStreamSynchronize No Implement\n");
}

cudaError_t cudaGetDeviceCount(int *count) {
  // dummy value
  *count = 1;
  return cudaSuccess;
}

cudaError_t cudaGetDeviceProperties(cudaDeviceProp *deviceProp, int device) {
  // dummy values
  if (device == 0) {
    strcpy(deviceProp->name, "pthread");
    deviceProp->totalGlobalMem = 0;
    deviceProp->sharedMemPerBlock = 0;
    deviceProp->regsPerBlock = 0;
    deviceProp->warpSize = 0;
    deviceProp->memPitch = 0;
    deviceProp->maxThreadsPerBlock = 0;
    deviceProp->maxThreadsDim[0] = 1;
    deviceProp->maxThreadsDim[1] = 1;
    deviceProp->maxThreadsDim[2] = 1;

    deviceProp->maxGridSize[0] = 1;
    deviceProp->maxGridSize[1] = 1;
    deviceProp->maxGridSize[2] = 1;

    deviceProp->totalConstMem = 0;
    deviceProp->major = 0;
    deviceProp->minor = 0;
    deviceProp->clockRate = 0;
    deviceProp->textureAlignment = 0;
    deviceProp->deviceOverlap = false;
    deviceProp->multiProcessorCount = 0;
  }
  return cudaSuccess;
}

static cudaError_t lastError = cudaSuccess;
const char *cudaGetErrorString(cudaError_t error) {
  if (error == cudaSuccess) {
    return "Cuda Get Error Success";
  }
}

cudaError_t cudaGetLastError(void) { return lastError; }

static callParams callParamTemp;

/*
  Internal Cuda Library Functions
*/
extern "C" {

extern cudaError_t CUDARTAPI __cudaPopCallConfiguration(dim3 *gridDim,
                                                        dim3 *blockDim,
                                                        size_t *sharedMem,
                                                        void **stream) {
  DEBUG_INFO("__cudaPopCallConfiguration: Grid: x:%d y:%d z:%d Block: %d, %d, "
             "%d ShMem: %lu\n",
             gridDim->x, gridDim->y, gridDim->z, blockDim->x, blockDim->y,
             blockDim->z, *sharedMem);

  *gridDim = callParamTemp.gridDim;
  *blockDim = callParamTemp.blockDim;
  *sharedMem = callParamTemp.shareMem;
  *stream = callParamTemp.stream;

  return cudaSuccess;
}

extern __host__ __device__ unsigned CUDARTAPI __cudaPushCallConfiguration(
    dim3 gridDim, dim3 blockDim, size_t sharedMem = 0, void *stream = 0) {
  DEBUG_INFO("__cudaPushCallConfiguration: Grid: x:%d y:%d z:%d Block: %d, %d, "
             "%d ShMem: %lu\n",
             gridDim.x, gridDim.y, gridDim.z, blockDim.x, blockDim.y,
             blockDim.z, sharedMem);

  // memory checks allocations
  callParamTemp.gridDim = gridDim;
  callParamTemp.blockDim = blockDim;
  callParamTemp.shareMem = sharedMem;
  (callParamTemp.stream) = stream;
  return cudaSuccess;
}
}
