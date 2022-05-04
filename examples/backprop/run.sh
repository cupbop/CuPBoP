#!/bin/bash
set -e
clang -c -emit-llvm backprop.c
clang -c -emit-llvm facetrain.c
clang -c -emit-llvm imagenet.c

llvm-as backprop_cuda-cuda-nvptx64-nvidia-cuda-sm_61.ll
llvm-as backprop_cuda-host-x86_64-unknown-linux-gnu.ll
../../build/compilation/kernelTranslator backprop_cuda-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
../../build/compilation/hostTranslator backprop_cuda-host-x86_64-unknown-linux-gnu.bc host.bc

llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc
llc --relocation-model=pic --filetype=obj  backprop.bc
llc --relocation-model=pic --filetype=obj  facetrain.bc
llc --relocation-model=pic --filetype=obj  imagenet.bc
export LD_LIBRARY_PATH=../../build/runtime:../../build/runtime/threadPool:$LD_LIBRARY_PATH
g++ -Wall -L../../build/runtime  -L../../build/runtime/threadPool -o demo \
    -fPIC -no-pie host.o kernel.o backprop.o facetrain.o imagenet.o \
    -lc -lx86Runtime -lthreadPool -lpthread

./demo 1024 > res.log
if grep -q -e "0.173289 0.259645 0.350836" res.log; then
    echo "Pass"
else
    echo "Error result"
    exit 1
fi
