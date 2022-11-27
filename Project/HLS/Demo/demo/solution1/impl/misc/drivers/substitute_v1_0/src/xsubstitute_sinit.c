// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xsubstitute.h"

extern XSubstitute_Config XSubstitute_ConfigTable[];

XSubstitute_Config *XSubstitute_LookupConfig(u16 DeviceId) {
	XSubstitute_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XSUBSTITUTE_NUM_INSTANCES; Index++) {
		if (XSubstitute_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XSubstitute_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XSubstitute_Initialize(XSubstitute *InstancePtr, u16 DeviceId) {
	XSubstitute_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XSubstitute_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XSubstitute_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

