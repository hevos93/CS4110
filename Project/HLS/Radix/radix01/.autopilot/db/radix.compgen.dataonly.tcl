# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
input_r { 
	dir I
	width 8
	depth 8
	mode ap_memory
	offset 16
	offset_end 23
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
output_r { 
	dir O
	width 8
	depth 8
	mode ap_memory
	offset 24
	offset_end 31
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


