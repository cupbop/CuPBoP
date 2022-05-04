#!/bin/bash
set -e
llvm-as needle-cuda-nvptx64-nvidia-cuda-sm_61.ll
llvm-as needle-host-x86_64-unknown-linux-gnu.ll
../../build/compilation/kernelTranslator needle-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
../../build/compilation/hostTranslator needle-host-x86_64-unknown-linux-gnu.bc host.bc
llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc

g++ -Wall -L../../build/runtime \
     -L../../build/runtime/threadPool \
     -o needle -fPIC -no-pie host.o kernel.o -lc -lx86Runtime -lthreadPool -lpthread
export LD_LIBRARY_PATH=../../build/runtime:../../build/runtime/threadPool:$LD_LIBRARY_PATH
./needle 16 10
if grep -q -e "-11 -7 -5 -6 -7 -7 -4 -2 -2 2 -7 -9 -9 -7 -3 0" result.txt; then
    echo "Pass"
else
    echo "Error result"
    exit 1
fi
