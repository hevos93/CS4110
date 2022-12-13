// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
//        others - reserved
// 0x10 ~
// 0x17 : Memory 'input_r' (8 * 8b)
//        Word n : bit [ 7: 0] - input_r[4n]
//                 bit [15: 8] - input_r[4n+1]
//                 bit [23:16] - input_r[4n+2]
//                 bit [31:24] - input_r[4n+3]
// 0x18 ~
// 0x1f : Memory 'output_r' (8 * 8b)
//        Word n : bit [ 7: 0] - output_r[4n]
//                 bit [15: 8] - output_r[4n+1]
//                 bit [23:16] - output_r[4n+2]
//                 bit [31:24] - output_r[4n+3]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define CONTROL_ADDR_AP_CTRL       0x00
#define CONTROL_ADDR_GIE           0x04
#define CONTROL_ADDR_IER           0x08
#define CONTROL_ADDR_ISR           0x0c
#define CONTROL_ADDR_INPUT_R_BASE  0x10
#define CONTROL_ADDR_INPUT_R_HIGH  0x17
#define CONTROL_WIDTH_INPUT_R      8
#define CONTROL_DEPTH_INPUT_R      8
#define CONTROL_ADDR_OUTPUT_R_BASE 0x18
#define CONTROL_ADDR_OUTPUT_R_HIGH 0x1f
#define CONTROL_WIDTH_OUTPUT_R     8
#define CONTROL_DEPTH_OUTPUT_R     8
