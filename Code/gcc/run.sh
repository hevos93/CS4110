#!/bin/bash

cp ../radix/radix.c .
cp ../radix/radix.h .

gcc radix.c
./a.out
