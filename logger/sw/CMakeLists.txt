# CMakeLists for STM32F4 using the Sourcery toolchain and OpenOCD with both
# C and C++ sources
# 
# To adapt this for any other STM32 chip should be trivial
# To adapt to any other ARM controller shouldn't be much worse
#
# A few convenience targets are provided for OpenOCD, GDB, and Ctags
#
# The structure is as follows
#  /CMSIS
#  /STM32F4xx_StdPeriph...
#  /src (application code)
#  /src/system (application code - low-level configuration)
#  /stm32_flash.ld (linker script for !!!STM32F4 only!!! from Atollic TrueStudio)
#
# Author: Ben Nahill <bnahill@gmail.com>
#


# Use the Sourcery ARM EABI toolchain
set(TC_PREFIX arm-none-eabi-)
set(CMAKE_TOOLCHAIN_FILE toolchain.cmake)

set(TARGET imu_logger)
set(OUTFILE ${TARGET}.elf)

project(${TARGET})
cmake_minimum_required(VERSION 2.8)

# Path to the STM32F4 Peripheral Library driver directory
set(STD_PERIPH_DIR STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/STM32F10x_StdPeriph_Driver)
# Path to the ST USB device driver
set(ST_USB_DEV_DIR usb_device)
# Path to the ST USB device driver
set(ST_USB_OTG_DIR usb_otg)
# Path to the USB application driver
set(ST_USB_APP_DIR usb_cdc)
# Path to CMSIS
set(CMSIS_DIR CMSIS)
# Path to IMU library drivers
set(MCU cortex-m3)

# Memory configuration
set(LD_FLASH_BASE 0x8000000)
set(LD_FLASH_SIZE 512K)
set(LD_FLASH_PAGE_SIZE 2K)
set(LD_FLASH_RES_NUM_PAGES 1)
set(LD_FLASH_RES_SIZE "(${LD_FLASH_PAGE_SIZE} * ${LD_FLASH_RES_NUM_PAGES})")
set(LD_FLASH_RES_BASE "${LD_FLASH_BASE} + ${LD_FLASH_SIZE} - ${LD_FLASH_RES_SIZE}")

set(MCFLAGS "-mcpu=${MCU} -mthumb")

add_definitions(${MCFLAGS})
add_definitions(-g -ffunction-sections  -fdata-sections -Wredundant-decls -Wshadow -Wcast-qual)
add_definitions(-DUSE_STDPERIPH_DRIVER -DSTM32F10X_HD -DHSE_VALUE=8000000 -DARM_MATH_CM3)

# Eliminate the need for a bunch of extra support code that may not work on the chip anyways
set(CMAKE_CXX_FLAGS "--std=c++0x -fno-rtti -fno-exceptions")
# Use the new C11 standard
set(CMAKE_C_FLAGS "--std=c1x")
set(CMAKE_EXE_LINKER_FLAGS "-Tlink.ld -flto  -Wl,-Map=${TARGET}.map,--cref,--gc-sections -nostdlib ${MCFLAGS} ${CMAKE_EXE_LINKER_FLAGS}")

set(STD_PERIPH_SRC_DIR ${STD_PERIPH_DIR}/src)
set(APP_DIR src)
set(FATFS_DIR fatfs/src)
set(DSP_DIR ${CMSIS_DIR}/DSP_Lib/Source)

set(STM_SOURCES
	${STD_PERIPH_SRC_DIR}/misc.c
	${STD_PERIPH_SRC_DIR}/stm32f10x_dac.c
	${STD_PERIPH_SRC_DIR}/stm32f10x_gpio.c
	${STD_PERIPH_SRC_DIR}/stm32f10x_sdio.c
	${STD_PERIPH_SRC_DIR}/stm32f10x_adc.c
	${STD_PERIPH_SRC_DIR}/stm32f10x_dbgmcu.c
	${STD_PERIPH_SRC_DIR}/stm32f10x_i2c.c
	${STD_PERIPH_SRC_DIR}/stm32f10x_spi.c
	${STD_PERIPH_SRC_DIR}/stm32f10x_bkp.c
	${STD_PERIPH_SRC_DIR}/stm32f10x_dma.c
	${STD_PERIPH_SRC_DIR}/stm32f10x_iwdg.c
	${STD_PERIPH_SRC_DIR}/stm32f10x_tim.c
	${STD_PERIPH_SRC_DIR}/stm32f10x_can.c
	${STD_PERIPH_SRC_DIR}/stm32f10x_exti.c
	${STD_PERIPH_SRC_DIR}/stm32f10x_pwr.c
	${STD_PERIPH_SRC_DIR}/stm32f10x_usart.c
	${STD_PERIPH_SRC_DIR}/stm32f10x_cec.c
	${STD_PERIPH_SRC_DIR}/stm32f10x_flash.c
	${STD_PERIPH_SRC_DIR}/stm32f10x_rcc.c
	${STD_PERIPH_SRC_DIR}/stm32f10x_wwdg.c
	${STD_PERIPH_SRC_DIR}/stm32f10x_crc.c
	${STD_PERIPH_SRC_DIR}/stm32f10x_fsmc.c
	${STD_PERIPH_SRC_DIR}/stm32f10x_rtc.c
)

set(CMSIS_DSP_SOURCES
    ${DSP_DIR}/SupportFunctions/arm_fill_q7.c
    ${DSP_DIR}/SupportFunctions/arm_q7_to_float.c
    ${DSP_DIR}/SupportFunctions/arm_q7_to_q31.c
    ${DSP_DIR}/SupportFunctions/arm_float_to_q31.c
    ${DSP_DIR}/SupportFunctions/arm_q7_to_q15.c
    ${DSP_DIR}/SupportFunctions/arm_q31_to_q7.c
    ${DSP_DIR}/SupportFunctions/arm_q15_to_q31.c
    ${DSP_DIR}/SupportFunctions/arm_q15_to_float.c
    ${DSP_DIR}/SupportFunctions/arm_copy_q15.c
    ${DSP_DIR}/SupportFunctions/arm_copy_q7.c
    ${DSP_DIR}/SupportFunctions/arm_q31_to_float.c
    ${DSP_DIR}/SupportFunctions/arm_float_to_q7.c
    ${DSP_DIR}/SupportFunctions/arm_q15_to_q7.c
    ${DSP_DIR}/SupportFunctions/arm_fill_f32.c
    ${DSP_DIR}/SupportFunctions/arm_copy_q31.c
    ${DSP_DIR}/SupportFunctions/arm_q31_to_q15.c
    ${DSP_DIR}/SupportFunctions/arm_copy_f32.c
    ${DSP_DIR}/SupportFunctions/arm_fill_q31.c
    ${DSP_DIR}/SupportFunctions/arm_float_to_q15.c
    ${DSP_DIR}/SupportFunctions/arm_fill_q15.c
    ${DSP_DIR}/FilteringFunctions/arm_correlate_f32.c
    ${DSP_DIR}/FilteringFunctions/arm_biquad_cascade_df1_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_decimate_init_f32.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_q15.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_init_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_init_q15.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_interpolate_init_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_conv_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_decimate_q15.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_decimate_init_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_lms_f32.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_q7.c
    ${DSP_DIR}/FilteringFunctions/arm_biquad_cascade_df1_init_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_conv_partial_fast_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_sparse_init_f32.c
    ${DSP_DIR}/FilteringFunctions/arm_iir_lattice_init_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_biquad_cascade_df2T_f32.c
    ${DSP_DIR}/FilteringFunctions/arm_lms_norm_init_f32.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_decimate_init_q15.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_fast_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_conv_fast_q15.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_f32.c
    ${DSP_DIR}/FilteringFunctions/arm_conv_partial_f32.c
    ${DSP_DIR}/FilteringFunctions/arm_conv_q7.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_interpolate_init_f32.c
    ${DSP_DIR}/FilteringFunctions/arm_conv_partial_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_decimate_f32.c
    ${DSP_DIR}/FilteringFunctions/arm_biquad_cascade_df2T_init_f32.c
    ${DSP_DIR}/FilteringFunctions/arm_lms_norm_q15.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_lattice_init_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_lms_norm_init_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_lattice_init_f32.c
    ${DSP_DIR}/FilteringFunctions/arm_conv_partial_q15.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_sparse_q7.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_sparse_init_q7.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_sparse_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_iir_lattice_f32.c
    ${DSP_DIR}/FilteringFunctions/arm_biquad_cascade_df1_32x64_init_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_conv_fast_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_init_q7.c
    ${DSP_DIR}/FilteringFunctions/arm_biquad_cascade_df1_fast_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_interpolate_f32.c
    ${DSP_DIR}/FilteringFunctions/arm_conv_q15.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_fast_q15.c
    ${DSP_DIR}/FilteringFunctions/arm_biquad_cascade_df1_init_q15.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_sparse_init_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_correlate_fast_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_lattice_init_q15.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_decimate_fast_q15.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_lattice_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_lms_init_f32.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_interpolate_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_iir_lattice_q15.c
    ${DSP_DIR}/FilteringFunctions/arm_lms_norm_f32.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_decimate_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_lms_norm_init_q15.c
    ${DSP_DIR}/FilteringFunctions/arm_biquad_cascade_df1_q15.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_correlate_q7.c
    ${DSP_DIR}/FilteringFunctions/arm_lms_q15.c
    ${DSP_DIR}/FilteringFunctions/arm_correlate_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_biquad_cascade_df1_init_f32.c
    ${DSP_DIR}/FilteringFunctions/arm_iir_lattice_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_correlate_q15.c
    ${DSP_DIR}/FilteringFunctions/arm_biquad_cascade_df1_f32.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_init_f32.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_lattice_f32.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_sparse_init_q15.c
    ${DSP_DIR}/FilteringFunctions/arm_biquad_cascade_df1_32x64_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_conv_f32.c
    ${DSP_DIR}/FilteringFunctions/arm_lms_norm_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_lattice_q15.c
    ${DSP_DIR}/FilteringFunctions/arm_lms_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_sparse_q15.c
    ${DSP_DIR}/FilteringFunctions/arm_correlate_fast_q15.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_sparse_f32.c
    ${DSP_DIR}/FilteringFunctions/arm_iir_lattice_init_q15.c
    ${DSP_DIR}/FilteringFunctions/arm_fir_decimate_fast_q31.c
    ${DSP_DIR}/FilteringFunctions/arm_conv_partial_fast_q15.c
    ${DSP_DIR}/FilteringFunctions/arm_lms_init_q31.c
    ${DSP_DIR}/CommonTables/arm_common_tables.c
    ${DSP_DIR}/MatrixFunctions/arm_mat_mult_f32.c
    ${DSP_DIR}/MatrixFunctions/arm_mat_mult_fast_q31.c
    ${DSP_DIR}/MatrixFunctions/arm_mat_add_q31.c
    ${DSP_DIR}/MatrixFunctions/arm_mat_init_q31.c
    ${DSP_DIR}/MatrixFunctions/arm_mat_add_f32.c
    ${DSP_DIR}/MatrixFunctions/arm_mat_init_f32.c
    ${DSP_DIR}/MatrixFunctions/arm_mat_trans_f32.c
    ${DSP_DIR}/MatrixFunctions/arm_mat_init_q15.c
    ${DSP_DIR}/MatrixFunctions/arm_mat_trans_q31.c
    ${DSP_DIR}/MatrixFunctions/arm_mat_scale_q31.c
    ${DSP_DIR}/MatrixFunctions/arm_mat_add_q15.c
    ${DSP_DIR}/MatrixFunctions/arm_mat_mult_q31.c
    ${DSP_DIR}/MatrixFunctions/arm_mat_mult_q15.c
    ${DSP_DIR}/MatrixFunctions/arm_mat_sub_q31.c
    ${DSP_DIR}/MatrixFunctions/arm_mat_scale_q15.c
    ${DSP_DIR}/MatrixFunctions/arm_mat_inverse_f32.c
    ${DSP_DIR}/MatrixFunctions/arm_mat_mult_fast_q15.c
    ${DSP_DIR}/MatrixFunctions/arm_mat_sub_f32.c
    ${DSP_DIR}/MatrixFunctions/arm_mat_sub_q15.c
    ${DSP_DIR}/MatrixFunctions/arm_mat_scale_f32.c
    ${DSP_DIR}/MatrixFunctions/arm_mat_trans_q15.c
    ${DSP_DIR}/FastMathFunctions/arm_cos_f32.c
    ${DSP_DIR}/FastMathFunctions/arm_cos_q15.c
    ${DSP_DIR}/FastMathFunctions/arm_sqrt_q31.c
    ${DSP_DIR}/FastMathFunctions/arm_cos_q31.c
    ${DSP_DIR}/FastMathFunctions/arm_sin_f32.c
    ${DSP_DIR}/FastMathFunctions/arm_sin_q15.c
    ${DSP_DIR}/FastMathFunctions/arm_sqrt_q15.c
    ${DSP_DIR}/FastMathFunctions/arm_sin_q31.c
    ${DSP_DIR}/TransformFunctions/arm_rfft_q15.c
    ${DSP_DIR}/TransformFunctions/arm_rfft_init_q31.c
    ${DSP_DIR}/TransformFunctions/arm_cfft_radix4_init_q15.c
    ${DSP_DIR}/TransformFunctions/arm_cfft_radix4_q15.c
    ${DSP_DIR}/TransformFunctions/arm_dct4_init_q15.c
    ${DSP_DIR}/TransformFunctions/arm_rfft_init_f32.c
    ${DSP_DIR}/TransformFunctions/arm_dct4_q31.c
    ${DSP_DIR}/TransformFunctions/arm_cfft_radix4_init_q31.c
    ${DSP_DIR}/TransformFunctions/arm_rfft_f32.c
    ${DSP_DIR}/TransformFunctions/arm_dct4_q15.c
    ${DSP_DIR}/TransformFunctions/arm_dct4_f32.c
    ${DSP_DIR}/TransformFunctions/arm_cfft_radix4_init_f32.c
    ${DSP_DIR}/TransformFunctions/arm_cfft_radix4_q31.c
    ${DSP_DIR}/TransformFunctions/arm_dct4_init_f32.c
    ${DSP_DIR}/TransformFunctions/arm_rfft_init_q15.c
    ${DSP_DIR}/TransformFunctions/arm_dct4_init_q31.c
    ${DSP_DIR}/TransformFunctions/arm_rfft_q31.c
    ${DSP_DIR}/TransformFunctions/arm_cfft_radix4_f32.c
    ${DSP_DIR}/BasicMathFunctions/arm_scale_q7.c
    ${DSP_DIR}/BasicMathFunctions/arm_abs_f32.c
    ${DSP_DIR}/BasicMathFunctions/arm_abs_q15.c
    ${DSP_DIR}/BasicMathFunctions/arm_shift_q15.c
    ${DSP_DIR}/BasicMathFunctions/arm_dot_prod_q15.c
    ${DSP_DIR}/BasicMathFunctions/arm_negate_q7.c
    ${DSP_DIR}/BasicMathFunctions/arm_scale_q15.c
    ${DSP_DIR}/BasicMathFunctions/arm_mult_q15.c
    ${DSP_DIR}/BasicMathFunctions/arm_dot_prod_f32.c
    ${DSP_DIR}/BasicMathFunctions/arm_offset_q31.c
    ${DSP_DIR}/BasicMathFunctions/arm_add_q31.c
    ${DSP_DIR}/BasicMathFunctions/arm_abs_q7.c
    ${DSP_DIR}/BasicMathFunctions/arm_scale_f32.c
    ${DSP_DIR}/BasicMathFunctions/arm_shift_q7.c
    ${DSP_DIR}/BasicMathFunctions/arm_sub_q7.c
    ${DSP_DIR}/BasicMathFunctions/arm_add_q7.c
    ${DSP_DIR}/BasicMathFunctions/arm_mult_f32.c
    ${DSP_DIR}/BasicMathFunctions/arm_add_q15.c
    ${DSP_DIR}/BasicMathFunctions/arm_abs_q31.c
    ${DSP_DIR}/BasicMathFunctions/arm_sub_f32.c
    ${DSP_DIR}/BasicMathFunctions/arm_negate_q31.c
    ${DSP_DIR}/BasicMathFunctions/arm_offset_q15.c
    ${DSP_DIR}/BasicMathFunctions/arm_shift_q31.c
    ${DSP_DIR}/BasicMathFunctions/arm_offset_q7.c
    ${DSP_DIR}/BasicMathFunctions/arm_add_f32.c
    ${DSP_DIR}/BasicMathFunctions/arm_dot_prod_q7.c
    ${DSP_DIR}/BasicMathFunctions/arm_negate_f32.c
    ${DSP_DIR}/BasicMathFunctions/arm_negate_q15.c
    ${DSP_DIR}/BasicMathFunctions/arm_dot_prod_q31.c
    ${DSP_DIR}/BasicMathFunctions/arm_scale_q31.c
    ${DSP_DIR}/BasicMathFunctions/arm_offset_f32.c
    ${DSP_DIR}/BasicMathFunctions/arm_sub_q15.c
    ${DSP_DIR}/BasicMathFunctions/arm_sub_q31.c
    ${DSP_DIR}/BasicMathFunctions/arm_mult_q7.c
    ${DSP_DIR}/BasicMathFunctions/arm_mult_q31.c
    ${DSP_DIR}/ComplexMathFunctions/arm_cmplx_mag_f32.c
    ${DSP_DIR}/ComplexMathFunctions/arm_cmplx_mag_squared_q31.c
    ${DSP_DIR}/ComplexMathFunctions/arm_cmplx_mult_cmplx_q31.c
    ${DSP_DIR}/ComplexMathFunctions/arm_cmplx_conj_q15.c
    ${DSP_DIR}/ComplexMathFunctions/arm_cmplx_mult_real_q31.c
    ${DSP_DIR}/ComplexMathFunctions/arm_cmplx_mult_real_q15.c
    ${DSP_DIR}/ComplexMathFunctions/arm_cmplx_mult_cmplx_q15.c
    ${DSP_DIR}/ComplexMathFunctions/arm_cmplx_mag_q15.c
    ${DSP_DIR}/ComplexMathFunctions/arm_cmplx_mult_cmplx_f32.c
    ${DSP_DIR}/ComplexMathFunctions/arm_cmplx_conj_q31.c
    ${DSP_DIR}/ComplexMathFunctions/arm_cmplx_conj_f32.c
    ${DSP_DIR}/ComplexMathFunctions/arm_cmplx_mag_q31.c
    ${DSP_DIR}/ComplexMathFunctions/arm_cmplx_dot_prod_q15.c
    ${DSP_DIR}/ComplexMathFunctions/arm_cmplx_mult_real_f32.c
    ${DSP_DIR}/ComplexMathFunctions/arm_cmplx_dot_prod_q31.c
    ${DSP_DIR}/ComplexMathFunctions/arm_cmplx_dot_prod_f32.c
    ${DSP_DIR}/ComplexMathFunctions/arm_cmplx_mag_squared_q15.c
    ${DSP_DIR}/ComplexMathFunctions/arm_cmplx_mag_squared_f32.c
    ${DSP_DIR}/ControllerFunctions/arm_pid_init_q15.c
    ${DSP_DIR}/ControllerFunctions/arm_pid_init_q31.c
    ${DSP_DIR}/ControllerFunctions/arm_sin_cos_f32.c
    ${DSP_DIR}/ControllerFunctions/arm_pid_reset_q15.c
    ${DSP_DIR}/ControllerFunctions/arm_sin_cos_q31.c
    ${DSP_DIR}/ControllerFunctions/arm_pid_init_f32.c
    ${DSP_DIR}/ControllerFunctions/arm_pid_reset_q31.c
    ${DSP_DIR}/ControllerFunctions/arm_pid_reset_f32.c
    ${DSP_DIR}/StatisticsFunctions/arm_mean_q31.c
    ${DSP_DIR}/StatisticsFunctions/arm_min_f32.c
    ${DSP_DIR}/StatisticsFunctions/arm_var_q15.c
    ${DSP_DIR}/StatisticsFunctions/arm_power_q7.c
    ${DSP_DIR}/StatisticsFunctions/arm_max_f32.c
    ${DSP_DIR}/StatisticsFunctions/arm_rms_f32.c
    ${DSP_DIR}/StatisticsFunctions/arm_mean_q15.c
    ${DSP_DIR}/StatisticsFunctions/arm_mean_q7.c
    ${DSP_DIR}/StatisticsFunctions/arm_max_q15.c
    ${DSP_DIR}/StatisticsFunctions/arm_min_q31.c
    ${DSP_DIR}/StatisticsFunctions/arm_max_q31.c
    ${DSP_DIR}/StatisticsFunctions/arm_std_q31.c
    ${DSP_DIR}/StatisticsFunctions/arm_power_f32.c
    ${DSP_DIR}/StatisticsFunctions/arm_var_q31.c
    ${DSP_DIR}/StatisticsFunctions/arm_std_q15.c
    ${DSP_DIR}/StatisticsFunctions/arm_power_q31.c
    ${DSP_DIR}/StatisticsFunctions/arm_std_f32.c
    ${DSP_DIR}/StatisticsFunctions/arm_mean_f32.c
    ${DSP_DIR}/StatisticsFunctions/arm_rms_q31.c
    ${DSP_DIR}/StatisticsFunctions/arm_min_q15.c
    ${DSP_DIR}/StatisticsFunctions/arm_min_q7.c
    ${DSP_DIR}/StatisticsFunctions/arm_power_q15.c
    ${DSP_DIR}/StatisticsFunctions/arm_var_f32.c
    ${DSP_DIR}/StatisticsFunctions/arm_rms_q15.c
    ${DSP_DIR}/StatisticsFunctions/arm_max_q7.c
)

set(APP_SOURCES
	${APP_DIR}/button.c
	${APP_DIR}/logger.c
	${APP_DIR}/lsm303.c
	${APP_DIR}/activity_detect.c
	${APP_DIR}/sdio.c
	${APP_DIR}/jitter_buffer.c
	${APP_DIR}/system_stm32f10x.c
	${APP_DIR}/fs_hal.c
	${APP_DIR}/lpry.c
	${APP_DIR}/main.c
	${APP_DIR}/sdio_ll.c
	${APP_DIR}/i2c.c
	${APP_DIR}/exti.c
	${APP_DIR}/lps001.c
	${APP_DIR}/rtc.c
	${APP_DIR}/stm32f10x_it.c
	${APP_DIR}/startup_stm32f10x_hd.s
)

set(FATFS_SOURCES
	${FATFS_DIR}/ff.c
)

# Please don't just ignore that assembly file...
set_property(SOURCE ${APP_DIR}/startup_stm32f10x_hd.s PROPERTY LANGUAGE C)

##############################################################
# Options
##############################################################


##############################################################
# Executable and library targets
##############################################################

include_directories(
	.
	src
	${CMSIS_DIR}/Include
	${CMSIS_DIR}/Device/ST/STM32F10x
	${STD_PERIPH_DIR}/inc
	${FATFS_DIR}
)

add_library(std_periph STATIC ${STM_SOURCES})
set(LIBS ${LIBS} std_periph)

add_library(cmsis_dsp STATIC ${CMSIS_DSP_SOURCES})
set(LIBS ${LIBS} cmsis_dsp)

add_library(fatfs STATIC ${FATFS_SOURCES})
set(LIBS ${LIBS} fatfs)

add_executable(${OUTFILE} ${APP_SOURCES})
target_link_libraries(${OUTFILE} ${LIBS})

# Funky workaround to make target dependent on linker script
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/stm32_flash.ld ${CMAKE_CURRENT_BINARY_DIR}/link.ld @ONLY)
#add_custom_command(OUTPUT link.ld COMMAND cat ${CMAKE_SOURCE_DIR}/stm32_flash.ld > link.ld DEPENDS ${CMAKE_SOURCE_DIR}/stm32_flash.ld)
#	add_custom_target(doc
#		${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile
#		WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
#		COMMENT "Generating documentation with Doxygen" VERBATIM
#	)
add_custom_target(linker_script DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/link.ld)

# Warnings only for application code -- Optimizations only on ST/ARM code
set_target_properties(${OUTFILE} PROPERTIES COMPILE_FLAGS "-Wall -Wclobbered -Wempty-body -Wignored-qualifiers -Woverride-init -Wtype-limits -Wuninitialized -O0")
set_target_properties(std_periph PROPERTIES COMPILE_FLAGS "-Wall -O0")
set_target_properties(cmsis_dsp PROPERTIES COMPILE_FLAGS "-w -O2")

add_dependencies(${OUTFILE} linker_script)

##############################################################
# Ctags
##############################################################

set(CTAG_OPTS -R --c-kinds=+p --fields=+iaS --extra=+q)
set(CTAG_SEARCH_LIST
	${STD_PERIPH_DIR}/inc
	${CMSIS_DIR}/CM3/CoreSupport
	${CMSIS_DIR}/CM3/DeviceSupport/ST/STM32F10x
)

foreach(p ${CTAG_SEARCH_LIST})
	set(CTAG_SEARCH ${CTAG_SEARCH} ${CMAKE_SOURCE_DIR}/${p})
endforeach(p)

add_custom_target(ctags
	ctags ${CTAG_OPTS} -f ${CMAKE_SOURCE_DIR}/src/ext_tags ${CTAG_SEARCH}
	COMMENT "Generating Ctags..."
)

##############################################################
# Configuration for GDB
##############################################################

set(GDB    ${TC_PREFIX}gdb)
set(GDBTUI ${TC_PREFIX}gdbtui)

set(GDB_ARGS -x start.gdb)
add_custom_target(gdb COMMAND ${GDB} ${GDB_ARGS})
add_custom_target(gdbtui COMMAND ${GDBTUI} ${GDB_ARGS})
add_custom_target(ddd COMMAND ddd --gdb --debugger \"${GDB} ${GDB_ARGS}\" > /dev/null 2>&1 &
	COMMENT "Launching DDD"
)

add_dependencies(gdb gdb_script)
add_dependencies(gdbtui gdb_script)
add_dependencies(ddd gdb_script)

add_custom_command(OUTPUT start.gdb COMMAND cat ${CMAKE_SOURCE_DIR}/start.gdb > start.gdb DEPENDS ${CMAKE_SOURCE_DIR}/start.gdb)
add_custom_target(gdb_script ALL DEPENDS start.gdb)

##############################################################
# Configuration for OpenOCD
##############################################################

set(OPENOCD openocd)
set(OPENOCD_SCRIPTS
	target.cfg
)
foreach(s ${OPENOCD_SCRIPTS})
	set(OPENOCD_ARGS ${OPENOCD_ARGS} -f ${s})
endforeach(s)

add_custom_target(openocd COMMAND ${OPENOCD} ${OPENOCD_ARGS}
	COMMENT "Launching OpenOCD..."
)

add_custom_command(OUTPUT target.cfg COMMAND cat ${CMAKE_SOURCE_DIR}/target.cfg > target.cfg DEPENDS ${CMAKE_SOURCE_DIR}/target.cfg)
add_custom_target(openocd_script DEPENDS target.cfg)
add_dependencies(openocd openocd_script)
##############################################################
# Doxygen Output
##############################################################

find_package(Doxygen)
if(DOXYGEN_FOUND)
	configure_file(${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile.in ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile @ONLY)
	add_custom_target(doc
		${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile
		WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
		COMMENT "Generating documentation with Doxygen" VERBATIM
	)
endif(DOXYGEN_FOUND)

#############################################################
# HEX file generation
#############################################################

add_custom_target(${TARGET}.hex ALL
	COMMAND ${TC_PREFIX}objcopy -O ihex ${OUTFILE} ${TARGET}.hex
	DEPENDS ${OUTFILE}
	COMMENT "Generating Intel HEX output..."
)
