#include <cstdio>
#include <random>
#include <stdint.h>
#include <sys/time.h>

__global__ void vecadd(int *a, int *b, int *c, int n) {
  int tid = blockIdx.x * blockDim.x + threadIdx.x;
  if (tid < n) {
    c[tid] += a[tid] + b[tid];
  }
}

int main() {
  int size = 512;
  int *h_a, *h_b, *h_c;
  h_a = (int *)malloc(size * sizeof(int));
  h_b = (int *)malloc(size * sizeof(int));
  h_c = (int *)malloc(size * sizeof(int));

  for (int i = 0; i < size; i++) {
    h_a[i] = i;
    h_b[i] = 2 * i;
    h_c[i] = 0;
  }
  int *d_a, *d_b, *d_c;
  cudaMalloc(&d_a, size * sizeof(int));
  cudaMalloc(&d_b, size * sizeof(int));
  cudaMalloc(&d_c, size * sizeof(int));

  cudaMemcpy(d_a, h_a, size * sizeof(int), cudaMemcpyHostToDevice);
  cudaMemcpy(d_b, h_b, size * sizeof(int), cudaMemcpyHostToDevice);
  cudaMemcpy(d_c, h_c, size * sizeof(int), cudaMemcpyHostToDevice);

  // Launch with different block size
  vecadd<<<std::ceil(size / 16.0), 16>>>(d_a, d_b, d_c, size);
  vecadd<<<std::ceil(size / 32.0), 32>>>(d_a, d_b, d_c, size);
  vecadd<<<std::ceil(size / 42.0), 42>>>(d_a, d_b, d_c, size);

  cudaMemcpy(h_c, d_c, size * sizeof(int), cudaMemcpyDeviceToHost);

  // Verify the result
  for (int i = 0; i < size; i++) {
    if (h_c[i] != 3 * (h_a[i] + h_b[i])) {
      printf("Error at index %d\n", i);
      return 1;
    }
  }
  printf("PASS\n");
  return 0;
}
