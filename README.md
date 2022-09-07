# CuPBoP: Cuda for Parallelized and Broad-range Processors

## Introduction

CuPBoP is a framework which support executing unmodified CUDA source code
on non-NVIDIA devices.
Currently, CuPBoP support serveral CPU backends, including x86, AArch64, and RISC-V.
Supporting [Vortex](https://vortex.cc.gatech.edu/) backend is working in progress.

## Install

### Prerequisites

- Linux
- [LLVM 14.0.1](https://github.com/llvm/llvm-project/releases/tag/llvmorg-14.0.1)

### Installation

1. Clone from github

   ```bash
   git clone --recursive https://github.com/drcut/CuPBoP
   cd CuPBoP
   export CuPBoP_PATH=`pwd`
   export LD_LIBRARY_PATH=$CuPBoP_PATH/build/runtime:$CuPBoP_PATH/build/runtime/threadPool:$LD_LIBRARY_PATH
   ```

2. As CuPBoP relies on CUDA structures, we need to download the CUDA header file

   ```bash
   wget https://www.dropbox.com/s/r18io0zu3idke5p/cuda-header.tar.gz?dl=1
   tar -xzf 'cuda-header.tar.gz?dl=1'
   cp -r include/* runtime/threadPool/include/
   ```

3. Other CUDA files are also required for compiling CUDA source code to LLVM IR

   ```bash
   wget https://www.dropbox.com/s/4pckqsjnl920gpn/cuda-10.1.tar.gz?dl=1
   tar -xzf 'cuda-10.1.tar.gz?dl=1'
   ```

4. Build CuPBoP

   ```bash
   mkdir build && cd build
   cmake .. -DLLVM_CONFIG_PATH=`which llvm-config` # need path to llvm-config
   make
   ```

## Run HIST application in Hetero-mark benchmark

```bash
# Clone Hetero-mark benchmark
git clone https://github.com/drcut/SC_evaluate
cd SC_evaluate/Hetero-cox/src/hist
# Compile CUDA source code to LLVM IR
# this may raise error due to absence of CUDA library, just ignore them
clang++ -std=c++11 cuda/hist_cuda_benchmark.cu \\
    -I../.. --cuda-path=$CuPBoP_PATH/cuda-10.1 \\
    --cuda-gpu-arch=sm_50 -L$CuPBoP_PATH/cuda-10.1/lib64 \\
    -lcudart_static -ldl -lrt -pthread -save-temps -v  || true
# Translate host/kernel LLVM IR to formats that suitable for CPU
$CuPBoP_PATH/build/compilation/kernelTranslator \\
   hist_cuda_benchmark-cuda-nvptx64-nvidia-cuda-sm_50.bc kernel.bc
$CuPBoP_PATH/build/compilation/hostTranslator \\
   hist_cuda_benchmark-host-x86_64-unknown-linux-gnu.bc host.bc
# generate object files
llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc
# generate CPU executable file
g++ -o hist -fPIC -no-pie \\
-I$CuPBoP_PATH/runtime/threadPool/include \\
-L$CuPBoP_PATH/build/runtime  \\
-L$CuPBoP_PATH/build/runtime/threadPool \\
cuda/main.cc host.o kernel.o *.cc  ../common/benchmark/*.cc \\
../common/command_line_option/*.cc  ../common/time_measurement/*.cc \\
-I../.. -lpthread -lc -lx86Runtime -lthreadPool
# execute and verify
./hist -q -v
```

## How to contribute?

Any kinds of contributions are welcome.
Please refer to [Contribution.md](./CONTRIBUTING.md) for more detail.

## Related publications

- "COX: Exposing CUDA Warp-Level Functions to CPUs"
ACM Transactions on Architecture and Code Optimization
[link](https://dl.acm.org/doi/abs/10.1145/3554736)
- "CuPBoP: CUDA for Parallelized and Broad-range Processors"
arxiv preprint
[link](https://arxiv.org/abs/2206.07896)

## Contributors

- [Ruobing Han](https://drcut.github.io/)
- Jun Chen
- Bhanu Garg
- Xule Zhou
- John Lu
- [Chihyo Ahn](https://upcp.ece.gatech.edu/2021/09/01/chihyo-ahn/)
- Haotian Sheng
- Blaise Tine
- [Hyesoon Kim](https://faculty.cc.gatech.edu/~hyesoon/)
