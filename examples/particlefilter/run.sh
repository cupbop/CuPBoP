#!/bin/bash
set -e
llvm-as ex_particle_CUDA_naive_seq-cuda-nvptx64-nvidia-cuda-sm_61.ll
llvm-as ex_particle_CUDA_naive_seq-host-x86_64-unknown-linux-gnu.ll
../../build/compilation/kernelTranslator ex_particle_CUDA_naive_seq-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
../../build/compilation/hostTranslator ex_particle_CUDA_naive_seq-host-x86_64-unknown-linux-gnu.bc host.bc
llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc

g++ -Wall -L../../build/runtime  -L../../build/runtime/threadPool \
    -o particlefilter_naive -fPIC -no-pie \
    host.o kernel.o -lc -lx86Runtime -lthreadPool -lpthread
export LD_LIBRARY_PATH=../../build/runtime:../../build/runtime/threadPool:$LD_LIBRARY_PATH
./particlefilter_naive -x 128 -y 128 -z 10 -np 1000 > res.log
if grep -q -e "48.550541 48.550541 48.550541 48.550541" res.log; then
    echo "Pass"
else
    echo "Error result"
    exit 1
fi
