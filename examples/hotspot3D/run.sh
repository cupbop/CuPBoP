# # #!/bin/bash
set -e
llvm-as 3D-cuda-nvptx64-nvidia-cuda-sm_61.ll
llvm-as 3D-host-x86_64-unknown-linux-gnu.ll
../../build/compilation/kernelTranslator 3D-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
../../build/compilation/hostTranslator 3D-host-x86_64-unknown-linux-gnu.bc host.bc

llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc

g++ -g -Wall -L../../build/runtime  -L../../build/runtime/threadPool -o 3D \
    -fPIC -no-pie host.o kernel.o -lc -lx86Runtime -lthreadPool -lpthread

export LD_LIBRARY_PATH=../../build/runtime:../../build/runtime/threadPool:$LD_LIBRARY_PATH
./3D 512 8 100 ../../rodinia-data/hotspot3D/power_512x8 ../../rodinia-data/hotspot3D/temp_512x8 output.out

if head output.out | grep -q "334.017"; then
    echo "Pass"
else
    echo "Error result"
    exit 1
fi
