# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\hevos\Documents\CS4110\VitisIDE\KentStian_Platform\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\hevos\Documents\CS4110\VitisIDE\KentStian_Platform\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {KentStian_Platform}\
-hw {C:\Users\hevos\Documents\CS4110\Vivado\LW3\KentStian\KentStian_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {C:/Users/hevos/Documents/CS4110/VitisIDE}

platform write
platform generate -domains 
platform generate
