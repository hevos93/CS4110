// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xradix.h"

extern XRadix_Config XRadix_ConfigTable[];

XRadix_Config *XRadix_LookupConfig(u16 DeviceId) {
	XRadix_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XRADIX_NUM_INSTANCES; Index++) {
		if (XRadix_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XRadix_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XRadix_Initialize(XRadix *InstancePtr, u16 DeviceId) {
	XRadix_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XRadix_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XRadix_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

