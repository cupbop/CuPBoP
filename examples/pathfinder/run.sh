#!/bin/bash
set -e
llvm-as pathfinder-cuda-nvptx64-nvidia-cuda-sm_61.ll
llvm-as pathfinder-host-x86_64-unknown-linux-gnu.ll
../../build/compilation/kernelTranslator pathfinder-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
../../build/compilation/hostTranslator pathfinder-host-x86_64-unknown-linux-gnu.bc host.bc
llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc

g++ -Wall -L../../build/runtime \
     -L../../build/runtime/threadPool -o pathfinder \
    -fPIC -no-pie host.o kernel.o -lc -lx86Runtime -lthreadPool -lpthread
export LD_LIBRARY_PATH=../../build/runtime:../../build/runtime/threadPool:$LD_LIBRARY_PATH
./pathfinder 100000 100 20 > res.log
if grep -q "5 4 5 7 0 3 0 8 2" res.log; then
    echo "Pass"
else
    echo "Error result"
    exit 1
fi
