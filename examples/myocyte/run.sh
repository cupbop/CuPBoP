#!/bin/bash
set -e
llvm-as main-cuda-nvptx64-nvidia-cuda-sm_61.ll
llvm-as main-host-x86_64-unknown-linux-gnu.ll
../../build/compilation/kernelTranslator main-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
../../build/compilation/hostTranslator main-host-x86_64-unknown-linux-gnu.bc host.bc

llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc

g++ -Wall -L../../build/runtime  -L../../build/runtime/threadPool \
    -o myocyte.out -fPIC -no-pie host.o kernel.o \
    -lc -lx86Runtime -lthreadPool -lpthread -lm

./myocyte.out 100 1 0
if grep -q "1.3705539" output.txt; then
    echo "Pass"
else
    echo "Error result"
    exit 1
fi
