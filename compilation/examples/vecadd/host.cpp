#include <assert.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define NUM_BLOCK 1
int N = 32;

int block_size = 32;
int block_size_x = block_size;
int block_size_y = 1;
int block_size_z = 1;
__thread int block_index = 0;
int grid_size = NUM_BLOCK;

extern "C" {
void *_Z9vectorAddPKfS0_Pfi_wrapper(void *);
}

void *wrap(void *p) {
  int **res = (int **)p;
  block_index = (*(int *)res[4]);
  _Z9vectorAddPKfS0_Pfi_wrapper(p);
  return NULL;
}

void *gen_input(int bid, float *A, float *B, float *C, int N) {
  int **ret = new int *[5];

  float **p0 = new float *;
  *p0 = A;
  ret[0] = (int *)(p0);

  float **p1 = new float *;
  *p1 = B;
  ret[1] = (int *)(p1);

  float **p2 = new float *;
  *p2 = C;
  ret[2] = (int *)(p2);

  int *p3 = new int;
  *p3 = N;
  ret[3] = (int *)p3;

  int *p4 = new int;
  *p4 = bid;
  ret[4] = (int *)p4;

  return (void *)ret;
}

int main() {
  float *A, *B, *C;

  A = new float[N];
  B = new float[N];
  C = new float[N];

  for (int i = 0; i < N; i++) {
    A[i] = i;
    B[i] = 1;
    C[i] = 0;
  }

  pthread_t threads[NUM_BLOCK];

  int rc;
  for (long t = 0; t < NUM_BLOCK; t++) {
    void *inp = gen_input(t, A, B, C, N);
    rc = pthread_create(&threads[t], NULL, wrap, inp);
  }
  clock_t t1 = clock();
  /* Last thing that main() should do */
  for (long t = 0; t < NUM_BLOCK; t++)
    pthread_join(threads[t], NULL);

  for (int i = 0; i < N; i++) {
    assert(C[i] == (A[i] + B[i]));
  }
  printf("PASS\n");
  pthread_exit(NULL);
}
