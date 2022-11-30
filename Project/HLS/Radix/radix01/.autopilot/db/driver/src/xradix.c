// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xradix.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XRadix_CfgInitialize(XRadix *InstancePtr, XRadix_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XRadix_Set_input_r(XRadix *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRadix_WriteReg(InstancePtr->Control_BaseAddress, XRADIX_CONTROL_ADDR_INPUT_R_DATA, Data);
}

u32 XRadix_Get_input_r(XRadix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRadix_ReadReg(InstancePtr->Control_BaseAddress, XRADIX_CONTROL_ADDR_INPUT_R_DATA);
    return Data;
}

void XRadix_Set_output_r(XRadix *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRadix_WriteReg(InstancePtr->Control_BaseAddress, XRADIX_CONTROL_ADDR_OUTPUT_R_DATA, Data);
}

u32 XRadix_Get_output_r(XRadix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRadix_ReadReg(InstancePtr->Control_BaseAddress, XRADIX_CONTROL_ADDR_OUTPUT_R_DATA);
    return Data;
}

