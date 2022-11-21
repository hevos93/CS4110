############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project KentStian
set_top fir
add_files CS4110-HLS-Tutorial-master/CS4110-HLS-Tutorial-master/src/hls/fir.h
add_files CS4110-HLS-Tutorial-master/CS4110-HLS-Tutorial-master/src/hls/fir.c
add_files -tb CS4110-HLS-Tutorial-master/CS4110-HLS-Tutorial-master/src/hls/tb.c -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z010-clg400-1}
create_clock -period 10 -name default
config_export -format ip_catalog -output C:/Users/hevos/Documents/CS4110/VitisHLS/LW3/KentStianZip -rtl verilog
source "./KentStian/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -trace_level all
export_design -rtl verilog -format ip_catalog -output C:/Users/hevos/Documents/CS4110/VitisHLS/LW3/KentStianZip
