-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fir is
generic (
    C_S_AXI_CONTROL_ADDR_WIDTH : INTEGER := 5;
    C_S_AXI_CONTROL_DATA_WIDTH : INTEGER := 32 );
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    s_axi_control_AWVALID : IN STD_LOGIC;
    s_axi_control_AWREADY : OUT STD_LOGIC;
    s_axi_control_AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_ADDR_WIDTH-1 downto 0);
    s_axi_control_WVALID : IN STD_LOGIC;
    s_axi_control_WREADY : OUT STD_LOGIC;
    s_axi_control_WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH-1 downto 0);
    s_axi_control_WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH/8-1 downto 0);
    s_axi_control_ARVALID : IN STD_LOGIC;
    s_axi_control_ARREADY : OUT STD_LOGIC;
    s_axi_control_ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_ADDR_WIDTH-1 downto 0);
    s_axi_control_RVALID : OUT STD_LOGIC;
    s_axi_control_RREADY : IN STD_LOGIC;
    s_axi_control_RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH-1 downto 0);
    s_axi_control_RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    s_axi_control_BVALID : OUT STD_LOGIC;
    s_axi_control_BREADY : IN STD_LOGIC;
    s_axi_control_BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    interrupt : OUT STD_LOGIC );
end;


architecture behav of fir is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "fir_fir,hls_ip_2022_2,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z010-clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.256000,HLS_SYN_LAT=39,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=755,HLS_SYN_LUT=1526,HLS_VERSION=2022_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000001000000000";
    constant ap_ST_fsm_state11 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000010000000000";
    constant ap_ST_fsm_state12 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000100000000000";
    constant ap_ST_fsm_state13 : STD_LOGIC_VECTOR (22 downto 0) := "00000000001000000000000";
    constant ap_ST_fsm_state14 : STD_LOGIC_VECTOR (22 downto 0) := "00000000010000000000000";
    constant ap_ST_fsm_state15 : STD_LOGIC_VECTOR (22 downto 0) := "00000000100000000000000";
    constant ap_ST_fsm_state16 : STD_LOGIC_VECTOR (22 downto 0) := "00000001000000000000000";
    constant ap_ST_fsm_state17 : STD_LOGIC_VECTOR (22 downto 0) := "00000010000000000000000";
    constant ap_ST_fsm_state18 : STD_LOGIC_VECTOR (22 downto 0) := "00000100000000000000000";
    constant ap_ST_fsm_state19 : STD_LOGIC_VECTOR (22 downto 0) := "00001000000000000000000";
    constant ap_ST_fsm_state20 : STD_LOGIC_VECTOR (22 downto 0) := "00010000000000000000000";
    constant ap_ST_fsm_state21 : STD_LOGIC_VECTOR (22 downto 0) := "00100000000000000000000";
    constant ap_ST_fsm_state22 : STD_LOGIC_VECTOR (22 downto 0) := "01000000000000000000000";
    constant ap_ST_fsm_state23 : STD_LOGIC_VECTOR (22 downto 0) := "10000000000000000000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_14 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010100";
    constant ap_const_lv32_15 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010101";
    constant C_S_AXI_DATA_WIDTH : INTEGER range 63 downto 0 := 20;
    constant ap_const_lv32_B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001011";
    constant ap_const_lv32_16 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010110";
    constant ap_const_lv32_3F000000 : STD_LOGIC_VECTOR (31 downto 0) := "00111111000000000000000000000000";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_3EAAAAAB : STD_LOGIC_VECTOR (31 downto 0) := "00111110101010101010101010101011";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";
    constant ap_const_lv32_1E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011110";
    constant ap_const_lv9_181 : STD_LOGIC_VECTOR (8 downto 0) := "110000001";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv8_7F : STD_LOGIC_VECTOR (7 downto 0) := "01111111";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_18 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011000";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_start : STD_LOGIC;
    signal ap_done : STD_LOGIC;
    signal ap_idle : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal ap_ready : STD_LOGIC;
    signal input_r : STD_LOGIC_VECTOR (7 downto 0);
    signal output_r : STD_LOGIC_VECTOR (7 downto 0);
    signal output_r_ap_vld : STD_LOGIC;
    signal shift_reg_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal input_r_read_reg_250 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal grp_fu_110_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv7_reg_275 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal grp_fu_102_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul8_reg_280 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state11 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state11 : signal is "none";
    signal grp_fu_97_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal acc_reg_288 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state16 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state16 : signal is "none";
    signal xs_exp_V_reg_293 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_CS_fsm_state21 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state21 : signal is "none";
    signal p_Result_s_fu_150_p1 : STD_LOGIC_VECTOR (22 downto 0);
    signal p_Result_s_reg_299 : STD_LOGIC_VECTOR (22 downto 0);
    signal isNeg_fu_163_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal isNeg_reg_304 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state22 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state22 : signal is "none";
    signal ush_fu_180_p3 : STD_LOGIC_VECTOR (8 downto 0);
    signal ush_reg_309 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_ap_start : STD_LOGIC;
    signal grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_ap_done : STD_LOGIC;
    signal grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_ap_idle : STD_LOGIC;
    signal grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_ap_ready : STD_LOGIC;
    signal grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_acc_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_acc_out_ap_vld : STD_LOGIC;
    signal grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_97_p_din0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_97_p_din1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_97_p_opcode : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_97_p_ce : STD_LOGIC;
    signal grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_102_p_din0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_102_p_din1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_102_p_ce : STD_LOGIC;
    signal grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_ap_start_reg : STD_LOGIC := '0';
    signal grp_fu_107_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state12 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state12 : signal is "none";
    signal ap_CS_fsm_state23 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state23 : signal is "none";
    signal grp_fu_97_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_97_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state17 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state17 : signal is "none";
    signal grp_fu_102_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_102_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal grp_fu_107_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_110_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal data_V_fu_136_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln346_fu_154_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal add_ln346_fu_157_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal sub_ln1512_fu_171_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal sext_ln1512_fu_176_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal mantissa_fu_188_p4 : STD_LOGIC_VECTOR (24 downto 0);
    signal sext_ln1488_fu_201_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln68_fu_197_p1 : STD_LOGIC_VECTOR (54 downto 0);
    signal zext_ln1488_fu_204_p1 : STD_LOGIC_VECTOR (54 downto 0);
    signal r_V_fu_208_p2 : STD_LOGIC_VECTOR (54 downto 0);
    signal tmp_fu_220_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal r_V_1_fu_214_p2 : STD_LOGIC_VECTOR (54 downto 0);
    signal zext_ln818_fu_228_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_1_fu_232_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_97_ce : STD_LOGIC;
    signal grp_fu_102_ce : STD_LOGIC;
    signal grp_fu_107_ce : STD_LOGIC;
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal grp_fu_110_ce : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (22 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ST_fsm_state7_blk : STD_LOGIC;
    signal ap_ST_fsm_state8_blk : STD_LOGIC;
    signal ap_ST_fsm_state9_blk : STD_LOGIC;
    signal ap_ST_fsm_state10_blk : STD_LOGIC;
    signal ap_ST_fsm_state11_blk : STD_LOGIC;
    signal ap_ST_fsm_state12_blk : STD_LOGIC;
    signal ap_ST_fsm_state13_blk : STD_LOGIC;
    signal ap_ST_fsm_state14_blk : STD_LOGIC;
    signal ap_ST_fsm_state15_blk : STD_LOGIC;
    signal ap_ST_fsm_state16_blk : STD_LOGIC;
    signal ap_ST_fsm_state17_blk : STD_LOGIC;
    signal ap_ST_fsm_state18_blk : STD_LOGIC;
    signal ap_ST_fsm_state19_blk : STD_LOGIC;
    signal ap_ST_fsm_state20_blk : STD_LOGIC;
    signal ap_ST_fsm_state21_blk : STD_LOGIC;
    signal ap_ST_fsm_state22_blk : STD_LOGIC;
    signal ap_ST_fsm_state23_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component fir_fir_Pipeline_VITIS_LOOP_18_1 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        shift_reg_0_load : IN STD_LOGIC_VECTOR (31 downto 0);
        acc_out : OUT STD_LOGIC_VECTOR (31 downto 0);
        acc_out_ap_vld : OUT STD_LOGIC;
        grp_fu_97_p_din0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        grp_fu_97_p_din1 : OUT STD_LOGIC_VECTOR (31 downto 0);
        grp_fu_97_p_opcode : OUT STD_LOGIC_VECTOR (1 downto 0);
        grp_fu_97_p_dout0 : IN STD_LOGIC_VECTOR (31 downto 0);
        grp_fu_97_p_ce : OUT STD_LOGIC;
        grp_fu_102_p_din0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        grp_fu_102_p_din1 : OUT STD_LOGIC_VECTOR (31 downto 0);
        grp_fu_102_p_dout0 : IN STD_LOGIC_VECTOR (31 downto 0);
        grp_fu_102_p_ce : OUT STD_LOGIC );
    end component;


    component fir_fadd_32ns_32ns_32_5_full_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component fir_fmul_32ns_32ns_32_4_max_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component fir_uitofp_32ns_32_6_no_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component fir_sitofp_32ns_32_6_no_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component fir_control_s_axi IS
    generic (
        C_S_AXI_ADDR_WIDTH : INTEGER;
        C_S_AXI_DATA_WIDTH : INTEGER );
    port (
        AWVALID : IN STD_LOGIC;
        AWREADY : OUT STD_LOGIC;
        AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        WVALID : IN STD_LOGIC;
        WREADY : OUT STD_LOGIC;
        WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH/8-1 downto 0);
        ARVALID : IN STD_LOGIC;
        ARREADY : OUT STD_LOGIC;
        ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        RVALID : OUT STD_LOGIC;
        RREADY : IN STD_LOGIC;
        RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        BVALID : OUT STD_LOGIC;
        BREADY : IN STD_LOGIC;
        BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        input_r : OUT STD_LOGIC_VECTOR (7 downto 0);
        output_r : IN STD_LOGIC_VECTOR (7 downto 0);
        output_r_ap_vld : IN STD_LOGIC;
        ap_start : OUT STD_LOGIC;
        interrupt : OUT STD_LOGIC;
        ap_ready : IN STD_LOGIC;
        ap_done : IN STD_LOGIC;
        ap_idle : IN STD_LOGIC );
    end component;



begin
    grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89 : component fir_fir_Pipeline_VITIS_LOOP_18_1
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_ap_start,
        ap_done => grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_ap_done,
        ap_idle => grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_ap_idle,
        ap_ready => grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_ap_ready,
        shift_reg_0_load => shift_reg_0,
        acc_out => grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_acc_out,
        acc_out_ap_vld => grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_acc_out_ap_vld,
        grp_fu_97_p_din0 => grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_97_p_din0,
        grp_fu_97_p_din1 => grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_97_p_din1,
        grp_fu_97_p_opcode => grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_97_p_opcode,
        grp_fu_97_p_dout0 => grp_fu_97_p2,
        grp_fu_97_p_ce => grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_97_p_ce,
        grp_fu_102_p_din0 => grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_102_p_din0,
        grp_fu_102_p_din1 => grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_102_p_din1,
        grp_fu_102_p_dout0 => grp_fu_102_p2,
        grp_fu_102_p_ce => grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_102_p_ce);

    control_s_axi_U : component fir_control_s_axi
    generic map (
        C_S_AXI_ADDR_WIDTH => C_S_AXI_CONTROL_ADDR_WIDTH,
        C_S_AXI_DATA_WIDTH => C_S_AXI_CONTROL_DATA_WIDTH)
    port map (
        AWVALID => s_axi_control_AWVALID,
        AWREADY => s_axi_control_AWREADY,
        AWADDR => s_axi_control_AWADDR,
        WVALID => s_axi_control_WVALID,
        WREADY => s_axi_control_WREADY,
        WDATA => s_axi_control_WDATA,
        WSTRB => s_axi_control_WSTRB,
        ARVALID => s_axi_control_ARVALID,
        ARREADY => s_axi_control_ARREADY,
        ARADDR => s_axi_control_ARADDR,
        RVALID => s_axi_control_RVALID,
        RREADY => s_axi_control_RREADY,
        RDATA => s_axi_control_RDATA,
        RRESP => s_axi_control_RRESP,
        BVALID => s_axi_control_BVALID,
        BREADY => s_axi_control_BREADY,
        BRESP => s_axi_control_BRESP,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        input_r => input_r,
        output_r => output_r,
        output_r_ap_vld => output_r_ap_vld,
        ap_start => ap_start,
        interrupt => interrupt,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_idle => ap_idle);

    fadd_32ns_32ns_32_5_full_dsp_1_U5 : component fir_fadd_32ns_32ns_32_5_full_dsp_1
    generic map (
        ID => 1,
        NUM_STAGE => 5,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        din0 => grp_fu_97_p0,
        din1 => grp_fu_97_p1,
        ce => grp_fu_97_ce,
        dout => grp_fu_97_p2);

    fmul_32ns_32ns_32_4_max_dsp_1_U6 : component fir_fmul_32ns_32ns_32_4_max_dsp_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        din0 => grp_fu_102_p0,
        din1 => grp_fu_102_p1,
        ce => grp_fu_102_ce,
        dout => grp_fu_102_p2);

    uitofp_32ns_32_6_no_dsp_1_U7 : component fir_uitofp_32ns_32_6_no_dsp_1
    generic map (
        ID => 1,
        NUM_STAGE => 6,
        din0_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        din0 => grp_fu_107_p0,
        ce => grp_fu_107_ce,
        dout => grp_fu_107_p1);

    sitofp_32ns_32_6_no_dsp_1_U8 : component fir_sitofp_32ns_32_6_no_dsp_1
    generic map (
        ID => 1,
        NUM_STAGE => 6,
        din0_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        din0 => grp_fu_110_p0,
        ce => grp_fu_110_ce,
        dout => grp_fu_110_p1);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_ap_ready = ap_const_logic_1)) then 
                    grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state16)) then
                acc_reg_288 <= grp_fu_97_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state7)) then
                conv7_reg_275 <= grp_fu_110_p1;
                shift_reg_0 <= grp_fu_107_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                input_r_read_reg_250 <= input_r;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state22)) then
                isNeg_reg_304 <= add_ln346_fu_157_p2(8 downto 8);
                ush_reg_309 <= ush_fu_180_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state11)) then
                mul8_reg_280 <= grp_fu_102_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state21)) then
                p_Result_s_reg_299 <= p_Result_s_fu_150_p1;
                xs_exp_V_reg_293 <= data_V_fu_136_p1(30 downto 23);
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_ap_done)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_ap_done = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state9;
            when ap_ST_fsm_state9 => 
                ap_NS_fsm <= ap_ST_fsm_state10;
            when ap_ST_fsm_state10 => 
                ap_NS_fsm <= ap_ST_fsm_state11;
            when ap_ST_fsm_state11 => 
                ap_NS_fsm <= ap_ST_fsm_state12;
            when ap_ST_fsm_state12 => 
                ap_NS_fsm <= ap_ST_fsm_state13;
            when ap_ST_fsm_state13 => 
                ap_NS_fsm <= ap_ST_fsm_state14;
            when ap_ST_fsm_state14 => 
                ap_NS_fsm <= ap_ST_fsm_state15;
            when ap_ST_fsm_state15 => 
                ap_NS_fsm <= ap_ST_fsm_state16;
            when ap_ST_fsm_state16 => 
                ap_NS_fsm <= ap_ST_fsm_state17;
            when ap_ST_fsm_state17 => 
                ap_NS_fsm <= ap_ST_fsm_state18;
            when ap_ST_fsm_state18 => 
                ap_NS_fsm <= ap_ST_fsm_state19;
            when ap_ST_fsm_state19 => 
                ap_NS_fsm <= ap_ST_fsm_state20;
            when ap_ST_fsm_state20 => 
                ap_NS_fsm <= ap_ST_fsm_state21;
            when ap_ST_fsm_state21 => 
                ap_NS_fsm <= ap_ST_fsm_state22;
            when ap_ST_fsm_state22 => 
                ap_NS_fsm <= ap_ST_fsm_state23;
            when ap_ST_fsm_state23 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXXXXXXXXXXXXXX";
        end case;
    end process;
    add_ln346_fu_157_p2 <= std_logic_vector(unsigned(zext_ln346_fu_154_p1) + unsigned(ap_const_lv9_181));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state11 <= ap_CS_fsm(10);
    ap_CS_fsm_state12 <= ap_CS_fsm(11);
    ap_CS_fsm_state16 <= ap_CS_fsm(15);
    ap_CS_fsm_state17 <= ap_CS_fsm(16);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state21 <= ap_CS_fsm(20);
    ap_CS_fsm_state22 <= ap_CS_fsm(21);
    ap_CS_fsm_state23 <= ap_CS_fsm(22);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_CS_fsm_state7 <= ap_CS_fsm(6);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);
    ap_ST_fsm_state10_blk <= ap_const_logic_0;
    ap_ST_fsm_state11_blk <= ap_const_logic_0;
    ap_ST_fsm_state12_blk <= ap_const_logic_0;
    ap_ST_fsm_state13_blk <= ap_const_logic_0;
    ap_ST_fsm_state14_blk <= ap_const_logic_0;
    ap_ST_fsm_state15_blk <= ap_const_logic_0;
    ap_ST_fsm_state16_blk <= ap_const_logic_0;
    ap_ST_fsm_state17_blk <= ap_const_logic_0;
    ap_ST_fsm_state18_blk <= ap_const_logic_0;
    ap_ST_fsm_state19_blk <= ap_const_logic_0;

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state20_blk <= ap_const_logic_0;
    ap_ST_fsm_state21_blk <= ap_const_logic_0;
    ap_ST_fsm_state22_blk <= ap_const_logic_0;
    ap_ST_fsm_state23_blk <= ap_const_logic_0;

    ap_ST_fsm_state2_blk_assign_proc : process(grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_ap_done)
    begin
        if ((grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state3_blk <= ap_const_logic_0;
    ap_ST_fsm_state4_blk <= ap_const_logic_0;
    ap_ST_fsm_state5_blk <= ap_const_logic_0;
    ap_ST_fsm_state6_blk <= ap_const_logic_0;
    ap_ST_fsm_state7_blk <= ap_const_logic_0;
    ap_ST_fsm_state8_blk <= ap_const_logic_0;
    ap_ST_fsm_state9_blk <= ap_const_logic_0;

    ap_done_assign_proc : process(ap_CS_fsm_state23)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state23)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state23)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state23)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    data_V_fu_136_p1 <= grp_fu_97_p2;
    grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_ap_start <= grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_ap_start_reg;

    grp_fu_102_ce_assign_proc : process(ap_CS_fsm_state2, grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_102_p_ce)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            grp_fu_102_ce <= grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_102_p_ce;
        else 
            grp_fu_102_ce <= ap_const_logic_1;
        end if; 
    end process;


    grp_fu_102_p0_assign_proc : process(ap_CS_fsm_state2, conv7_reg_275, grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_102_p_din0, ap_CS_fsm_state8)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            grp_fu_102_p0 <= grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_102_p_din0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            grp_fu_102_p0 <= conv7_reg_275;
        else 
            grp_fu_102_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_102_p1_assign_proc : process(ap_CS_fsm_state2, grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_102_p_din1, ap_CS_fsm_state8)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            grp_fu_102_p1 <= grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_102_p_din1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            grp_fu_102_p1 <= ap_const_lv32_3EAAAAAB;
        else 
            grp_fu_102_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_107_ce_assign_proc : process(ap_CS_fsm_state2, ap_CS_fsm_state7, grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_ap_done, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, ap_CS_fsm_state6)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state7) or (ap_const_logic_1 = ap_CS_fsm_state6) or (ap_const_logic_1 = ap_CS_fsm_state5) or (ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3) or ((ap_const_logic_1 = ap_CS_fsm_state2) and (grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_ap_done = ap_const_logic_1)))) then 
            grp_fu_107_ce <= ap_const_logic_1;
        else 
            grp_fu_107_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_107_p0 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(input_r_read_reg_250),32));

    grp_fu_110_ce_assign_proc : process(ap_CS_fsm_state2, ap_CS_fsm_state7, grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_ap_done, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, ap_CS_fsm_state6)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state7) or (ap_const_logic_1 = ap_CS_fsm_state6) or (ap_const_logic_1 = ap_CS_fsm_state5) or (ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3) or ((ap_const_logic_1 = ap_CS_fsm_state2) and (grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_ap_done = ap_const_logic_1)))) then 
            grp_fu_110_ce <= ap_const_logic_1;
        else 
            grp_fu_110_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_110_p0 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(input_r_read_reg_250),32));

    grp_fu_97_ce_assign_proc : process(ap_CS_fsm_state2, grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_97_p_ce)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            grp_fu_97_ce <= grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_97_p_ce;
        else 
            grp_fu_97_ce <= ap_const_logic_1;
        end if; 
    end process;


    grp_fu_97_p0_assign_proc : process(ap_CS_fsm_state2, acc_reg_288, grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_acc_out, grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_97_p_din0, ap_CS_fsm_state12, ap_CS_fsm_state17)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            grp_fu_97_p0 <= grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_97_p_din0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state17)) then 
            grp_fu_97_p0 <= acc_reg_288;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state12)) then 
            grp_fu_97_p0 <= grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_acc_out;
        else 
            grp_fu_97_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_97_p1_assign_proc : process(ap_CS_fsm_state2, mul8_reg_280, grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_97_p_din1, ap_CS_fsm_state12, ap_CS_fsm_state17)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            grp_fu_97_p1 <= grp_fir_Pipeline_VITIS_LOOP_18_1_fu_89_grp_fu_97_p_din1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state17)) then 
            grp_fu_97_p1 <= ap_const_lv32_3F000000;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state12)) then 
            grp_fu_97_p1 <= mul8_reg_280;
        else 
            grp_fu_97_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    isNeg_fu_163_p3 <= add_ln346_fu_157_p2(8 downto 8);
    mantissa_fu_188_p4 <= ((ap_const_lv1_1 & p_Result_s_reg_299) & ap_const_lv1_0);
    output_r <= 
        zext_ln818_fu_228_p1 when (isNeg_reg_304(0) = '1') else 
        tmp_1_fu_232_p4;

    output_r_ap_vld_assign_proc : process(ap_CS_fsm_state23)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state23)) then 
            output_r_ap_vld <= ap_const_logic_1;
        else 
            output_r_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    p_Result_s_fu_150_p1 <= data_V_fu_136_p1(23 - 1 downto 0);
    r_V_1_fu_214_p2 <= std_logic_vector(shift_left(unsigned(zext_ln68_fu_197_p1),to_integer(unsigned('0' & zext_ln1488_fu_204_p1(31-1 downto 0)))));
    r_V_fu_208_p2 <= std_logic_vector(shift_right(unsigned(zext_ln68_fu_197_p1),to_integer(unsigned('0' & zext_ln1488_fu_204_p1(31-1 downto 0)))));
        sext_ln1488_fu_201_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(ush_reg_309),32));

        sext_ln1512_fu_176_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sub_ln1512_fu_171_p2),9));

    sub_ln1512_fu_171_p2 <= std_logic_vector(unsigned(ap_const_lv8_7F) - unsigned(xs_exp_V_reg_293));
    tmp_1_fu_232_p4 <= r_V_1_fu_214_p2(31 downto 24);
    tmp_fu_220_p3 <= r_V_fu_208_p2(24 downto 24);
    ush_fu_180_p3 <= 
        sext_ln1512_fu_176_p1 when (isNeg_fu_163_p3(0) = '1') else 
        add_ln346_fu_157_p2;
    zext_ln1488_fu_204_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sext_ln1488_fu_201_p1),55));
    zext_ln346_fu_154_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(xs_exp_V_reg_293),9));
    zext_ln68_fu_197_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(mantissa_fu_188_p4),55));
    zext_ln818_fu_228_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_fu_220_p3),8));
end behav;
