#include "platform.h"
#include "xsubstitute.h"
#include "xil_printf.h"

int main()
{
    print("\n\Substitute\n\r>");

    XSubstitute substitute =
    {
        .Control_BaseAddress = XPAR_SUBSTITUTE_0_S_AXI_CONTROL_BASEADDR,
        .IsReady = 0
    };

    init_platform();

    XSubstitute_Config* const config = XSubstitute_LookupConfig(XPAR_SUBSTITUTE_0_DEVICE_ID);
    const int ret = XSubstitute_CfgInitialize( &substitute, config);
    Xil_AssertNonvoid( ret == XST_SUCCESS );

    XSubstitute_DisableAutoRestart(&substitute);

    while(1)
    {
        const char c = inbyte();
        if(XSubstitute_IsIdle(&substitute))
        {
            XSubstitute_Set_input_r(&substitute, c);
            XSubstitute_Start(&substitute);

            while(!XSubstitute_IsDone(&substitute));

            const uint8_t val = XSubstitute_Get_output_r(&substitute);
            outbyte(val);
        }
    }

    cleanup_platform();
    return 0;
}
