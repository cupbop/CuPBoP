#ifndef C_MACROS_H
#define C_MACROS_H
#include "assert.h"
#include <pthread.h>

#define INIT_LOCK(__LOCK__)                                                    \
  {                                                                            \
    do {                                                                       \
      int r = pthread_mutex_init(&(__LOCK__), NULL);                           \
      assert(r == 0);                                                          \
    } while (0);                                                               \
  }

#define MUTEX_LOCK(__LOCK__)                                                   \
  {                                                                            \
    do {                                                                       \
      int r = pthread_mutex_lock(&(__LOCK__));                                 \
      assert(r == 0);                                                          \
    } while (0);                                                               \
  }

#define MUTEX_UNLOCK(__LOCK__)                                                 \
  {                                                                            \
    do {                                                                       \
      int r = pthread_mutex_unlock(&(__LOCK__));                               \
      assert(r == 0);                                                          \
    } while (0);                                                               \
  }

#define DESTROY_LOCK(__LOCK__)                                                 \
  {                                                                            \
    do {                                                                       \
      int r = pthread_mutex_destroy(&(__LOCK__));                              \
      assert(r == 0);                                                          \
    } while (0);                                                               \
  }

#endif // HEADER_FILE
