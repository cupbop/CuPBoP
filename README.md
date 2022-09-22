# CuPBoP: Cuda for Parallelized and Broad-range Processors

## Introduction

CuPBoP is a framework which support executing unmodified CUDA source code
on non-NVIDIA devices.
Currently, CuPBoP support serveral CPU backends, including x86, AArch64, and RISC-V.
Supporting [Vortex](https://vortex.cc.gatech.edu/) (a RISC-V GPU) is working in progress.

## Install

### Prerequisites

- Linux system
- [LLVM 14.0.1](https://github.com/llvm/llvm-project/releases/tag/llvmorg-14.0.1)
- CUDA Toolkit

Although CuPBoP does not require NVIDIA GPUs,
it needs CUDA to compile the source programs to NVVM/LLVM IRs.
CUDA toolkit can be built on machines without NVIDIA GPUs.
For building CUDA toolkit, please refer to <https://developer.nvidia.com/cuda-downloads>.

### Installation

1. Clone from github

   ```bash
   git clone --recursive https://github.com/drcut/CuPBoP
   cd CuPBoP
   export CuPBoP_PATH=`pwd`
   export LD_LIBRARY_PATH=$CuPBoP_PATH/build/runtime:$CuPBoP_PATH/build/runtime/threadPool:$LD_LIBRARY_PATH
   export CUDA_PATH=/usr/local/cuda-11.7 # set to your own location
   ```

2. Build CuPBoP

   ```bash
   mkdir build && cd build
   #set -DDEBUG=ON for debugging
   cmake .. \
      -DLLVM_CONFIG_PATH=`which llvm-config` \
      -DCUDA_PATH=$CUDA_PATH
   make
   ```

## Run Vector Addition example

```bash
cd examples/vecadd
# Compile CUDA source code (both host and kernel) to bitcode files
clang++ -std=c++11 vecadd.cu \
      -I../.. --cuda-path=$CUDA_PATH \
      --cuda-gpu-arch=sm_50 -L$CUDA_PATH/lib64 \
      -lcudart_static -ldl -lrt -pthread -save-temps -v  || true
# Apply compilation transformations on the kernel bitcode file
$CuPBoP_PATH/build/compilation/kernelTranslator \
      vecadd-cuda-nvptx64-nvidia-cuda-sm_50.bc kernel.bc
# Apply compilation transformations on the host bitcode file
$CuPBoP_PATH/build/compilation/hostTranslator \
      vecadd-host-x86_64-unknown-linux-gnu.bc host.bc
# Generate object files
llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc
# Link with runtime libraries and generate the executable file
g++ -o vecadd -fPIC -no-pie \
      -I$CuPBoP_PATH/runtime/threadPool/include \
      -L$CuPBoP_PATH/build/runtime  \
      -L$CuPBoP_PATH/build/runtime/threadPool \
      host.o kernel.o \
      -I../.. -lc -lx86Runtime -lthreadPool -lpthread
# Execute
./vecadd
```

## How to contribute?

Any kinds of contributions are welcome.
Please refer to [Contribution.md](./CONTRIBUTING.md) for more detail.

## Related publications

If you want to refer CuPBoP in your projects, please cite the related
papers:

- [COX: Exposing CUDA Warp-Level Functions to CPUs](https://dl.acm.org/doi/abs/10.1145/3554736)
- [CuPBoP: CUDA for Parallelized and Broad-range Processors](https://arxiv.org/abs/2206.07896)

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
