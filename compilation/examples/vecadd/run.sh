#!/bin/bash
llvm-as kernel-cuda-nvptx64-nvidia-cuda-sm_61.ll
../../../build/compilation/kernelTranslator kernel-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc 1 1 1 32 1 1
llc --filetype=obj kernel.bc
g++ host.cpp kernel.o -lpthread -o test
./test
