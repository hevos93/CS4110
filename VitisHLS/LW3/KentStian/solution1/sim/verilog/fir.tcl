
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set cinoutgroup [add_wave_group "C InOuts" -into $designtopgroup]
set input_r__output_r__return_group [add_wave_group input_r__output_r__return(axi_slave) -into $cinoutgroup]
add_wave /apatb_fir_top/AESL_inst_fir/interrupt -into $input_r__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_fir_top/AESL_inst_fir/s_axi_control_BRESP -into $input_r__output_r__return_group -radix hex
add_wave /apatb_fir_top/AESL_inst_fir/s_axi_control_BREADY -into $input_r__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_fir_top/AESL_inst_fir/s_axi_control_BVALID -into $input_r__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_fir_top/AESL_inst_fir/s_axi_control_RRESP -into $input_r__output_r__return_group -radix hex
add_wave /apatb_fir_top/AESL_inst_fir/s_axi_control_RDATA -into $input_r__output_r__return_group -radix hex
add_wave /apatb_fir_top/AESL_inst_fir/s_axi_control_RREADY -into $input_r__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_fir_top/AESL_inst_fir/s_axi_control_RVALID -into $input_r__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_fir_top/AESL_inst_fir/s_axi_control_ARREADY -into $input_r__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_fir_top/AESL_inst_fir/s_axi_control_ARVALID -into $input_r__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_fir_top/AESL_inst_fir/s_axi_control_ARADDR -into $input_r__output_r__return_group -radix hex
add_wave /apatb_fir_top/AESL_inst_fir/s_axi_control_WSTRB -into $input_r__output_r__return_group -radix hex
add_wave /apatb_fir_top/AESL_inst_fir/s_axi_control_WDATA -into $input_r__output_r__return_group -radix hex
add_wave /apatb_fir_top/AESL_inst_fir/s_axi_control_WREADY -into $input_r__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_fir_top/AESL_inst_fir/s_axi_control_WVALID -into $input_r__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_fir_top/AESL_inst_fir/s_axi_control_AWREADY -into $input_r__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_fir_top/AESL_inst_fir/s_axi_control_AWVALID -into $input_r__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_fir_top/AESL_inst_fir/s_axi_control_AWADDR -into $input_r__output_r__return_group -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake(internal)" -into $designtopgroup]
add_wave /apatb_fir_top/AESL_inst_fir/ap_done -into $blocksiggroup
add_wave /apatb_fir_top/AESL_inst_fir/ap_idle -into $blocksiggroup
add_wave /apatb_fir_top/AESL_inst_fir/ap_ready -into $blocksiggroup
add_wave /apatb_fir_top/AESL_inst_fir/ap_start -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_fir_top/AESL_inst_fir/ap_rst_n -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_fir_top/AESL_inst_fir/ap_clk -into $clockgroup
set testbenchgroup [add_wave_group "Test Bench Signals"]
set tbinternalsiggroup [add_wave_group "Internal Signals" -into $testbenchgroup]
set tb_simstatus_group [add_wave_group "Simulation Status" -into $tbinternalsiggroup]
set tb_portdepth_group [add_wave_group "Port Depth" -into $tbinternalsiggroup]
add_wave /apatb_fir_top/AUTOTB_TRANSACTION_NUM -into $tb_simstatus_group -radix hex
add_wave /apatb_fir_top/ready_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_fir_top/done_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_fir_top/LENGTH_input_r -into $tb_portdepth_group -radix hex
add_wave /apatb_fir_top/LENGTH_output_r -into $tb_portdepth_group -radix hex
set tbcinoutgroup [add_wave_group "C InOuts" -into $testbenchgroup]
set tb_input_r__output_r__return_group [add_wave_group input_r__output_r__return(axi_slave) -into $tbcinoutgroup]
add_wave /apatb_fir_top/control_INTERRUPT -into $tb_input_r__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_fir_top/control_BRESP -into $tb_input_r__output_r__return_group -radix hex
add_wave /apatb_fir_top/control_BREADY -into $tb_input_r__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_fir_top/control_BVALID -into $tb_input_r__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_fir_top/control_RRESP -into $tb_input_r__output_r__return_group -radix hex
add_wave /apatb_fir_top/control_RDATA -into $tb_input_r__output_r__return_group -radix hex
add_wave /apatb_fir_top/control_RREADY -into $tb_input_r__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_fir_top/control_RVALID -into $tb_input_r__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_fir_top/control_ARREADY -into $tb_input_r__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_fir_top/control_ARVALID -into $tb_input_r__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_fir_top/control_ARADDR -into $tb_input_r__output_r__return_group -radix hex
add_wave /apatb_fir_top/control_WSTRB -into $tb_input_r__output_r__return_group -radix hex
add_wave /apatb_fir_top/control_WDATA -into $tb_input_r__output_r__return_group -radix hex
add_wave /apatb_fir_top/control_WREADY -into $tb_input_r__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_fir_top/control_WVALID -into $tb_input_r__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_fir_top/control_AWREADY -into $tb_input_r__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_fir_top/control_AWVALID -into $tb_input_r__output_r__return_group -color #ffff00 -radix hex
add_wave /apatb_fir_top/control_AWADDR -into $tb_input_r__output_r__return_group -radix hex
save_wave_config fir.wcfg
run all
quit

