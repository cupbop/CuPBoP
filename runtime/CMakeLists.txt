cmake_minimum_required(VERSION 3.1 FATAL_ERROR)
project(
  CPUruntime
  DESCRIPTION "Implementation CUDA runtime API with CPUs"
  LANGUAGES CXX)
set(LIB_NAME CPUruntime)
set(CMAKE_VERBOSE_MAKEFILE ON)

# compile threadPool implementation
add_subdirectory(threadPool)

# compile x86 runtime library
include_directories(../common)
include_directories(./include/)
include_directories(./include/cpu)
include_directories(./threadPool/include/)
include_directories(./threadPool/include/cpu)
include_directories(../external/moodycamel/)
file(GLOB proj_SOURCES "src/cpu/*.cpp")
add_library(${LIB_NAME} SHARED ${proj_SOURCES})
