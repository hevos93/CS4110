set SynModuleInfo {
  {SRCNAME radix_Pipeline_VITIS_LOOP_66_1 MODELNAME radix_Pipeline_VITIS_LOOP_66_1 RTLNAME radix_radix_Pipeline_VITIS_LOOP_66_1
    SUBMODULES {
      {MODELNAME radix_flow_control_loop_pipe_sequential_init RTLNAME radix_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME radix_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME radix_Pipeline_VITIS_LOOP_9_1 MODELNAME radix_Pipeline_VITIS_LOOP_9_1 RTLNAME radix_radix_Pipeline_VITIS_LOOP_9_1}
  {SRCNAME radix_Pipeline_VITIS_LOOP_20_1 MODELNAME radix_Pipeline_VITIS_LOOP_20_1 RTLNAME radix_radix_Pipeline_VITIS_LOOP_20_1
    SUBMODULES {
      {MODELNAME radix_sdiv_32ns_32ns_32_36_1 RTLNAME radix_sdiv_32ns_32ns_32_36_1 BINDTYPE op TYPE sdiv IMPL auto LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME radix_srem_32ns_5ns_32_36_1 RTLNAME radix_srem_32ns_5ns_32_36_1 BINDTYPE op TYPE srem IMPL auto LATENCY 35 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME radix_Pipeline_VITIS_LOOP_26_2 MODELNAME radix_Pipeline_VITIS_LOOP_26_2 RTLNAME radix_radix_Pipeline_VITIS_LOOP_26_2}
  {SRCNAME radix_Pipeline_VITIS_LOOP_30_3 MODELNAME radix_Pipeline_VITIS_LOOP_30_3 RTLNAME radix_radix_Pipeline_VITIS_LOOP_30_3
    SUBMODULES {
      {MODELNAME radix_srem_32ns_5ns_3_36_1 RTLNAME radix_srem_32ns_5ns_3_36_1 BINDTYPE op TYPE srem IMPL auto LATENCY 35 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME radix_Pipeline_VITIS_LOOP_34_4 MODELNAME radix_Pipeline_VITIS_LOOP_34_4 RTLNAME radix_radix_Pipeline_VITIS_LOOP_34_4}
  {SRCNAME radix_Pipeline_VITIS_LOOP_38_5 MODELNAME radix_Pipeline_VITIS_LOOP_38_5 RTLNAME radix_radix_Pipeline_VITIS_LOOP_38_5}
  {SRCNAME radix_Pipeline_VITIS_LOOP_43_6 MODELNAME radix_Pipeline_VITIS_LOOP_43_6 RTLNAME radix_radix_Pipeline_VITIS_LOOP_43_6}
  {SRCNAME radix MODELNAME radix RTLNAME radix IS_TOP 1
    SUBMODULES {
      {MODELNAME radix_sdiv_32ns_32ns_32_36_seq_1 RTLNAME radix_sdiv_32ns_32ns_32_36_seq_1 BINDTYPE op TYPE sdiv IMPL auto_seq LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME radix_srem_32ns_5ns_5_36_seq_1 RTLNAME radix_srem_32ns_5ns_5_36_seq_1 BINDTYPE op TYPE srem IMPL auto_seq LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME radix_vla1_RAM_AUTO_1R1W RTLNAME radix_vla1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME radix_count_RAM_AUTO_1R1W RTLNAME radix_count_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME radix_output_RAM_AUTO_1R1W RTLNAME radix_output_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME radix_control_s_axi RTLNAME radix_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
