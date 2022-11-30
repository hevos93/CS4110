############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Radix
set_top radix
add_files ../../Code/radix/radix.c
add_files ../../Code/radix/radix.h
add_files -tb ../../Code/radix/tb.c -cflags "-Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "radix01" -flow_target vivado
set_part {xcvu11p-flga2577-1-e}
create_clock -period 10 -name default
source "./Radix/radix01/directives.tcl"
csim_design
csynth_design
cosim_design -trace_level all
export_design -format ip_catalog
