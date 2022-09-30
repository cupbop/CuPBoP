cmake_minimum_required(VERSION 3.1 FATAL_ERROR)
project(
  NVVM2X86
  DESCRIPTION "Translate NVVM IR to LLVM IR for X86 backend"
  LANGUAGES CXX)

set(CMAKE_VERBOSE_MAKEFILE ON)

# compile kernel translator
include_directories(./KernelTranslation/include/x86)
add_subdirectory(KernelTranslation)

add_executable(kernelTranslator KernelTranslation.cpp)
target_link_libraries(kernelTranslator spmd2mpmd ${GCC_COVERAGE_LINK_FLAGS})

# compile host translator
include_directories(./HostTranslation/include/x86)
add_subdirectory(HostTranslation)

add_executable(hostTranslator HostTranslation.cpp)

target_link_libraries(hostTranslator spmd2mpmd cudaRuntime2cpuRuntime
                      ${GCC_COVERAGE_LINK_FLAGS})
