// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XSUBSTITUTE_H
#define XSUBSTITUTE_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xsubstitute_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
} XSubstitute_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XSubstitute;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XSubstitute_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XSubstitute_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XSubstitute_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XSubstitute_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XSubstitute_Initialize(XSubstitute *InstancePtr, u16 DeviceId);
XSubstitute_Config* XSubstitute_LookupConfig(u16 DeviceId);
int XSubstitute_CfgInitialize(XSubstitute *InstancePtr, XSubstitute_Config *ConfigPtr);
#else
int XSubstitute_Initialize(XSubstitute *InstancePtr, const char* InstanceName);
int XSubstitute_Release(XSubstitute *InstancePtr);
#endif

void XSubstitute_Start(XSubstitute *InstancePtr);
u32 XSubstitute_IsDone(XSubstitute *InstancePtr);
u32 XSubstitute_IsIdle(XSubstitute *InstancePtr);
u32 XSubstitute_IsReady(XSubstitute *InstancePtr);
void XSubstitute_EnableAutoRestart(XSubstitute *InstancePtr);
void XSubstitute_DisableAutoRestart(XSubstitute *InstancePtr);

void XSubstitute_Set_input_r(XSubstitute *InstancePtr, u32 Data);
u32 XSubstitute_Get_input_r(XSubstitute *InstancePtr);
u32 XSubstitute_Get_output_r(XSubstitute *InstancePtr);
u32 XSubstitute_Get_output_r_vld(XSubstitute *InstancePtr);

void XSubstitute_InterruptGlobalEnable(XSubstitute *InstancePtr);
void XSubstitute_InterruptGlobalDisable(XSubstitute *InstancePtr);
void XSubstitute_InterruptEnable(XSubstitute *InstancePtr, u32 Mask);
void XSubstitute_InterruptDisable(XSubstitute *InstancePtr, u32 Mask);
void XSubstitute_InterruptClear(XSubstitute *InstancePtr, u32 Mask);
u32 XSubstitute_InterruptGetEnabled(XSubstitute *InstancePtr);
u32 XSubstitute_InterruptGetStatus(XSubstitute *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
