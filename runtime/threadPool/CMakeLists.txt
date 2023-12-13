cmake_minimum_required(VERSION 3.1)

# C project
project(
  ThreadPool
  DESCRIPTION "Using pthread to implement ThreadPool"
  LANGUAGES CXX)

set(CMAKE_VERBOSE_MAKEFILE ON)
set(LIB_NAME threadPool)

set(CMAKE_CXX_STANDARD 14)
include_directories(../../common)
include_directories(./include)
include_directories(./include/cpu)
include_directories(../../external/moodycamel)

file(GLOB proj_SOURCES "src/cpu/*.cpp")
add_library(${LIB_NAME} SHARED ${proj_SOURCES})
