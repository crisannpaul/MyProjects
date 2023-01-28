//TO DO
#define XPAR_I2C_BASEADDR 0x00;
#define XIIC_STOP 0x00;

int ReadI2CBuffer(unsigned char device, void* destination, int len);
int WriteI2CBuffer(unsigned char device, void* source, int len);