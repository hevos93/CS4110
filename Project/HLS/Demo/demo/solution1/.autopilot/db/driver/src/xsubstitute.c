// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xsubstitute.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XSubstitute_CfgInitialize(XSubstitute *InstancePtr, XSubstitute_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XSubstitute_Start(XSubstitute *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubstitute_ReadReg(InstancePtr->Control_BaseAddress, XSUBSTITUTE_CONTROL_ADDR_AP_CTRL) & 0x80;
    XSubstitute_WriteReg(InstancePtr->Control_BaseAddress, XSUBSTITUTE_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XSubstitute_IsDone(XSubstitute *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubstitute_ReadReg(InstancePtr->Control_BaseAddress, XSUBSTITUTE_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XSubstitute_IsIdle(XSubstitute *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubstitute_ReadReg(InstancePtr->Control_BaseAddress, XSUBSTITUTE_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XSubstitute_IsReady(XSubstitute *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubstitute_ReadReg(InstancePtr->Control_BaseAddress, XSUBSTITUTE_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XSubstitute_EnableAutoRestart(XSubstitute *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubstitute_WriteReg(InstancePtr->Control_BaseAddress, XSUBSTITUTE_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XSubstitute_DisableAutoRestart(XSubstitute *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubstitute_WriteReg(InstancePtr->Control_BaseAddress, XSUBSTITUTE_CONTROL_ADDR_AP_CTRL, 0);
}

void XSubstitute_Set_input_r(XSubstitute *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubstitute_WriteReg(InstancePtr->Control_BaseAddress, XSUBSTITUTE_CONTROL_ADDR_INPUT_R_DATA, Data);
}

u32 XSubstitute_Get_input_r(XSubstitute *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubstitute_ReadReg(InstancePtr->Control_BaseAddress, XSUBSTITUTE_CONTROL_ADDR_INPUT_R_DATA);
    return Data;
}

u32 XSubstitute_Get_output_r(XSubstitute *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubstitute_ReadReg(InstancePtr->Control_BaseAddress, XSUBSTITUTE_CONTROL_ADDR_OUTPUT_R_DATA);
    return Data;
}

u32 XSubstitute_Get_output_r_vld(XSubstitute *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubstitute_ReadReg(InstancePtr->Control_BaseAddress, XSUBSTITUTE_CONTROL_ADDR_OUTPUT_R_CTRL);
    return Data & 0x1;
}

void XSubstitute_InterruptGlobalEnable(XSubstitute *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubstitute_WriteReg(InstancePtr->Control_BaseAddress, XSUBSTITUTE_CONTROL_ADDR_GIE, 1);
}

void XSubstitute_InterruptGlobalDisable(XSubstitute *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubstitute_WriteReg(InstancePtr->Control_BaseAddress, XSUBSTITUTE_CONTROL_ADDR_GIE, 0);
}

void XSubstitute_InterruptEnable(XSubstitute *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSubstitute_ReadReg(InstancePtr->Control_BaseAddress, XSUBSTITUTE_CONTROL_ADDR_IER);
    XSubstitute_WriteReg(InstancePtr->Control_BaseAddress, XSUBSTITUTE_CONTROL_ADDR_IER, Register | Mask);
}

void XSubstitute_InterruptDisable(XSubstitute *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSubstitute_ReadReg(InstancePtr->Control_BaseAddress, XSUBSTITUTE_CONTROL_ADDR_IER);
    XSubstitute_WriteReg(InstancePtr->Control_BaseAddress, XSUBSTITUTE_CONTROL_ADDR_IER, Register & (~Mask));
}

void XSubstitute_InterruptClear(XSubstitute *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubstitute_WriteReg(InstancePtr->Control_BaseAddress, XSUBSTITUTE_CONTROL_ADDR_ISR, Mask);
}

u32 XSubstitute_InterruptGetEnabled(XSubstitute *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSubstitute_ReadReg(InstancePtr->Control_BaseAddress, XSUBSTITUTE_CONTROL_ADDR_IER);
}

u32 XSubstitute_InterruptGetStatus(XSubstitute *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSubstitute_ReadReg(InstancePtr->Control_BaseAddress, XSUBSTITUTE_CONTROL_ADDR_ISR);
}

