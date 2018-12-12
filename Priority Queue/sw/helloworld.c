/*
 * Copyright (c) 2009-2012 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xbasic_types.h"
#include "xstatus.h"
#include "xil_io.h"
#include <stdlib.h>
#include <unistd.h>


void print(char *str);


int main()
{
	//write A:5		11111101
	//read
	//write B:3		00001011
	//write C:5		00001101
	//read
	//read
	//write D:1		10000001
	//read
	//read

    init_platform();

    Xil_Out32((0x78200000) + (0x00000004), (Xuint32)(0)); //rr
    Xil_Out32((0x78200000) + (0x00000008), (Xuint32)(0)); //ww

    Xil_Out32((0x78200000) + (0x0000000C), (Xuint32)(253)); //new_en A
    Xil_Out32((0x78200000) + (0x00000008), (Xuint32)(1)); //ww
    Xil_Out32((0x78200000) + (0x00000008), (Xuint32)(0)); //ww
    Xil_Out32((0x78200000) + (0x00000004), (Xuint32)(1)); //rr
    Xil_In32((0x78200000) + (0x00000010));

    Xil_Out32((0x78200000) + (0x00000004), (Xuint32)(0)); //rr
    //Xil_Out32((0x78200000) + (0x00000008), (Xuint32)(0)); //ww

    Xil_Out32((0x78200000) + (0x0000000C), (Xuint32)(11)); //new_en B

    Xil_Out32((0x78200000) + (0x00000008), (Xuint32)(1)); //ww

    //  Xil_Out32((0x78200000) + (0x00000008), (Xuint32)(0)); //ww
    // Xil_Out32((0x78200000) + (0x00000004), (Xuint32)(0)); //rr

    Xil_Out32((0x78200000) + (0x0000000C), (Xuint32)(13)); //new_en C
    //Xil_Out32((0x78200000) + (0x00000008), (Xuint32)(1)); //ww
    Xil_Out32((0x78200000) + (0x00000008), (Xuint32)(0)); //ww

    Xil_Out32((0x78200000) + (0x00000004), (Xuint32)(1)); //rr
    Xil_In32((0x78200000) + (0x00000010));

    Xil_Out32((0x78200000) + (0x00000004), (Xuint32)(0)); //rr

    Xil_Out32((0x78200000) + (0x0000000C), (Xuint32)(129)); //new_en D


    Xil_Out32((0x78200000) + (0x00000008), (Xuint32)(1)); //ww

    Xil_Out32((0x78200000) + (0x00000004), (Xuint32)(1)); //rr
    Xil_In32((0x78200000) + (0x00000010));
    Xil_In32((0x78200000) + (0x00000010));

    return 0;
}
