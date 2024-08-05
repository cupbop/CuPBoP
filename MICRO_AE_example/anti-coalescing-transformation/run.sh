#!/bin/bash
set -e
clang++ -std=c++11 hist.cu --cuda-path=$CUDA_PATH \
    --cuda-gpu-arch=sm_50 -L$CUDA_PATH/lib64 \
    -lcudart_static -ldl -lrt -pthread -save-temps -v

kernelTranslator hist-cuda-nvptx64-nvidia-cuda-sm_50.bc hist-host-x86_64-unknown-linux-gnu.bc kernel.bc
hostTranslator hist-host-x86_64-unknown-linux-gnu.bc host.bc

llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc

g++ -o hist -fPIC -no-pie -L$CuPBoP_BUILD_PATH/runtime \
  -L$CuPBoP_BUILD_PATH/runtime/threadPool \
  host.o kernel.o -lpthread -lc -lx86Runtime -lthreadPool

./hist
