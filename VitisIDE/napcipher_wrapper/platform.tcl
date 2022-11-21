# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\hevos\Documents\CS4110\VitisIDE\napcipher_wrapper\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\hevos\Documents\CS4110\VitisIDE\napcipher_wrapper\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {napcipher_wrapper}\
-hw {C:\Users\hevos\Documents\CS4110\Vivado\LW1\Nappemann\napcipher_wrapper.xsa}\
-out {C:/Users/hevos/Documents/CS4110/VitisIDE}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {napcipher_wrapper}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform generate
