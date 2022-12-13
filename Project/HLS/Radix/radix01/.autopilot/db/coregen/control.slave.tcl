dict set slaves control {ports {input_r {type i_ap_memory width 8} output_r {type o_ap_memory width 8} ap_start {type ap_ctrl width 1} ap_done {type ap_ctrl width 1} ap_ready {type ap_ctrl width 1} ap_idle {type ap_ctrl width 1}} mems {input_r {width 8} output_r {width 8}} has_ctrl 1}
set datawidth 32
set addrwidth 64
set intr_clr_mode TOW
