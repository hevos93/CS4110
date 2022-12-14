// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XRADIX_H
#define XRADIX_H

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
#include "xradix_hw.h"

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
} XRadix_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XRadix;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XRadix_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XRadix_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XRadix_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XRadix_ReadReg(BaseAddress, RegOffset) \
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
int XRadix_Initialize(XRadix *InstancePtr, u16 DeviceId);
XRadix_Config* XRadix_LookupConfig(u16 DeviceId);
int XRadix_CfgInitialize(XRadix *InstancePtr, XRadix_Config *ConfigPtr);
#else
int XRadix_Initialize(XRadix *InstancePtr, const char* InstanceName);
int XRadix_Release(XRadix *InstancePtr);
#endif

void XRadix_Start(XRadix *InstancePtr);
u32 XRadix_IsDone(XRadix *InstancePtr);
u32 XRadix_IsIdle(XRadix *InstancePtr);
u32 XRadix_IsReady(XRadix *InstancePtr);
void XRadix_EnableAutoRestart(XRadix *InstancePtr);
void XRadix_DisableAutoRestart(XRadix *InstancePtr);

u32 XRadix_Get_input_r_BaseAddress(XRadix *InstancePtr);
u32 XRadix_Get_input_r_HighAddress(XRadix *InstancePtr);
u32 XRadix_Get_input_r_TotalBytes(XRadix *InstancePtr);
u32 XRadix_Get_input_r_BitWidth(XRadix *InstancePtr);
u32 XRadix_Get_input_r_Depth(XRadix *InstancePtr);
u32 XRadix_Write_input_r_Words(XRadix *InstancePtr, int offset, word_type *data, int length);
u32 XRadix_Read_input_r_Words(XRadix *InstancePtr, int offset, word_type *data, int length);
u32 XRadix_Write_input_r_Bytes(XRadix *InstancePtr, int offset, char *data, int length);
u32 XRadix_Read_input_r_Bytes(XRadix *InstancePtr, int offset, char *data, int length);
u32 XRadix_Get_output_r_BaseAddress(XRadix *InstancePtr);
u32 XRadix_Get_output_r_HighAddress(XRadix *InstancePtr);
u32 XRadix_Get_output_r_TotalBytes(XRadix *InstancePtr);
u32 XRadix_Get_output_r_BitWidth(XRadix *InstancePtr);
u32 XRadix_Get_output_r_Depth(XRadix *InstancePtr);
u32 XRadix_Write_output_r_Words(XRadix *InstancePtr, int offset, word_type *data, int length);
u32 XRadix_Read_output_r_Words(XRadix *InstancePtr, int offset, word_type *data, int length);
u32 XRadix_Write_output_r_Bytes(XRadix *InstancePtr, int offset, char *data, int length);
u32 XRadix_Read_output_r_Bytes(XRadix *InstancePtr, int offset, char *data, int length);

void XRadix_InterruptGlobalEnable(XRadix *InstancePtr);
void XRadix_InterruptGlobalDisable(XRadix *InstancePtr);
void XRadix_InterruptEnable(XRadix *InstancePtr, u32 Mask);
void XRadix_InterruptDisable(XRadix *InstancePtr, u32 Mask);
void XRadix_InterruptClear(XRadix *InstancePtr, u32 Mask);
u32 XRadix_InterruptGetEnabled(XRadix *InstancePtr);
u32 XRadix_InterruptGetStatus(XRadix *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
