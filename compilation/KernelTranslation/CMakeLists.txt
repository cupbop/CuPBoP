cmake_minimum_required(VERSION 3.1)

# C project
project(
  KernelTranslation
  DESCRIPTION
    "Translate SPMD Kernel to MPMD format with hierarchical collapsing"
  LANGUAGES CXX)

set(CMAKE_VERBOSE_MAKEFILE ON)
set(LIB_NAME spmd2mpmd)

set(CMAKE_CXX_STANDARD 14)
include_directories(./include/cpu)
include_directories(../../common)

file(GLOB proj_HEADERS "include/cpu/*.h")
file(GLOB proj_SOURCES "src/cpu/*.cpp")

# Add core library.
add_library(${LIB_NAME} STATIC ${proj_HEADERS} ${proj_SOURCES})
