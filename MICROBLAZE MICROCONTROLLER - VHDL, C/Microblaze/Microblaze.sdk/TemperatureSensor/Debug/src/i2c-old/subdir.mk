################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/i2c-old/i2c-master1.c 

OBJS += \
./src/i2c-old/i2c-master1.o 

C_DEPS += \
./src/i2c-old/i2c-master1.d 


# Each subdirectory must supply rules for building sources it contributes
src/i2c-old/%.o: ../src/i2c-old/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -I../../TemperatureSensor_bsp/microblaze_0/include -mlittle-endian -mcpu=v10.0 -mxl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


