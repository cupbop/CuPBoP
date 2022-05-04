#!/bin/bash
set -e
clang -c -emit-llvm util/timer/timer.c
clang -c -emit-llvm util/num/num.c
#clang -c -emit-llvm util/cuda/cuda.cu --cuda-gpu-arch=sm_61
#clang -c -emit-llvm kernel/kernel_gpu_cuda_wrapper.cu --cuda-gpu-arch=sm_61
#clang++ kernel/kernel_gpu_cuda_wrapper.cu  --cuda-path=/usr/local/cuda-10.1 --cuda-gpu-arch=sm_61 -L/usr/local/cuda-10.1/lib64 -lcudart_static -ldl -lrt -pthread -save-temps -v
#clang++ kernel/kernel_gpu_cuda_wrapper_2.cu  --cuda-path=/usr/local/cuda-10.1 --cuda-gpu-arch=sm_61 -L/usr/local/cuda-10.1/lib64 -lcudart_static -ldl -lrt -pthread -save-temps -v
clang -c -emit-llvm main.c

llvm-as kernel_gpu_cuda_wrapper-cuda-nvptx64-nvidia-cuda-sm_61.ll
llvm-as kernel_gpu_cuda_wrapper_2-cuda-nvptx64-nvidia-cuda-sm_61.ll
llvm-as kernel_gpu_cuda_wrapper-host-x86_64-unknown-linux-gnu.ll
llvm-as kernel_gpu_cuda_wrapper_2-host-x86_64-unknown-linux-gnu.ll
../../build/compilation/kernelTranslator kernel_gpu_cuda_wrapper-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel1.bc
../../build/compilation/kernelTranslator kernel_gpu_cuda_wrapper_2-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel2.bc
../../build/compilation/hostTranslator kernel_gpu_cuda_wrapper-host-x86_64-unknown-linux-gnu.bc host1.bc
../../build/compilation/hostTranslator kernel_gpu_cuda_wrapper_2-host-x86_64-unknown-linux-gnu.bc host2.bc

llc --relocation-model=pic --filetype=obj  main.bc
llc --relocation-model=pic --filetype=obj  cuda.bc
llc --relocation-model=pic --filetype=obj  num.bc
llc --relocation-model=pic --filetype=obj  timer.bc
llc --relocation-model=pic --filetype=obj  kernel1.bc
llc --relocation-model=pic --filetype=obj  kernel2.bc
llc --relocation-model=pic --filetype=obj  host1.bc
llc --relocation-model=pic --filetype=obj  host2.bc
export LD_LIBRARY_PATH=../../build/runtime:../../build/runtime/threadPool:$LD_LIBRARY_PATH
g++ -Wall -L../../build/runtime  -L../../build/runtime/threadPool -o b+tree.out \
    -fPIC -no-pie main.o host1.o host2.o kernel1.o kernel2.o cuda.o num.o timer.o \
    -lc -lx86Runtime -lthreadPool -lpthread

./b+tree.out file ../../rodinia-data/b+tree/mil.txt \
    command ../../rodinia-data/b+tree/command.txt
if grep -q "0    840187    6001" output.txt; then
    echo "Pass"
else
    echo "Error result"
    exit 1
fi
