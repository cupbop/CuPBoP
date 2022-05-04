#!/bin/bash
set -e
llvm-as bfs-cuda-nvptx64-nvidia-cuda-sm_61.ll
llvm-as bfs-host-x86_64-unknown-linux-gnu.ll
../../build/compilation/kernelTranslator bfs-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
../../build/compilation/hostTranslator bfs-host-x86_64-unknown-linux-gnu.bc host.bc

llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc

g++ -Wall -L../../build/runtime  -L../../build/runtime/threadPool \
    -o bfs.out -fPIC -no-pie host.o kernel.o -lc -lx86Runtime -lthreadPool -lpthread

export LD_LIBRARY_PATH=../../build/runtime:../../build/runtime/threadPool:$LD_LIBRARY_PATH
./bfs.out ../../rodinia-data/bfs/graph65536.txt
if grep -q "0) cost:0" result.txt; then
    echo "Pass"
else
    echo "Error result"
    exit 1
fi
