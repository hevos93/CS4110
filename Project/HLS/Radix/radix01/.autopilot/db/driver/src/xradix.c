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

void XRadix_Start(XRadix *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRadix_ReadReg(InstancePtr->Control_BaseAddress, XRADIX_CONTROL_ADDR_AP_CTRL) & 0x80;
    XRadix_WriteReg(InstancePtr->Control_BaseAddress, XRADIX_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XRadix_IsDone(XRadix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRadix_ReadReg(InstancePtr->Control_BaseAddress, XRADIX_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XRadix_IsIdle(XRadix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRadix_ReadReg(InstancePtr->Control_BaseAddress, XRADIX_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XRadix_IsReady(XRadix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRadix_ReadReg(InstancePtr->Control_BaseAddress, XRADIX_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XRadix_EnableAutoRestart(XRadix *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRadix_WriteReg(InstancePtr->Control_BaseAddress, XRADIX_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XRadix_DisableAutoRestart(XRadix *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRadix_WriteReg(InstancePtr->Control_BaseAddress, XRADIX_CONTROL_ADDR_AP_CTRL, 0);
}

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

u32 XRadix_Get_output_r(XRadix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRadix_ReadReg(InstancePtr->Control_BaseAddress, XRADIX_CONTROL_ADDR_OUTPUT_R_DATA);
    return Data;
}

u32 XRadix_Get_output_r_vld(XRadix *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRadix_ReadReg(InstancePtr->Control_BaseAddress, XRADIX_CONTROL_ADDR_OUTPUT_R_CTRL);
    return Data & 0x1;
}

void XRadix_InterruptGlobalEnable(XRadix *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRadix_WriteReg(InstancePtr->Control_BaseAddress, XRADIX_CONTROL_ADDR_GIE, 1);
}

void XRadix_InterruptGlobalDisable(XRadix *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRadix_WriteReg(InstancePtr->Control_BaseAddress, XRADIX_CONTROL_ADDR_GIE, 0);
}

void XRadix_InterruptEnable(XRadix *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XRadix_ReadReg(InstancePtr->Control_BaseAddress, XRADIX_CONTROL_ADDR_IER);
    XRadix_WriteReg(InstancePtr->Control_BaseAddress, XRADIX_CONTROL_ADDR_IER, Register | Mask);
}

void XRadix_InterruptDisable(XRadix *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XRadix_ReadReg(InstancePtr->Control_BaseAddress, XRADIX_CONTROL_ADDR_IER);
    XRadix_WriteReg(InstancePtr->Control_BaseAddress, XRADIX_CONTROL_ADDR_IER, Register & (~Mask));
}

void XRadix_InterruptClear(XRadix *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRadix_WriteReg(InstancePtr->Control_BaseAddress, XRADIX_CONTROL_ADDR_ISR, Mask);
}

u32 XRadix_InterruptGetEnabled(XRadix *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XRadix_ReadReg(InstancePtr->Control_BaseAddress, XRADIX_CONTROL_ADDR_IER);
}

u32 XRadix_InterruptGetStatus(XRadix *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XRadix_ReadReg(InstancePtr->Control_BaseAddress, XRADIX_CONTROL_ADDR_ISR);
}

