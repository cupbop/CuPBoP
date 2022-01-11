#include <assert.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#define NUM_WARP 2
#define NUM_BLOCK 1

int block_size = 32 * NUM_WARP;
int block_size_x = block_size;
int block_size_y = 1;
int block_size_z = 1;
__thread int block_index = 0;
int grid_size = NUM_BLOCK;

extern "C" {
void *_Z7reduce0PiS_j_wrapper(void *);
__thread int warp_shfl[32];
}

void *wrap(void *p) {
  int **res = (int **)p;
  block_index = (*(int *)res[3]);
  _Z7reduce0PiS_j_wrapper(p);
  return NULL;
}

void *gen_input(int bid, int *g_idata, int *g_odata, unsigned int n) {
  int **ret = new int *[4];

  int **p0 = new int *;
  *p0 = g_idata;
  ret[0] = (int *)(p0);

  int **p1 = new int *;
  *p1 = g_odata;
  ret[1] = (int *)(p1);

  unsigned int *p2 = new unsigned int;
  *p2 = n;
  ret[2] = (int *)p2;

  int *p3 = new int;
  *p3 = bid;
  ret[3] = (int *)p3;

  return (void *)ret;
}

int main(int argc, char *argv[]) {
  int *g_idata;

  int size = block_size * NUM_BLOCK;
  g_idata = new int[size * 2];
  int *res = new int[size];

  for (int i = 0; i < size; i++) {
    g_idata[i] = i;
  }

  pthread_t threads[NUM_BLOCK];

  void *inp[NUM_BLOCK];
  for (long t = 0; t < NUM_BLOCK; t++) {
    inp[t] = gen_input(t, g_idata, res, size);
  }

  for (long t = 0; t < NUM_BLOCK; t++) {
    pthread_create(&threads[t], NULL, wrap, inp[t]);
  }
  for (long t = 0; t < NUM_BLOCK; t++)
    pthread_join(threads[t], NULL);
  int gold = 0;
  for (int i = 0; i < size; i++) {
    gold += g_idata[i];
  }
  assert(*res == gold && "Incorrect res\n");
  printf("PASS\n");

  pthread_exit(NULL);
}
