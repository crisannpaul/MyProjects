################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/xiic/xiic.c \
../src/xiic/xiic_dyn_master.c \
../src/xiic/xiic_g.c \
../src/xiic/xiic_intr.c \
../src/xiic/xiic_l.c \
../src/xiic/xiic_master.c \
../src/xiic/xiic_multi_master.c \
../src/xiic/xiic_options.c \
../src/xiic/xiic_selftest.c \
../src/xiic/xiic_sinit.c \
../src/xiic/xiic_slave.c \
../src/xiic/xiic_stats.c \
../src/xiic/xil_assert.c \
../src/xiic/xintc.c \
../src/xiic/xintc_l.c 

OBJS += \
./src/xiic/xiic.o \
./src/xiic/xiic_dyn_master.o \
./src/xiic/xiic_g.o \
./src/xiic/xiic_intr.o \
./src/xiic/xiic_l.o \
./src/xiic/xiic_master.o \
./src/xiic/xiic_multi_master.o \
./src/xiic/xiic_options.o \
./src/xiic/xiic_selftest.o \
./src/xiic/xiic_sinit.o \
./src/xiic/xiic_slave.o \
./src/xiic/xiic_stats.o \
./src/xiic/xil_assert.o \
./src/xiic/xintc.o \
./src/xiic/xintc_l.o 

C_DEPS += \
./src/xiic/xiic.d \
./src/xiic/xiic_dyn_master.d \
./src/xiic/xiic_g.d \
./src/xiic/xiic_intr.d \
./src/xiic/xiic_l.d \
./src/xiic/xiic_master.d \
./src/xiic/xiic_multi_master.d \
./src/xiic/xiic_options.d \
./src/xiic/xiic_selftest.d \
./src/xiic/xiic_sinit.d \
./src/xiic/xiic_slave.d \
./src/xiic/xiic_stats.d \
./src/xiic/xil_assert.d \
./src/xiic/xintc.d \
./src/xiic/xintc_l.d 


# Each subdirectory must supply rules for building sources it contributes
src/xiic/%.o: ../src/xiic/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -Wall -O2 -c -fmessage-length=0 -MT"$@" -I../../TemperatureSensor_bsp/microblaze_0/include -mlittle-endian -mcpu=v10.0 -mxl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


