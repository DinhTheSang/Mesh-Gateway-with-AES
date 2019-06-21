################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../platform/middleware/glib/dmd/display/dmd_display.c 

OBJS += \
./platform/middleware/glib/dmd/display/dmd_display.o 

C_DEPS += \
./platform/middleware/glib/dmd/display/dmd_display.d 


# Each subdirectory must supply rules for building sources it contributes
platform/middleware/glib/dmd/display/dmd_display.o: ../platform/middleware/glib/dmd/display/dmd_display.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' '-DHAL_CONFIG=1' '-D__STACK_SIZE=0x1000' '-D__HEAP_SIZE=0x1200' '-DMESH_LIB_NATIVE=1' '-DEFR32BG13P632F512GM48=1' -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\platform\emlib\inc" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\protocol\bluetooth\bt_mesh\inc\soc" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\platform\emlib\src" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\platform\radio\rail_lib\protocol\ieee802154" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\hardware\kit\common\halconfig" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\platform\Device\SiliconLabs\EFR32BG13P\Include" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\platform\emdrv\sleep\src" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\platform\radio\rail_lib\common" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\protocol\bluetooth\bt_mesh\inc" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\hardware\kit\common\bsp" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\platform\CMSIS\Include" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\protocol\bluetooth\bt_mesh\src" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\platform\halconfig\inc\hal-config" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\platform\emdrv\uartdrv\inc" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\hardware\kit\common\drivers" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\protocol\bluetooth\bt_mesh\inc\common" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\platform\Device\SiliconLabs\EFR32BG13P\Source\GCC" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\platform\emdrv\sleep\inc" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\platform\radio\rail_lib\protocol\ble" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\platform\emdrv\gpiointerrupt\inc" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\hardware\kit\EFR32BG13_BRD4104A\config" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\platform\Device\SiliconLabs\EFR32BG13P\Source" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\platform\bootloader\api" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\platform\emdrv\common\inc" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\mbedtls" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\mbedtls\include" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\mbedtls\include\mbedtls" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\mbedtls\sl_crypto" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\mbedtls\sl_crypto\include" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\platform\middleware" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\platform\middleware\glib" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\platform\middleware\glib\glib" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\platform\middleware\glib\dmd" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\platform\middleware\glib\dmd\ssd2119" -I"C:\Users\dthes\Desktop\Mesh_Transfer_AES_AD-master\platform\middleware\glib\dmd\display" -Os -fno-builtin -flto -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"platform/middleware/glib/dmd/display/dmd_display.d" -MT"platform/middleware/glib/dmd/display/dmd_display.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


