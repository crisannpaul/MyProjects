################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/pmod_tmp3_iic/PmodTMP3.c \
../src/pmod_tmp3_iic/xiic.c \
../src/pmod_tmp3_iic/xiic_dyn_master.c \
../src/pmod_tmp3_iic/xiic_intr.c \
../src/pmod_tmp3_iic/xiic_l.c \
../src/pmod_tmp3_iic/xiic_master.c \
../src/pmod_tmp3_iic/xiic_multi_master.c \
../src/pmod_tmp3_iic/xiic_options.c \
../src/pmod_tmp3_iic/xiic_selftest.c \
../src/pmod_tmp3_iic/xiic_slave.c \
../src/pmod_tmp3_iic/xiic_stats.c 

OBJS += \
./src/pmod_tmp3_iic/PmodTMP3.o \
./src/pmod_tmp3_iic/xiic.o \
./src/pmod_tmp3_iic/xiic_dyn_master.o \
./src/pmod_tmp3_iic/xiic_intr.o \
./src/pmod_tmp3_iic/xiic_l.o \
./src/pmod_tmp3_iic/xiic_master.o \
./src/pmod_tmp3_iic/xiic_multi_master.o \
./src/pmod_tmp3_iic/xiic_options.o \
./src/pmod_tmp3_iic/xiic_selftest.o \
./src/pmod_tmp3_iic/xiic_slave.o \
./src/pmod_tmp3_iic/xiic_stats.o 

C_DEPS += \
./src/pmod_tmp3_iic/PmodTMP3.d \
./src/pmod_tmp3_iic/xiic.d \
./src/pmod_tmp3_iic/xiic_dyn_master.d \
./src/pmod_tmp3_iic/xiic_intr.d \
./src/pmod_tmp3_iic/xiic_l.d \
./src/pmod_tmp3_iic/xiic_master.d \
./src/pmod_tmp3_iic/xiic_multi_master.d \
./src/pmod_tmp3_iic/xiic_options.d \
./src/pmod_tmp3_iic/xiic_selftest.d \
./src/pmod_tmp3_iic/xiic_slave.d \
./src/pmod_tmp3_iic/xiic_stats.d 


# Each subdirectory must supply rules for building sources it contributes
src/pmod_tmp3_iic/%.o: ../src/pmod_tmp3_iic/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -I../../TemperatureSensor_bsp/microblaze_0/include -mlittle-endian -mcpu=v10.0 -mxl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


