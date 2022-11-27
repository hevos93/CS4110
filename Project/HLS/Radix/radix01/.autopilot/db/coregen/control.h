// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of input_r
//        bit 7~0 - input_r[7:0] (Read/Write)
//        others  - reserved
// 0x14 : reserved
// 0x18 : Data signal of output_r
//        bit 31~0 - output_r[31:0] (Read)
// 0x1c : Control signal of output_r
//        bit 0  - output_r_ap_vld (Read/COR)
//        others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define CONTROL_ADDR_INPUT_R_DATA  0x10
#define CONTROL_BITS_INPUT_R_DATA  8
#define CONTROL_ADDR_OUTPUT_R_DATA 0x18
#define CONTROL_BITS_OUTPUT_R_DATA 32
#define CONTROL_ADDR_OUTPUT_R_CTRL 0x1c
