#ifndef __RUNTIME_IMPL__
#define __RUNTIME_IMPL__
#include "structures.h"
#include <stdint.h>
extern "C" {
cudaError_t cudaGetDevice(int *devPtr);
const char *cudaGetErrorname(cudaError_t);
cudaError_t cudaDeviceReset(void);
cudaError_t cudaDeviceSynchronize(void);
cudaError_t cudaThreadSynchronize(void);
cudaError_t cudaFree(void *devPtr);
cudaError_t cudaLaunchKernel(const void *func, dim3 gridDim, dim3 blockDim,
                             void **args, size_t sharedMem,
                             cudaStream_t stream);
cudaError_t cudaMalloc(void **devPtr, size_t size);
cudaError_t cudaMemcpy(void *dst, const void *src, size_t count,
                       cudaMemcpyKind kind);
cudaError_t cudaMemcpyToSymbol_host(void *dst, const void *src, size_t count,
                                    size_t offset, cudaMemcpyKind kind);
cudaError_t cudaMemset(void *devPtr, int value, size_t count);
cudaError_t cudaSetDevice(int device);
cudaError_t cudaStreamCopyAttributes(cudaStream_t dst, cudaStream_t src);
cudaError_t cudaStreamCreate(cudaStream_t *pStream);
cudaError_t cudaStreamDestroy(cudaStream_t stream);
cudaError_t cudaStreamSynchronize(cudaStream_t stream);
}
#endif
