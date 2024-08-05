#include <cstdio>
#include <random>
#include <stdint.h>
#include <sys/time.h>

__global__ void Histogram(uint32_t *pixels, uint32_t *histogram,
                          uint32_t num_colors, uint32_t num_pixels) {
  int tid = blockIdx.x * blockDim.x + threadIdx.x;
  int gsize = gridDim.x * blockDim.x;

  uint32_t priv_hist[256];
  for (uint32_t i = 0; i < num_colors; i++) {
    priv_hist[i] = 0;
  }
  uint32_t index = tid;
  while (index < num_pixels) {
    uint32_t color = pixels[index];
    priv_hist[color]++;
    index += gsize;
  }

  __syncthreads();
  for (uint32_t i = 0; i < num_colors; i++) {
    if (priv_hist[i] > 0) {
      atomicAdd(histogram + i, priv_hist[i]);
    }
  }
}

__global__ void opt_Histogram(uint32_t *pixels, uint32_t *histogram,
                              uint32_t num_colors, uint32_t num_pixels) {
  int tid = blockIdx.x * blockDim.x + threadIdx.x;
  int gsize = gridDim.x * blockDim.x;

  uint32_t priv_hist[256];
  for (uint32_t i = 0; i < num_colors; i++) {
    priv_hist[i] = 0;
  }
  uint32_t index = tid;
  __shared__ bool has_activated_thread;
  bool activated = true;
  do {
    has_activated_thread = false;
    __syncthreads();
    activated = activated & (index < num_pixels);
    has_activated_thread |= activated;
    if (activated) {
      uint32_t color = pixels[index];
      priv_hist[color]++;
      index += gsize;
    }
  } while (has_activated_thread);
  __syncthreads();
  for (uint32_t i = 0; i < num_colors; i++) {
    if (priv_hist[i] > 0) {
      atomicAdd(histogram + i, priv_hist[i]);
    }
  }
}

timeval time_start, time_end;
unsigned int totalKernelTime;

int main() {
  int num_pixel_ = 7;
  int num_color_ = 256;
  uint32_t *pixels_ = new uint32_t[num_pixel_ * 2];
  unsigned int seed = 42;
  for (uint32_t i = 0; i < num_pixel_ * 2; i++) {
    pixels_[i] = rand_r(&seed) % num_color_;
  }

  uint32_t *opt_histogram_ = new uint32_t[num_color_]();
  uint32_t *no_opt_histogram_ = new uint32_t[num_color_]();

  uint32_t *d_histogram;
  uint32_t *d_pixels;
  cudaMalloc(&d_pixels, num_pixel_ * 2 * sizeof(uint32_t));
  cudaMemcpy(d_pixels, pixels_, num_pixel_ * 2 * sizeof(uint32_t),
             cudaMemcpyHostToDevice);
  // optimized
  cudaMalloc(&d_histogram, num_color_ * sizeof(uint32_t));
  opt_Histogram<<<8192 / 64, 64>>>(d_pixels, d_histogram, num_color_,
                                   num_pixel_);
  cudaDeviceSynchronize();
  cudaMemcpy(opt_histogram_, d_histogram, num_color_ * sizeof(uint32_t),
             cudaMemcpyDeviceToHost);

  // unoptimized
  cudaMalloc(&d_histogram, num_color_ * sizeof(uint32_t));
  Histogram<<<8192 / 64, 64>>>(d_pixels, d_histogram, num_color_, num_pixel_);
  cudaDeviceSynchronize();
  cudaMemcpy(no_opt_histogram_, d_histogram, num_color_ * sizeof(uint32_t),
             cudaMemcpyDeviceToHost);
  for (int i = 0; i < num_color_; i++) {
    if (no_opt_histogram_[i] != opt_histogram_[i]) {
      printf("Error!\n");
      printf("%d %d\n", no_opt_histogram_[i], opt_histogram_[i]);
      exit(1);
    }
  }
  printf("PASS\n");
  return 0;
}
