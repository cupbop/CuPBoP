// This file is used for defining debug tools

#ifndef __DEBUG_TOOL__
#define __DEBUG_TOOL__

#include <stdio.h>

#ifdef DEBUG
#define DEBUG_INFO(...) fprintf(stderr, __VA_ARGS__)
#else
#define DEBUG_INFO(...)
#endif // DEBUG

#endif
