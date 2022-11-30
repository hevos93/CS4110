// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of input_r
//        bit 7~0 - input_r[7:0] (Read/Write)
//        others  - reserved
// 0x14 : reserved
// 0x18 : Data signal of output_r
//        bit 31~0 - output_r[31:0] (Read/Write)
// 0x1c : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XRADIX_CONTROL_ADDR_INPUT_R_DATA  0x10
#define XRADIX_CONTROL_BITS_INPUT_R_DATA  8
#define XRADIX_CONTROL_ADDR_OUTPUT_R_DATA 0x18
#define XRADIX_CONTROL_BITS_OUTPUT_R_DATA 32

