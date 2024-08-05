#include <cstdio>
#include <random>
#include <stdint.h>
#include <sys/time.h>

const int SIZE = 512;
__global__ void vecadd(int *a, int *b, int *c) {
  int tid = blockIdx.x * blockDim.x + threadIdx.x;
  if (tid < SIZE) {
    c[tid] += a[tid] + b[tid];
  }
}

int main() {
  int *h_a, *h_b, *h_c;
  h_a = (int *)malloc(SIZE * sizeof(int));
  h_b = (int *)malloc(SIZE * sizeof(int));
  h_c = (int *)malloc(SIZE * sizeof(int));

  for (int i = 0; i < SIZE; i++) {
    h_a[i] = i;
    h_b[i] = 2 * i;
    h_c[i] = 0;
  }
  int *d_a, *d_b, *d_c;
  cudaMalloc(&d_a, SIZE * sizeof(int));
  cudaMalloc(&d_b, SIZE * sizeof(int));
  cudaMalloc(&d_c, SIZE * sizeof(int));

  cudaMemcpy(d_a, h_a, SIZE * sizeof(int), cudaMemcpyHostToDevice);
  cudaMemcpy(d_b, h_b, SIZE * sizeof(int), cudaMemcpyHostToDevice);
  cudaMemcpy(d_c, h_c, SIZE * sizeof(int), cudaMemcpyHostToDevice);

  vecadd<<<SIZE/16, 16>>>(d_a, d_b, d_c);

  cudaMemcpy(h_c, d_c, SIZE * sizeof(int), cudaMemcpyDeviceToHost);

  // Verify the result
  for (int i = 0; i < SIZE; i++) {
    if (h_c[i] != (h_a[i] + h_b[i])) {
      printf("Error at index %d\n", i);
      return 1;
    }
  }
  printf("PASS\n");
  return 0;
}
