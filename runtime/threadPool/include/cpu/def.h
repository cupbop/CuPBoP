#ifndef C_DEF_H
#define C_DEF_H

// Error
#define C_SUCCESS 0x0
#define C_ERROR 0x1

// execution status
#define C_COMPLETE 0x2
#define C_RUNNING 0x3
#define C_SUBMITTED 0x4
#define C_QUEUED 0x5
#define C_CREATED 0x5

// stream status
#define C_RUN 0x1
#define C_WAIT 0x2
#define C_SYNCHRONIZE 0x3

// Not Initliazed Error
#define C_ERROR_NOT_INITIALIZED 0x6
#define C_ERROR_MEMALLOC 0x7

#define C_QUEUE_EMPTY 0x8

#endif
