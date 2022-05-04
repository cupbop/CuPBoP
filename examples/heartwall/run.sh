#!/bin/bash

cd AVI; make; cd ..;

clang++ -DOUTPUT main.cu -I./AVI  --cuda-path=/usr/local/cuda-10.1 --cuda-gpu-arch=sm_61 -L/usr/local/cuda-10.1/lib64 -lcudart_static -ldl -lrt -pthread -save-temps -v


/home/robinhan/repo/open_source_template/build/compilation/kernelTranslator main-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
/home/robinhan/repo/open_source_template/build/compilation/hostTranslator main-host-x86_64-unknown-linux-gnu.bc host.bc

llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc


g++ -Wall -L/home/robinhan/repo/open_source_template/build/runtime  -L/home/robinhan/repo/open_source_template/build/runtime/threadPool -o heartwall -fPIC -no-pie host.o kernel.o  ./AVI/avilib.o ./AVI/avimod.o -lc -lx86Runtime -lthreadPool -lpthread

./heartwall /home/robinhan/repo/open_source_template/runtime/examples/rodinia-data/heartwall/test.avi 20
