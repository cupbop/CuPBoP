# COX: CUDA on X86

## Introduction

This project consists of two parts: a series of LLVM passes that
achieve a SPMD NVVM IR as input, and output the corresponding
MPMD+SIMD version of LLVM IR which can be execute on CPU devices.

## Install

### Prerequisites

* Linux: Verified on Ubuntu 18.04
* LLVM10.0
* NVIDIA CUDA-toolkit
* x86 CPU
* pthread
* GCC 7.5.0

### Installation

1. Clone from github

    ```bash
    git clone https://github.com/drcut/open_source_template
    cd open_source_template
    ```

2. Build the transformer for NVVM IR to LLVM IR for X86

    ```bash
    mkdir build && cd build
    cmake .. -DLLVM_CONFIG_PATH=`which llvm-config` # need path to llvm-config
    make
    ```

## Run Vecadd samples

```bash
# Generate bitcode from human-readable LLVM IR
llvm-as ../compilation/examples/vecadd/kernel-cuda-nvptx64-nvidia-cuda-sm_61.ll
# use LLVM passes to transform NVVM IR (SPMD) to LLVM IR (MPMD+SIMD).
# NOTE: we hard-code the grid size (1, 1, 1)
# and block size (1024, 1, 1) into the generated LLVM IR
./compilation/nvvm2x86 \
    ../compilation/examples/vecadd/kernel-cuda-nvptx64-nvidia-cuda-sm_61.bc \
    kernel.bc 1 1 1 32 1 1
# generate object file from LLVM IR
llc --filetype=obj kernel.bc
# link generated kernel function
# with host function and generate excutable file
g++ ../compilation/examples/vecadd/host.cpp \
    kernel.o -lpthread -o vecadd_example
# execute the executable file
./vecadd_example
```

## Author

[Ruobing Han](https://drcut.github.io/) is a CS phd student in
Georgia Institute Technology, under the supervision
of Prof. [Hyesoon Kim](https://www.cc.gatech.edu/~hyesoon/).
