create_project prj -part xc7z010-clg400-1 -force
set_property target_language verilog [current_project]
set vivado_ver [version -short]
set COE_DIR "../../syn/verilog"
source "C:/Users/hevos/Documents/CS4110/VitisHLS/LW3/KentStian/solution1/syn/verilog/fir_fadd_32ns_32ns_32_5_full_dsp_1_ip.tcl"
source "C:/Users/hevos/Documents/CS4110/VitisHLS/LW3/KentStian/solution1/syn/verilog/fir_fmul_32ns_32ns_32_4_max_dsp_1_ip.tcl"
source "C:/Users/hevos/Documents/CS4110/VitisHLS/LW3/KentStian/solution1/syn/verilog/fir_sitofp_32ns_32_6_no_dsp_1_ip.tcl"
source "C:/Users/hevos/Documents/CS4110/VitisHLS/LW3/KentStian/solution1/syn/verilog/fir_uitofp_32ns_32_6_no_dsp_1_ip.tcl"
