############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project demo
set_top substitute
add_files ../../../Code/demo/substitute.c
add_files ../../../Code/demo/substitute.h
add_files -tb ../../../Code/demo/tb.c
open_solution "solution1" -flow_target vivado
set_part {xcvu11p-flga2577-1-e}
create_clock -period 10 -name default
#source "./demo/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
