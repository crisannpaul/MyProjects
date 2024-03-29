#include "xparameters.h"
#include "xil_exception.h"
#include "xil_printf.h"
#include "xiicps.h"
#include "sleep.h"
#include "xscugic.h"

/************************** Constant Definitions *****************************/
#define IIC_DEVICE_ID   XPAR_XIICPS_0_DEVICE_ID
#define XIIC	XIicPs
#define XIICCFG	XIicPs_Config
#define I2cSetStatusHandler	XIicPs_SetStatusHandler
#define	I2cLookupConfig		XIicPs_LookupConfig
#define	I2cCfgInitialize	XIicPs_CfgInitialize
#define INTC_DEVICE_ID	XPAR_SCUGIC_SINGLE_DEVICE_ID
#define IIC_INTR_ID	XPAR_XIICPS_0_INTR
#define INTC_HANDLER	XScuGic_InterruptHandler
#define IIC_HANDLER	XIicPs_IntrHandler
#define INTC	XScuGic
#define IIC_SCLK_RATE           100000
/**************************** Type Definitions *******************************/
typedef struct {
	XIIC I2cInstance;
	INTC IntcInstance;
	volatile u8 TransmitComplete;   /* Flag to check completion of Transmission */
	volatile u8 ReceiveComplete;    /* Flag to check completion of Reception */
	volatile u32 TotalErrorCount;
} XIIC_LIB;
/***************** Macros (Inline Functions) Definitions *********************/

/************************** Function Prototypes ******************************/
int I2cPhyWrite(XIIC_LIB *I2cLibPtr, u8 PhyAddr, u8 Reg, u16 Data, u16 SlaveAddr);
int I2cPhyRead(XIIC_LIB *I2cLibPtr, u8 PhyAddr, u8 Reg, u16 *Data, u16 SlaveAddr);
int I2cSetupHardware(XIIC_LIB *I2cLibPtr);
int I2cWriteData(XIIC_LIB *I2cLibPtr, u8 *WrBuffer, u16 ByteCount, u16 SlaveAddr);
int I2cReadData(XIIC_LIB *I2cLibPtr, u8 *RdBuffer, u16 ByteCount, u16 SlaveAddr);
static int SetupInterruptSystem(XIIC_LIB *I2cLibPtr);
static void StatusHandler(XIIC_LIB *I2cLibPtr, int Event);
