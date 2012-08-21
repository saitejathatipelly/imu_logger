EESchema Schematic File Version 2  date Tue 21 Aug 2012 04:28:32 PM EDT
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:cap
LIBS:ltc3559
LIBS:mt29fxx01a
LIBS:res
LIBS:usbmicroconn
LIBS:mma8452q
LIBS:l3gd20
LIBS:mag3110
LIBS:lps331ap
LIBS:stm32f405rg
LIBS:ind
LIBS:swd_10pin
LIBS:pushbutton
LIBS:xtal
LIBS:imu_logger-cache
EELAYER 25  0
EELAYER END
$Descr A4 11700 8267
encoding utf-8
Sheet 1 4
Title "IMU Logger"
Date "21 aug 2012"
Rev "a"
Comp "McGill University"
Comment1 "Ben Nahill (bnahill@gmail.com)"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 4300 4350 2200 2250
U 50339999
F0 "stm32f4" 60
F1 "stm32f4.sch" 60
F2 "nRESET" I L 4300 4600 60 
F3 "Vdd" I L 4300 4500 60 
F4 "USB_ID" B L 4300 5100 60 
F5 "USB_D-" B L 4300 4900 60 
F6 "USB_D+" B L 4300 5000 60 
F7 "Vusb" I L 4300 4800 60 
F8 "I2C2_SDA" B R 6500 5000 60 
F9 "I2C2_SCL" B R 6500 5100 60 
F10 "I2C1_SCL" B R 6500 4600 60 
F11 "I2C1_SDA" B R 6500 4500 60 
F12 "SPI2_CLK" O L 4300 5900 60 
F13 "SPI2_MISO" I L 4300 6100 60 
F14 "SPI2_MOSI" O L 4300 6000 60 
F15 "SPI1_MOSI" O R 6500 5550 60 
F16 "SPI1_MISO" I R 6500 5650 60 
F17 "SPI1_CLK" O R 6500 5450 60 
F18 "PRS_nCS" O R 6500 5750 60 
F19 "GYR_nCS" O R 6500 5850 60 
F20 "FLASH_nCS" O L 4300 6200 60 
F21 "EXTI3" I R 6500 5200 60 
F22 "EXTI1" I R 6500 5950 60 
F23 "EXTI0" I R 6500 6050 60 
F24 "EXTI4" I R 6500 4800 60 
F25 "EXTI2" I R 6500 4700 60 
F26 "FLASH_nHOLD" O L 4300 6400 60 
F27 "FLASH_nWP" O L 4300 6300 60 
F28 "POW_nCHRG" I L 4300 5300 60 
F29 "POW_SUSP_EN" O L 4300 5400 60 
F30 "POW_HPWR" O L 4300 5500 60 
F31 "POW_MODE" O L 4300 5600 60 
F33 "EXTI10" I R 6500 6300 60 
$EndSheet
Wire Wire Line
	1700 5100 4300 5100
Wire Wire Line
	1700 5100 1700 2000
Wire Wire Line
	4300 4900 1900 4900
Wire Wire Line
	3400 2400 3800 2400
Wire Wire Line
	3800 2400 3800 5600
Wire Wire Line
	3800 5600 4300 5600
Wire Wire Line
	3400 2100 4000 2100
Wire Wire Line
	4000 2100 4000 5400
Wire Wire Line
	4000 5400 4300 5400
Wire Wire Line
	6500 6300 6800 6300
Wire Wire Line
	6800 6300 6800 6400
Wire Wire Line
	2500 6000 3000 6000
Wire Wire Line
	3000 6000 3000 6400
Wire Wire Line
	3000 6400 4300 6400
Wire Wire Line
	10300 4500 10500 4500
Wire Wire Line
	10500 4500 10500 6050
Wire Wire Line
	10500 6050 6500 6050
Wire Wire Line
	6500 5950 8300 5950
Wire Wire Line
	8450 3800 7800 3800
Wire Wire Line
	7800 3800 7800 4800
Wire Wire Line
	7800 4800 6500 4800
Wire Wire Line
	8450 4300 8200 4300
Wire Wire Line
	8200 4300 8200 5850
Wire Wire Line
	8200 5850 6500 5850
Wire Wire Line
	1800 5900 1600 5900
Wire Wire Line
	1600 5900 1600 6500
Wire Wire Line
	1600 6500 3200 6500
Wire Wire Line
	3200 6500 3200 6200
Wire Wire Line
	3200 6200 4300 6200
Wire Wire Line
	10300 3500 11100 3500
Wire Wire Line
	11100 3500 11100 5100
Wire Wire Line
	11100 5100 6500 5100
Connection ~ 8000 5550
Wire Wire Line
	10300 4100 10800 4100
Wire Wire Line
	10800 4100 10800 5550
Wire Wire Line
	10800 5550 6500 5550
Wire Wire Line
	8450 4200 8100 4200
Wire Wire Line
	8100 4200 8100 5650
Wire Wire Line
	4300 6100 3200 6100
Wire Wire Line
	3200 6100 3200 5800
Wire Wire Line
	8450 4000 7900 4000
Wire Wire Line
	7900 4000 7900 5450
Wire Wire Line
	8450 3400 7500 3400
Wire Wire Line
	7500 3400 7500 4500
Wire Wire Line
	7500 4500 6500 4500
Wire Wire Line
	3200 5800 2500 5800
Connection ~ 2000 2300
Wire Wire Line
	2000 1700 2000 4800
Connection ~ 2200 5400
Wire Wire Line
	2200 5450 2200 5400
Wire Wire Line
	1350 1800 1900 1800
Wire Wire Line
	1900 1800 1900 4900
Wire Wire Line
	3600 5600 3600 5800
Connection ~ 3600 3400
Wire Wire Line
	3600 3400 3600 4500
Wire Wire Line
	3600 4500 4300 4500
Wire Wire Line
	2200 6250 2200 6350
Wire Wire Line
	2150 6400 2150 6350
Wire Wire Line
	8450 3100 8250 3100
Wire Wire Line
	8250 3100 8250 2700
Wire Wire Line
	8250 2700 3400 2700
Wire Wire Line
	1350 2100 1550 2100
Wire Wire Line
	1550 2100 1550 2200
Wire Wire Line
	2000 1700 1350 1700
Wire Wire Line
	2100 2300 2000 2300
Wire Wire Line
	5000 2700 5000 3400
Connection ~ 5000 2700
Wire Wire Line
	5000 3400 2500 3400
Wire Wire Line
	2100 5400 2500 5400
Wire Wire Line
	2100 5400 2100 5450
Wire Wire Line
	2500 5400 2500 3400
Wire Wire Line
	2100 6250 2100 6350
Wire Wire Line
	2100 6350 2200 6350
Connection ~ 2150 6350
Wire Wire Line
	4300 4600 3600 4600
Wire Wire Line
	1700 2000 1350 2000
Wire Wire Line
	1800 1900 1800 5000
Wire Wire Line
	1800 1900 1350 1900
Wire Wire Line
	3600 4600 3600 5200
Wire Wire Line
	4300 5900 3400 5900
Wire Wire Line
	3400 5900 3400 6600
Wire Wire Line
	3400 6600 1500 6600
Wire Wire Line
	1500 6600 1500 5800
Wire Wire Line
	1500 5800 1800 5800
Wire Wire Line
	2500 5700 3300 5700
Wire Wire Line
	6500 4600 7600 4600
Wire Wire Line
	7600 4600 7600 3500
Wire Wire Line
	7600 3500 8450 3500
Wire Wire Line
	4300 6000 3300 6000
Wire Wire Line
	3300 6000 3300 5700
Wire Wire Line
	8000 5550 8000 4100
Wire Wire Line
	8000 4100 8450 4100
Wire Wire Line
	6500 5450 10900 5450
Wire Wire Line
	10900 5450 10900 4000
Wire Wire Line
	10900 4000 10300 4000
Connection ~ 7900 5450
Wire Wire Line
	6500 5650 10700 5650
Wire Wire Line
	10700 5650 10700 4200
Wire Wire Line
	10700 4200 10300 4200
Connection ~ 8100 5650
Wire Wire Line
	6500 5000 11200 5000
Wire Wire Line
	11200 5000 11200 3400
Wire Wire Line
	11200 3400 10300 3400
Wire Wire Line
	6500 5750 10600 5750
Wire Wire Line
	10600 5750 10600 4300
Wire Wire Line
	10600 4300 10300 4300
Wire Wire Line
	6500 4700 7700 4700
Wire Wire Line
	7700 4700 7700 3700
Wire Wire Line
	7700 3700 8450 3700
Wire Wire Line
	6500 5200 11000 5200
Wire Wire Line
	11000 5200 11000 3700
Wire Wire Line
	11000 3700 10300 3700
Wire Wire Line
	8300 5950 8300 4500
Wire Wire Line
	8300 4500 8450 4500
Wire Wire Line
	4300 6300 3100 6300
Wire Wire Line
	3100 6300 3100 5900
Wire Wire Line
	3100 5900 2500 5900
Wire Wire Line
	6800 7000 6800 6800
Wire Wire Line
	4300 5300 4100 5300
Wire Wire Line
	4100 5300 4100 2000
Wire Wire Line
	4100 2000 3400 2000
Wire Wire Line
	4300 5500 3900 5500
Wire Wire Line
	3900 5500 3900 2200
Wire Wire Line
	3900 2200 3400 2200
Wire Wire Line
	2000 4800 4300 4800
Wire Wire Line
	1800 5000 4300 5000
$Comp
L GND #PWR4
U 1 1 5033E328
P 6800 7000
F 0 "#PWR4" H 6800 7000 30  0001 C CNN
F 1 "GND" H 6800 6930 30  0001 C CNN
	1    6800 7000
	1    0    0    -1  
$EndComp
$Comp
L USBMICROCONN J1
U 1 1 5033D54E
P 1200 1900
F 0 "J1" H 1050 1600 60  0000 C CNN
F 1 "10118194-0001LF" V 700 1900 60  0000 C CNN
	1    1200 1900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR3
U 1 1 5033C3CF
P 3600 5800
F 0 "#PWR3" H 3600 5800 30  0001 C CNN
F 1 "GND" H 3600 5730 30  0001 C CNN
	1    3600 5800
	1    0    0    -1  
$EndComp
$Comp
L PUSHBUTTON PB2
U 1 1 5033C37F
P 6800 6600
F 0 "PB2" H 6950 6625 40  0000 L BNN
F 1 "ALPS_SKQG" H 6800 6575 40  0000 C TNN
	1    6800 6600
	0    1    1    0   
$EndComp
$Comp
L PUSHBUTTON PB1
U 1 1 5033C37A
P 3600 5400
F 0 "PB1" H 3750 5425 40  0000 L BNN
F 1 "ALPS_SKQG" H 3600 5375 40  0000 C TNN
	1    3600 5400
	0    1    1    0   
$EndComp
$Sheet
S 8450 2950 1850 1800
U 5032F4FC
F0 "sensors" 60
F1 "sensors.sch" 60
F2 "ACC_INT2" O L 8450 3800 60 
F3 "ACC_INT1" O L 8450 3700 60 
F4 "ACC_I2C_SCL" B L 8450 3500 60 
F5 "ACC_I2C_SDA" B L 8450 3400 60 
F6 "GYR_INT1" O L 8450 4500 60 
F7 "GYR_DRDY/INT2" O L 8450 4600 60 
F8 "GYR_SPI_CLK" I L 8450 4000 60 
F9 "GYR_SPI_MOSI" I L 8450 4100 60 
F10 "GYR_SPI_MISO" O L 8450 4200 60 
F11 "GYR_SPI_nCS" I L 8450 4300 60 
F12 "Vdd" I L 8450 3100 60 
F13 "MAG_INT1" O R 10300 3700 60 
F14 "MAG_I2C_SCL" B R 10300 3500 60 
F15 "MAG_I2C_SDA" B R 10300 3400 60 
F16 "PRS_INT2" O R 10300 4600 60 
F17 "PRS_INT1" O R 10300 4500 60 
F18 "PRS_SPI_CLK" I R 10300 4000 60 
F19 "PRS_SPI_MOSI" I R 10300 4100 60 
F20 "PRS_SPI_MISO" O R 10300 4200 60 
F21 "PRS_SPI_nCS" I R 10300 4300 60 
$EndSheet
$Comp
L GND #PWR2
U 1 1 5033E93E
P 2150 6400
F 0 "#PWR2" H 2150 6400 30  0001 C CNN
F 1 "GND" H 2150 6330 30  0001 C CNN
	1    2150 6400
	1    0    0    -1  
$EndComp
$Comp
L MT29FXX01A U1
U 1 1 00000000
P 2150 5850
F 0 "U1" H 2250 6200 60  0000 L BNN
F 1 "MT29FXX01A" H 2250 5500 60  0000 L TNN
	1    2150 5850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR1
U 1 1 5033E93F
P 1550 2200
F 0 "#PWR1" H 1550 2200 30  0001 C CNN
F 1 "GND" H 1550 2130 30  0001 C CNN
	1    1550 2200
	1    0    0    -1  
$EndComp
$Sheet
S 2100 1850 1300 1100
U 5032B8A6
F0 "power" 60
F1 "power.sch" 60
F2 "SUSP_EN" I R 3400 2100 60 
F3 "nCHRG" O R 3400 2000 60 
F4 "HPWR_EN" I R 3400 2200 60 
F5 "Vbat" O R 3400 2600 60 
F6 "Vreg" O R 3400 2700 60 
F7 "Vbus" I L 2100 2300 60 
F8 "REG_MODE" I R 3400 2400 60 
$EndSheet
$EndSCHEMATC
