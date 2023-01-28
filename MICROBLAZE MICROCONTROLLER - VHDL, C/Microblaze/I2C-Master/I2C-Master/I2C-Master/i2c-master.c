#include "i2c-master.h"

// ************************************************************************************
// *                                                  				      *
// * ReadI2CBuffer						                      *
// *                                                  				      *
// * Reading data on I2C bus     						      *
// *                                                  				      *
// * Parameter : (unsigned char) Device address (true address no right rotate 8 bits) *
// *	         (unsigned char) Address on device                                    *
// *	         (void *) Destination data buffer                                     *
// *		 (int) Len of data buffer		                              *
// *  					                                              *
// * Return    : 0 = OK / -1 = Error                                                  *
// *					                                              *
// ************************************************************************************

int ReadI2CBuffer(unsigned char device, void* destination, int len) {

    // Local Variable
    unsigned int count;

    // Setup destination pointer
    unsigned char* ptr;
    ptr = destination;

    // Read data on I2C bus
    count = XIic_Recv(XPAR_I2C_BASEADDR, (device >> 1), ptr, len, XIIC_STOP);

    // Test reading
    if (count != len) {
        // No more data
        count = -1;
    } else {
        // Ok
        count = 0;
    }

    // Exit
    return count;
}

// ************************************************************************************
// *                                                  				      *
// * WriteI2CBuffer						                      *
// *                                                  				      *
// * Wrinting data on I2C bus     						      *
// *                                                  				      *
// * Parameter : (unsigned char) Device address (true address no right rotate 8 bits) *
// *	         (unsigned char) Address on device                                    *
// *	         (void *) Source data buffer                                          *
// *		 (int) Len of data buffer		                              *
// *  					                                              *
// * Return    : 0 = OK / -1 = Error                                                  *
// *					                                              *
// ************************************************************************************

int WriteI2CBuffer(unsigned char device, void* source, int len) {
    // Local Variable
    unsigned int count;

    // Setup source pointer	
    unsigned char* ptr;
    ptr = source;

    // Write data on I2C bus
    count = XIic_Send(XPAR_I2C_BASEADDR, (device >> 1), ptr, len, XIIC_STOP);

    // Test writing
    if (count != len) {
        // No more data
        count = -1;
    } else {
        // OK
        count = 0;
    }

    // Exit
    return count;
}