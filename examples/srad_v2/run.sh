#!/bin/bash
set -e
llvm-as srad-cuda-nvptx64-nvidia-cuda-sm_61.ll
llvm-as srad-host-x86_64-unknown-linux-gnu.ll
../../build/compilation/kernelTranslator srad-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
../../build/compilation/hostTranslator srad-host-x86_64-unknown-linux-gnu.bc host.bc

llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc

g++ -Wall -L../../build/runtime \
     -L../../build/runtime/threadPool \
     -o srad -fPIC -no-pie host.o kernel.o -lc -lx86Runtime -lthreadPool -lpthread
export LD_LIBRARY_PATH=../../build/runtime:../../build/runtime/threadPool:$LD_LIBRARY_PATH
./srad 2048 2048 0 127 0 127 0.5 2 > res.log
if grep -q "1.98368 2.16545 1.72989" res.log; then
    echo "Pass"
else
    echo "Error result"
    exit 1
fi
