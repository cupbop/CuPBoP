#ifndef __CUDA_HELPERS__
#define __CUDA_HELPERS__
#include <stdio.h>
/************************************************************************/
/* Init CUDA                                                            */
/************************************************************************/
#if __DEVICE_EMULATION__

bool InitCUDA(void) { return true; }

#else
bool InitCUDA(void) {

  cudaSetDevice(0);

  printf("CUDA initialized.\n");
  return true;
}
#endif
#endif
