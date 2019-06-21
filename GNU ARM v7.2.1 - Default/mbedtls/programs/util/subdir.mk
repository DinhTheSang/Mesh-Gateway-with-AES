################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../mbedtls/programs/util/pem2der.c \
../mbedtls/programs/util/strerror.c 

OBJS += \
./mbedtls/programs/util/pem2der.o \
./mbedtls/programs/util/strerror.o 

C_DEPS += \
./mbedtls/programs/util/pem2der.d \
./mbedtls/programs/util/strerror.d 


# Each subdirectory must supply rules for building sources it contributes
mbedtls/programs/util/pem2der.o: ../mbedtls/programs/util/pem2der.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DHAL_CONFIG=1' '-D__STACK_SIZE=0x1000' '-D__HEAP_SIZE=0x1200' '-DMESH_LIB_NATIVE=1' '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' '-DEFR32BG13P632F512GM48=1' -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/emlib/inc" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/protocol/bluetooth/bt_mesh/inc/soc" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/emlib/src" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/radio/rail_lib/protocol/ieee802154" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/hardware/kit/common/halconfig" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/Device/SiliconLabs/EFR32BG13P/Include" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/emdrv/sleep/src" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/radio/rail_lib/common" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/protocol/bluetooth/bt_mesh/inc" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/hardware/kit/common/bsp" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/CMSIS/Include" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/protocol/bluetooth/bt_mesh/src" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/halconfig/inc/hal-config" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/emdrv/uartdrv/inc" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/hardware/kit/common/drivers" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/protocol/bluetooth/bt_mesh/inc/common" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/Device/SiliconLabs/EFR32BG13P/Source/GCC" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/emdrv/sleep/inc" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/radio/rail_lib/protocol/ble" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/emdrv/gpiointerrupt/inc" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/hardware/kit/EFR32BG13_BRD4104A/config" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/Device/SiliconLabs/EFR32BG13P/Source" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/bootloader/api" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/emdrv/common/inc" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/middleware" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/middleware/glib" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/middleware/glib/glib" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/middleware/glib/dmd/ssd2119" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/middleware/glib/dmd/display" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/middleware/glib/dmd" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/mbedtls/include" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/mbedtls/include/mbedtls" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/mbedtls/sl_crypto/include" -Os -fno-builtin -flto -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"mbedtls/programs/util/pem2der.d" -MT"mbedtls/programs/util/pem2der.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

mbedtls/programs/util/strerror.o: ../mbedtls/programs/util/strerror.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DHAL_CONFIG=1' '-D__STACK_SIZE=0x1000' '-D__HEAP_SIZE=0x1200' '-DMESH_LIB_NATIVE=1' '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' '-DEFR32BG13P632F512GM48=1' -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/emlib/inc" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/protocol/bluetooth/bt_mesh/inc/soc" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/emlib/src" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/radio/rail_lib/protocol/ieee802154" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/hardware/kit/common/halconfig" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/Device/SiliconLabs/EFR32BG13P/Include" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/emdrv/sleep/src" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/radio/rail_lib/common" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/protocol/bluetooth/bt_mesh/inc" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/hardware/kit/common/bsp" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/CMSIS/Include" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/protocol/bluetooth/bt_mesh/src" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/halconfig/inc/hal-config" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/emdrv/uartdrv/inc" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/hardware/kit/common/drivers" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/protocol/bluetooth/bt_mesh/inc/common" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/Device/SiliconLabs/EFR32BG13P/Source/GCC" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/emdrv/sleep/inc" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/radio/rail_lib/protocol/ble" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/emdrv/gpiointerrupt/inc" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/hardware/kit/EFR32BG13_BRD4104A/config" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/Device/SiliconLabs/EFR32BG13P/Source" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/bootloader/api" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/emdrv/common/inc" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/middleware" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/middleware/glib" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/middleware/glib/glib" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/middleware/glib/dmd/ssd2119" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/middleware/glib/dmd/display" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/platform/middleware/glib/dmd" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/mbedtls/include" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/mbedtls/include/mbedtls" -I"/home/huekh/SimplicityStudio/v4_workspace/Mesh_Empty_Recieve_Data (copy)/mbedtls/sl_crypto/include" -Os -fno-builtin -flto -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"mbedtls/programs/util/strerror.d" -MT"mbedtls/programs/util/strerror.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


