#!/bin/bash
set -e
llvm-as gaussian-cuda-nvptx64-nvidia-cuda-sm_61.ll
llvm-as gaussian-host-x86_64-unknown-linux-gnu.ll
../../build/compilation/kernelTranslator gaussian-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
../../build/compilation/hostTranslator gaussian-host-x86_64-unknown-linux-gnu.bc host.bc

llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc

g++ -Wall -L../../build/runtime \
     -L../../build/runtime/threadPool \
     -o gaussian -fPIC -no-pie host.o kernel.o -lc -lx86Runtime -lthreadPool -lpthread

export LD_LIBRARY_PATH=../../build/runtime:../../build/runtime/threadPool:$LD_LIBRARY_PATH
./gaussian -f ../../rodinia-data/gaussian/matrix4.txt >> res.log

if grep -q "0.70 0.00 -0.40 -0.50" res.log; then
    echo "Pass"
else
    echo "Error result"
    exit 1
fi
