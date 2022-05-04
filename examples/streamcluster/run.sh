#!/bin/bash
set -e
llvm-as streamcluster_cuda_cpu-cuda-nvptx64-nvidia-cuda-sm_61.ll
llvm-as streamcluster_cuda_cpu-host-x86_64-unknown-linux-gnu.ll
../../build/compilation/kernelTranslator streamcluster_cuda_cpu-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
../../build/compilation/hostTranslator streamcluster_cuda_cpu-host-x86_64-unknown-linux-gnu.bc host.bc
llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc

g++ -Wall -L../../build/runtime  -L../../build/runtime/threadPool -o sc_gpu -fPIC -no-pie host.o kernel.o -lc -lx86Runtime -lthreadPool -lpthread
export LD_LIBRARY_PATH=../../build/runtime:../../build/runtime/threadPool:$LD_LIBRARY_PATH
./sc_gpu 10 20 256 32 32 1000 none output.txt 1
if grep -q -e "0.966199 0.918044 0.348125" output.txt; then
    echo "Pass"
else
    echo "Error result"
    exit 1
fi
