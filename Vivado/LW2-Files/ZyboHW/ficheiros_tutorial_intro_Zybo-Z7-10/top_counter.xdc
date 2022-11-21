create_clock -period 8.000 -name clk -waveform {0.000 4.000} [get_ports clk]
set_input_jitter clk 0.050
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property PACKAGE_PIN K17 [get_ports clk]
set_property PACKAGE_PIN K18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property PACKAGE_PIN P15 [get_ports en]
set_property PACKAGE_PIN G15 [get_ports direction]
set_property IOSTANDARD LVCMOS33 [get_ports {count_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count_out[0]}]
set_property PACKAGE_PIN D18 [get_ports {count_out[3]}]
set_property PACKAGE_PIN G14 [get_ports {count_out[2]}]
set_property PACKAGE_PIN M15 [get_ports {count_out[1]}]
set_property PACKAGE_PIN M14 [get_ports {count_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports direction]
set_property IOSTANDARD LVCMOS33 [get_ports en]


















