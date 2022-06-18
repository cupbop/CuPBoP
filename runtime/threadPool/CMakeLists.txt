cmake_minimum_required(VERSION 3.1)

# C project
project(
  ThreadPool
  DESCRIPTION "Using pthread to implement ThreadPool"
  LANGUAGES CXX)

set(CMAKE_VERBOSE_MAKEFILE ON)
set(LIB_NAME threadPool)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_BUILD_TYPE Debug)
include_directories(./include)
include_directories(./include/x86)

file(GLOB proj_SOURCES "src/x86/*.cpp")
add_library(${LIB_NAME} SHARED ${proj_SOURCES})
