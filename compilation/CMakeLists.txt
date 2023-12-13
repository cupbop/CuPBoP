cmake_minimum_required(VERSION 3.1 FATAL_ERROR)

set(CMAKE_VERBOSE_MAKEFILE ON)

# build kernel translator
include_directories(./KernelTranslation/include/cpu)
add_subdirectory(KernelTranslation)

add_executable(kernelTranslator KernelTranslation.cpp)
target_link_libraries(kernelTranslator spmd2mpmd ${GCC_COVERAGE_LINK_FLAGS})

# build host translator
include_directories(./HostTranslation/include/cpu)
add_subdirectory(HostTranslation)

add_executable(hostTranslator HostTranslation.cpp)

target_link_libraries(hostTranslator spmd2mpmd cudaRuntime2cpuRuntime
                      ${GCC_COVERAGE_LINK_FLAGS})
