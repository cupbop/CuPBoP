#!/bin/bash
set -e
TestCase=$1
CUDA_PATH=$2
HeteroMark_PATH=$3
CuPBoP_BUILD_PATH=$4
DATASET_PATH=$5
if [ ! -d $DATASET_PATH ]; then
    echo "Download Hetero Mark dataset"
    mkdir $DATASET_PATH
    cd $DATASET_PATH
    wget https://www.dropbox.com/s/ie2hcxw9lfoghg8/data.tar.gz?dl=1
    tar -xzf 'data.tar.gz?dl=1'
    mv data/* .
fi

mkdir -p $TestCase
cd $TestCase
clang++ -std=c++11 $HeteroMark_PATH/src/$1/cuda/$1_cuda_benchmark.cu -I$HeteroMark_PATH \
        --cuda-path=$CUDA_PATH  \
        --cuda-gpu-arch=sm_50 -L$CUDA_PATH/lib64 \
        -lcudart_static -ldl -lrt -pthread -save-temps -v  || true
export LD_LIBRARY_PATH=$CuPBoP_BUILD_PATH/runtime:$CuPBoP_BUILD_PATH/runtime/threadPool:$LD_LIBRARY_PATH
export PATH=$CuPBoP_BUILD_PATH/compilation:$PATH
kernelTranslator $1_cuda_benchmark-cuda-nvptx64-nvidia-cuda-sm_50.bc kernel.bc
hostTranslator $1_cuda_benchmark-host-x86_64-unknown-linux-gnu.bc host.bc
llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc
g++ -o $1 -fPIC -no-pie \
    $HeteroMark_PATH/src/$1/cuda/main.cc host.o kernel.o $HeteroMark_PATH/src/$1/*.cc  $HeteroMark_PATH/src/common/benchmark/*.cc \
    $HeteroMark_PATH/src/common/command_line_option/*.cc  $HeteroMark_PATH/src/common/time_measurement/*.cc \
    -L$CuPBoP_BUILD_PATH/runtime   -L$CuPBoP_BUILD_PATH/runtime/threadPool \
    -I$HeteroMark_PATH -I$CUDA_PATH/include -lpthread -lc -lCPUruntime -lthreadPool

case $1 in
  aes)
    ./$1 -i $DATASET_PATH/aes/1KB.data -k $DATASET_PATH/aes/key.data -q -v
    ;;

  bs)
    ./$1 -q -v
    ;;

  ep)
    ./$1 -q -v -m 10 -x 64
    ;;

  fir)
    ./$1 -q -v
    ;;

#   ga)
#     ./$1 -q -i $DATASET_PATH/ga/1024_64.data -v
#     ;;

  hist)
    ./$1 -q -v
    ;;

  kmeans)
    ./$1 -i $DATASET_PATH/kmeans/100_34.txt -q -v
    ;;

  pr)
    ./$1 -i $DATASET_PATH/pr/512.data -q -v
    ;;

  *)
    echo -n "unknown"
    ;;
esac
