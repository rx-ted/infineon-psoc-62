BSP_ROOT ?= .
RTT_ROOT ?= $(BSP_ROOT)/rt-thread
MAP_ROOT ?= build/rtthread.map

CROSS_COMPILE ?=D:\\workers\\env-windows\\tools\\gnu_gcc\\arm_gcc\\mingw\\bin\\arm-none-eabi-

CFLAGS := -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard -ffunction-sections -fdata-sections -Dgcc -O0 -gdwarf-2 -g
AFLAGS := -c -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard -ffunction-sections -fdata-sections -x assembler-with-cpp -Wa,-mimplicit-it=thumb  -gdwarf-2
LFLAGS := -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard -ffunction-sections -fdata-sections -Wl,--gc-sections,-Map=$(MAP_ROOT),-cref,-u,Reset_Handler -T board/linker_scripts/link.ld
CXXFLAGS := -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard -ffunction-sections -fdata-sections -Dgcc -O0 -gdwarf-2 -g
EXTERN_LIB := -lc -lm 

CPPPATHS :=-I$(BSP_ROOT)\applications \
	-I$(BSP_ROOT)\applications\sys \
	-I$(RTT_ROOT)\components\libc\compilers\common\include \
	-I$(RTT_ROOT)\components\libc\compilers\newlib \
	-I$(RTT_ROOT)\components\libc\cplusplus \
	-I$(RTT_ROOT)\libcpu\arm\common \
	-I$(RTT_ROOT)\libcpu\arm\cortex-m4 \
	-I$(RTT_ROOT)\components\drivers\include \
	-I$(BSP_ROOT)\board \
	-I$(BSP_ROOT)\board\ports \
	-I$(BSP_ROOT)\libraries\HAL_Drivers \
	-I$(BSP_ROOT)\libraries\HAL_Drivers\config \
	-I$(RTT_ROOT)\components\finsh \
	-I$(BSP_ROOT)\applications\fonts \
	-I$(BSP_ROOT) \
	-I$(RTT_ROOT)\include \
	-I$(BSP_ROOT)\applications\lcd \
	-I$(BSP_ROOT)\libraries\IFX_PSOC6_HAL\retarget-io \
	-I$(BSP_ROOT)\libraries\IFX_PSOC6_HAL\core-lib\include \
	-I$(BSP_ROOT)\libraries\IFX_PSOC6_HAL\mtb_shared\usbdev \
	-I$(BSP_ROOT)\libraries\IFX_PSOC6_HAL\mtb_shared\csdidac \
	-I$(BSP_ROOT)\libraries\IFX_PSOC6_HAL\mtb_shared\serial-flash \
	-I$(BSP_ROOT)\libraries\IFX_PSOC6_HAL\mtb-pdl-cat1\cmsis\include \
	-I$(BSP_ROOT)\libraries\IFX_PSOC6_HAL\mtb-pdl-cat1\drivers\include \
	-I$(BSP_ROOT)\libraries\IFX_PSOC6_HAL\mtb-hal-cat1\include_pvt \
	-I$(BSP_ROOT)\libraries\IFX_PSOC6_HAL\mtb-hal-cat1\include \
	-I$(BSP_ROOT)\libraries\IFX_PSOC6_HAL\psoc6cm0p \
	-I$(BSP_ROOT)\libraries\IFX_PSOC6_HAL\capsense \
	-I$(BSP_ROOT)\libraries\IFX_PSOC6_HAL\mtb-hal-cat1\COMPONENT_CAT1A\include \
	-I$(BSP_ROOT)\libraries\IFX_PSOC6_HAL\mtb-pdl-cat1\devices\COMPONENT_CAT1A\include \
	-I$(BSP_ROOT)\libs\TARGET_RTT-062S2 \
	-I$(BSP_ROOT)\libs\TARGET_RTT-062S2\config\GeneratedSource \
	-I$(RTT_ROOT)\components\libc\posix\io\poll \
	-I$(RTT_ROOT)\components\libc\posix\io\stdio \
	-I$(RTT_ROOT)\components\libc\posix\ipc 

DEFINES := -DCOMPONENT_CAT1 -DCOMPONENT_CAT1A -DCORE_NAME_CM0P_0 -DCORE_NAME_CM4_0 -DCY8C624ALQI_S2D42 -DCY_USING_HAL -DCY_USING_PREBUILT_CM0P_IMAGE -DRT_USING_LIBC -DRT_USING_NEWLIBC -D_POSIX_C_SOURCE=1 -D__RTTHREAD__
