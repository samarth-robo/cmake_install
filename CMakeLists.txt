cmake_minimum_required(VERSION 3.0)
project(StringGenerator)

add_library(stringadder SHARED
  src/StringAdder.h
  src/StringAdder.cpp)

add_executable(generate_string
  src/StringGenerator.cpp)
target_link_libraries(generate_string stringadder)
