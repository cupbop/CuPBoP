#!/bin/bash
set -e
llvm-as hotspot-cuda-nvptx64-nvidia-cuda-sm_61.ll
llvm-as hotspot-host-x86_64-unknown-linux-gnu.ll
../../build/compilation/kernelTranslator hotspot-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
../../build/compilation/hostTranslator hotspot-host-x86_64-unknown-linux-gnu.bc host.bc

llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc

g++ -Wall -L../../build/runtime  -L../../build/runtime/threadPool \
    -o hotspot -fPIC -no-pie host.o kernel.o -lc -lx86Runtime -lthreadPool -lpthread

export LD_LIBRARY_PATH=../../build/runtime:../../build/runtime/threadPool:$LD_LIBRARY_PATH
./hotspot 512 2 2 ../../rodinia-data/hotspot/temp_512 ../../rodinia-data/hotspot/power_512 output.out
if head output.out | grep -q "323.829"; then
    echo "Pass"
else
    echo "Error result"
    exit 1
fi
