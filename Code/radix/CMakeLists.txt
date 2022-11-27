cmake_minimum_required(VERSION 3.23)
project(radix C)

set(CMAKE_C_STANDARD 99)

add_executable(radix original.c radix.c radix.h tb.c)
