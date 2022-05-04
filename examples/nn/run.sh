#!/bin/bash
set -e
llvm-as nn_cuda-cuda-nvptx64-nvidia-cuda-sm_61.ll
llvm-as nn_cuda-host-x86_64-unknown-linux-gnu.ll
../../build/compilation/kernelTranslator nn_cuda-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
../../build/compilation/hostTranslator nn_cuda-host-x86_64-unknown-linux-gnu.bc host.bc

llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc

g++ -Wall -L../../build/runtime  -L../../build/runtime/threadPool \
    -o nn -fPIC -no-pie host.o kernel.o -lc -lx86Runtime -lthreadPool -lpthread

export LD_LIBRARY_PATH=../../build/runtime:../../build/runtime/threadPool:$LD_LIBRARY_PATH
./nn filelist_4 -r 3 -lat 30 -lng 90 >> res.log
if grep -q "1988 12 27  0 18 TONY       30.0  89.8  113   39 --> Distance=0.199997" res.log; then
    echo "Pass"
else
    echo "Error result"
    exit 1
fi
