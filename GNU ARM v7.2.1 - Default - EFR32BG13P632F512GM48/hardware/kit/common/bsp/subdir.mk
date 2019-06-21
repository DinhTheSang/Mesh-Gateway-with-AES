################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../hardware/kit/common/bsp/bsp_stk.c 

OBJS += \
./hardware/kit/common/bsp/bsp_stk.o 

C_DEPS += \
./hardware/kit/common/bsp/bsp_stk.d 


# Each subdirectory must supply rules for building sources it contributes
hardware/kit/common/bsp/bsp_stk.o: ../hardware/kit/common/bsp/bsp_stk.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DHAL_CONFIG=1' '-D__STACK_SIZE=0x1000' '-D__HEAP_SIZE=0x1200' '-DMESH_LIB_NATIVE=1' '-DEFR32BG13P632F512GM48=1' '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/platform/emlib/inc" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/protocol/bluetooth/bt_mesh/inc/soc" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/platform/emlib/src" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/platform/radio/rail_lib/protocol/ieee802154" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/hardware/kit/common/halconfig" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/platform/Device/SiliconLabs/EFR32BG13P/Include" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/platform/emdrv/sleep/src" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/platform/radio/rail_lib/common" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/protocol/bluetooth/bt_mesh/inc" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/hardware/kit/common/bsp" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/platform/CMSIS/Include" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/protocol/bluetooth/bt_mesh/src" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/platform/halconfig/inc/hal-config" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/platform/emdrv/uartdrv/inc" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/hardware/kit/common/drivers" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/protocol/bluetooth/bt_mesh/inc/common" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/platform/Device/SiliconLabs/EFR32BG13P/Source/GCC" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/platform/emdrv/sleep/inc" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/platform/radio/rail_lib/protocol/ble" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/platform/emdrv/gpiointerrupt/inc" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/hardware/kit/EFR32BG13_BRD4104A/config" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/platform/Device/SiliconLabs/EFR32BG13P/Source" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/platform/bootloader/api" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/platform/emdrv/common/inc" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/platform/middleware" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/platform/middleware/glib" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/platform/middleware/glib/glib" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/platform/middleware/glib/dmd/ssd2119" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/platform/middleware/glib/dmd/display" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/platform/middleware/glib/dmd" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/mbedtls" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/mbedtls/include" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/mbedtls/include/mbedtls" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/mbedtls/sl_crypto" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Transfer_AES_AD/mbedtls/sl_crypto/include" -Os -fno-builtin -flto -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"hardware/kit/common/bsp/bsp_stk.d" -MT"hardware/kit/common/bsp/bsp_stk.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


