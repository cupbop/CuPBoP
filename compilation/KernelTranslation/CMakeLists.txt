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
set(CMAKE_BUILD_TYPE Debug)
include_directories(./include)

file(GLOB proj_HEADERS "include/*.h")
file(GLOB proj_SOURCES "lib/*.cpp")

# Add core library.
add_library(${LIB_NAME} SHARED ${proj_HEADERS} ${proj_SOURCES})
