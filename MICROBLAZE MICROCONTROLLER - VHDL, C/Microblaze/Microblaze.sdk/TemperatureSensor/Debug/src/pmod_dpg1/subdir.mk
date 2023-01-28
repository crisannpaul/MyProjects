################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/pmod_dpg1/PmodDPG1.c \
../src/pmod_dpg1/xspi.c \
../src/pmod_dpg1/xspi_options.c 

OBJS += \
./src/pmod_dpg1/PmodDPG1.o \
./src/pmod_dpg1/xspi.o \
./src/pmod_dpg1/xspi_options.o 

C_DEPS += \
./src/pmod_dpg1/PmodDPG1.d \
./src/pmod_dpg1/xspi.d \
./src/pmod_dpg1/xspi_options.d 


# Each subdirectory must supply rules for building sources it contributes
src/pmod_dpg1/%.o: ../src/pmod_dpg1/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -I../../TemperatureSensor_bsp/microblaze_0/include -mlittle-endian -mcpu=v10.0 -mxl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


