# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Users\hevos\Documents\CS4110\VitisIDE\nappemanncipher_system\_ide\scripts\systemdebugger_nappemanncipher_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Users\hevos\Documents\CS4110\VitisIDE\nappemanncipher_system\_ide\scripts\systemdebugger_nappemanncipher_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo 210279651807A" && level==0 && jtag_device_ctx=="jsn-Zybo-210279651807A-13722093-0"}
fpga -file C:/Users/hevos/Documents/CS4110/VitisIDE/nappemanncipher/_ide/bitstream/napcipher_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/hevos/Documents/CS4110/VitisIDE/napcipher_wrapper/export/napcipher_wrapper/hw/napcipher_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source C:/Users/hevos/Documents/CS4110/VitisIDE/nappemanncipher/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow C:/Users/hevos/Documents/CS4110/VitisIDE/nappemanncipher/Release/nappemanncipher.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
