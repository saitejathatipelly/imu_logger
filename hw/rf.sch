EESchema Schematic File Version 2  date Tue 11 Sep 2012 02:20:43 PM EDT
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
LIBS:cc1101
LIBS:sb
LIBS:tp
LIBS:antenna
LIBS:ssd1306_ser
LIBS:imu_logger-cache
EELAYER 25  0
EELAYER END
$Descr A4 11700 8267
encoding utf-8
Sheet 4 6
Title "IMU Logger"
Date "11 sep 2012"
Rev "a"
Comp "McGill University"
Comment1 "Ben Nahill (bnahill@gmail.com)"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L TP TP1
U 1 1 504B63DF
P 4000 3400
F 0 "TP1" H 4000 3300 60  0000 C CNN
F 1 "TP" H 4000 3500 60  0000 C CNN
	1    4000 3400
	0    -1   -1   0   
$EndComp
$Comp
L TP TP2
U 1 1 504B63D1
P 5000 4600
F 0 "TP2" H 5000 4500 60  0000 C CNN
F 1 "TP" H 5000 4700 60  0000 C CNN
	1    5000 4600
	-1   0    0    1   
$EndComp
$Comp
L XTAL_GND X3
U 1 1 50493685
P 5550 4900
F 0 "X3" H 5550 4840 40  0000 C TNN
F 1 "NX3225SA-26.000000MHZ-STD-CSR-1" H 5550 4960 40  0000 C BNN
	1    5550 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 3700 7300 4000
Wire Wire Line
	7300 3700 6100 3700
Wire Wire Line
	9850 4300 9850 4200
Wire Wire Line
	10150 3800 10500 3800
Wire Wire Line
	10500 3800 10500 3700
Connection ~ 5200 4600
Wire Wire Line
	5200 4300 5200 4800
Wire Wire Line
	4000 3500 4000 3600
Wire Wire Line
	7850 3600 6100 3600
Wire Wire Line
	9400 4200 9400 4300
Wire Wire Line
	9950 3800 9750 3800
Wire Wire Line
	9550 3800 9250 3800
Wire Wire Line
	8500 4300 8500 4450
Connection ~ 8250 4000
Wire Wire Line
	8250 4000 8250 3900
Connection ~ 9000 3800
Wire Wire Line
	8900 4000 9000 4000
Wire Wire Line
	9000 4000 9000 3600
Connection ~ 8250 3600
Wire Wire Line
	8250 3600 8250 3700
Wire Wire Line
	8700 3600 8050 3600
Wire Wire Line
	8500 3600 8500 3450
Connection ~ 8500 3600
Wire Wire Line
	9000 3600 8900 3600
Wire Wire Line
	9050 3800 9000 3800
Wire Wire Line
	8700 4000 8050 4000
Wire Wire Line
	8500 4000 8500 4100
Connection ~ 8500 4000
Wire Wire Line
	8500 3150 8500 3250
Wire Wire Line
	9400 4000 9400 3800
Connection ~ 9400 3800
Wire Wire Line
	8500 4650 8500 4750
Wire Wire Line
	4550 4350 4550 4150
Wire Wire Line
	5500 4550 5500 4300
Wire Wire Line
	6850 3400 7100 3400
Connection ~ 6450 3400
Wire Wire Line
	6450 3350 6450 3400
Connection ~ 5600 5300
Wire Wire Line
	5400 5200 5400 5300
Wire Wire Line
	5400 5300 5750 5300
Connection ~ 5400 4900
Wire Wire Line
	5400 4300 5400 5000
Wire Wire Line
	5450 4900 5400 4900
Wire Wire Line
	5300 4650 5300 4300
Connection ~ 5400 2050
Wire Wire Line
	5400 2050 5900 2050
Wire Wire Line
	5900 2050 5900 2100
Wire Wire Line
	5500 2900 5500 2300
Wire Wire Line
	5500 2300 5750 2300
Wire Wire Line
	5750 2300 5750 2450
Connection ~ 6050 2400
Wire Wire Line
	5600 2800 5900 2800
Wire Wire Line
	5600 2800 5600 2900
Wire Wire Line
	5200 2700 5200 2900
Wire Wire Line
	4500 3400 4700 3400
Wire Wire Line
	3750 3700 4700 3700
Wire Wire Line
	6200 3400 6200 3500
Wire Wire Line
	6200 3500 6100 3500
Wire Wire Line
	4500 3500 4700 3500
Wire Wire Line
	5300 2900 5300 1700
Wire Wire Line
	5300 1700 6050 1700
Wire Wire Line
	6050 1700 6050 2500
Wire Wire Line
	5750 2750 5750 2800
Connection ~ 5750 2800
Wire Wire Line
	5400 2900 5400 2000
Wire Wire Line
	5900 2800 5900 2300
Connection ~ 5900 2400
Wire Wire Line
	5650 4900 5750 4900
Wire Wire Line
	5600 4400 5750 4400
Wire Wire Line
	5600 4400 5600 4300
Wire Wire Line
	5750 4400 5750 5000
Connection ~ 5750 4900
Wire Wire Line
	5600 5400 5600 5300
Wire Wire Line
	5750 5300 5750 5200
Wire Wire Line
	6550 3400 6100 3400
Connection ~ 6200 3400
Wire Wire Line
	6450 3150 6450 2400
Wire Wire Line
	6450 2400 5900 2400
Wire Wire Line
	6200 3900 6200 3800
Wire Wire Line
	6200 3800 6100 3800
Wire Wire Line
	4550 3950 4550 3800
Wire Wire Line
	4550 3800 4700 3800
Wire Wire Line
	7300 4000 7850 4000
Wire Notes Line
	11050 2950 7650 2950
Wire Notes Line
	11050 2950 11050 4900
Wire Notes Line
	11050 4900 7650 4900
Wire Notes Line
	7650 4900 7650 2950
Wire Wire Line
	5200 4600 5100 4600
Wire Wire Line
	4700 3600 3750 3600
Connection ~ 4000 3600
Wire Wire Line
	9850 3800 9850 4000
Connection ~ 9850 3800
$Comp
L CAP C52
U 1 1 5047CA2F
P 9850 4100
F 0 "C52" H 9870 4070 50  0000 L TNN
F 1 "5.6p" H 9875 4120 30  0000 L BNN
	1    9850 4100
	0    1    1    0   
$EndComp
$Comp
L GND #PWR016
U 1 1 5047CA2E
P 9850 4300
F 0 "#PWR016" H 9850 4300 30  0001 C CNN
F 1 "GND" H 9850 4230 30  0001 C CNN
	1    9850 4300
	1    0    0    -1  
$EndComp
$Comp
L ANTENNA ANT1
U 1 1 50478765
P 10500 3550
F 0 "ANT1" H 10750 3350 60  0000 C CNN
F 1 "ANT-916/433-HESM" H 10550 3750 60  0000 C CNN
	1    10500 3550
	1    0    0    -1  
$EndComp
Text HLabel 5200 4800 3    60   BiDi ~ 0
GDO0
Text HLabel 3750 3600 0    60   BiDi ~ 0
GDO2
$Comp
L CAP C47
U 1 1 5047701F
P 8250 3800
F 0 "C47" H 8270 3770 50  0000 L TNN
F 1 "1.0p" H 8275 3820 30  0000 L BNN
	1    8250 3800
	0    -1   -1   0   
$EndComp
$Comp
L CAP C48
U 1 1 5047701E
P 8500 3350
F 0 "C48" H 8520 3320 50  0000 L TNN
F 1 "1.5p" H 8525 3370 30  0000 L BNN
	1    8500 3350
	0    -1   -1   0   
$EndComp
$Comp
L CAP C49
U 1 1 5047701D
P 8500 4550
F 0 "C49" H 8520 4520 50  0000 L TNN
F 1 "100p" H 8525 4570 30  0000 L BNN
	1    8500 4550
	0    -1   -1   0   
$EndComp
$Comp
L CAP C50
U 1 1 5047701C
P 8800 4000
F 0 "C50" H 8820 3970 50  0000 L TNN
F 1 "1.5p" H 8825 4020 30  0000 L BNN
	1    8800 4000
	-1   0    0    1   
$EndComp
$Comp
L CAP C51
U 1 1 5047701B
P 9400 4100
F 0 "C51" H 9420 4070 50  0000 L TNN
F 1 "3.3p" H 9425 4120 30  0000 L BNN
	1    9400 4100
	0    1    1    0   
$EndComp
$Comp
L CAP C53
U 1 1 5047701A
P 10050 3800
F 0 "C53" H 10070 3770 50  0000 L TNN
F 1 "12p" H 10075 3820 30  0000 L BNN
	1    10050 3800
	1    0    0    -1  
$EndComp
$Comp
L IND L3
U 1 1 50477019
P 7950 3600
F 0 "L3" H 7970 3570 50  0000 L TNN
F 1 "12n" H 7975 3620 30  0000 L BNN
	1    7950 3600
	1    0    0    -1  
$EndComp
$Comp
L IND L4
U 1 1 50477018
P 7950 4000
F 0 "L4" H 7970 3970 50  0000 L TNN
F 1 "12n" H 7975 4020 30  0000 L BNN
	1    7950 4000
	1    0    0    -1  
$EndComp
$Comp
L IND L6
U 1 1 50477017
P 8800 3600
F 0 "L6" H 8820 3570 50  0000 L TNN
F 1 "18n" H 8825 3620 30  0000 L BNN
	1    8800 3600
	1    0    0    -1  
$EndComp
$Comp
L IND L5
U 1 1 50477016
P 8500 4200
F 0 "L5" H 8520 4170 50  0000 L TNN
F 1 "18n" H 8525 4220 30  0000 L BNN
	1    8500 4200
	0    -1   -1   0   
$EndComp
$Comp
L IND L7
U 1 1 50477015
P 9150 3800
F 0 "L7" H 9170 3770 50  0000 L TNN
F 1 "12n" H 9175 3820 30  0000 L BNN
	1    9150 3800
	1    0    0    -1  
$EndComp
$Comp
L IND L8
U 1 1 50477014
P 9650 3800
F 0 "L8" H 9670 3770 50  0000 L TNN
F 1 "12n" H 9675 3820 30  0000 L BNN
	1    9650 3800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR017
U 1 1 50477013
P 8500 4750
F 0 "#PWR017" H 8500 4750 30  0001 C CNN
F 1 "GND" H 8500 4680 30  0001 C CNN
	1    8500 4750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR018
U 1 1 50477012
P 9400 4300
F 0 "#PWR018" H 9400 4300 30  0001 C CNN
F 1 "GND" H 9400 4230 30  0001 C CNN
	1    9400 4300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR019
U 1 1 50477011
P 8500 3150
F 0 "#PWR019" H 8500 3150 30  0001 C CNN
F 1 "GND" H 8500 3080 30  0001 C CNN
	1    8500 3150
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR020
U 1 1 50476945
P 4550 4350
F 0 "#PWR020" H 4550 4350 30  0001 C CNN
F 1 "GND" H 4550 4280 30  0001 C CNN
	1    4550 4350
	1    0    0    -1  
$EndComp
$Comp
L CAP C42
U 1 1 5047693E
P 4550 4050
F 0 "C42" H 4570 4020 50  0000 L TNN
F 1 "0.1u" H 4575 4070 30  0000 L BNN
	1    4550 4050
	0    -1   -1   0   
$EndComp
Text Label 5500 4550 0    60   ~ 0
AVdd
Text Label 6200 3900 3    60   ~ 0
AVdd
$Comp
L CAP C46
U 1 1 5047690A
P 6450 3250
F 0 "C46" H 6470 3220 50  0000 L TNN
F 1 "0.01u" H 6475 3270 30  0000 L BNN
	1    6450 3250
	0    -1   -1   0   
$EndComp
$Comp
L RES R10
U 1 1 504768F9
P 6700 3400
F 0 "R10" H 6770 3365 50  0000 L TNN
F 1 "4.7R" H 6700 3455 30  0000 C BNN
	1    6700 3400
	1    0    0    -1  
$EndComp
Text Label 6200 3400 0    60   ~ 0
AVdd
$Comp
L GND #PWR021
U 1 1 504768D8
P 5600 5400
F 0 "#PWR021" H 5600 5400 30  0001 C CNN
F 1 "GND" H 5600 5330 30  0001 C CNN
	1    5600 5400
	1    0    0    -1  
$EndComp
$Comp
L CAP C44
U 1 1 504768CF
P 5750 5100
F 0 "C44" H 5770 5070 50  0000 L TNN
F 1 "27p" H 5775 5120 30  0000 L BNN
	1    5750 5100
	0    -1   -1   0   
$EndComp
$Comp
L CAP C43
U 1 1 504768CC
P 5400 5100
F 0 "C43" H 5420 5070 50  0000 L TNN
F 1 "27p" H 5425 5120 30  0000 L BNN
	1    5400 5100
	0    -1   -1   0   
$EndComp
Text HLabel 5300 4650 3    60   Input ~ 0
nCS
$Comp
L CAP C45
U 1 1 50462F5B
P 5900 2200
F 0 "C45" H 5920 2170 50  0000 L TNN
F 1 "0.1u" H 5925 2220 30  0000 L BNN
	1    5900 2200
	0    -1   -1   0   
$EndComp
Text HLabel 5400 2000 1    60   Input ~ 0
Vdd
$Comp
L RES R4
U 1 1 50462F15
P 5750 2600
F 0 "R4" H 5820 2565 50  0000 L TNN
F 1 "56k (1%)" H 5750 2655 30  0000 C BNN
	1    5750 2600
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR022
U 1 1 50462EFE
P 6050 2500
F 0 "#PWR022" H 6050 2500 30  0001 C CNN
F 1 "GND" H 6050 2430 30  0001 C CNN
	1    6050 2500
	1    0    0    -1  
$EndComp
Text HLabel 7100 3400 2    60   Input ~ 0
Vdd
Text HLabel 3750 3700 0    60   Input ~ 0
Vdd
Text HLabel 4500 3400 0    60   Input ~ 0
SCLK
Text HLabel 4500 3500 0    60   Output ~ 0
SDO
Text HLabel 5200 2700 1    60   Input ~ 0
SDI
$Comp
L CC1101 U8
U 1 1 50462E7F
P 5400 3600
F 0 "U8" H 5750 2900 60  0000 C CNN
F 1 "CC1101" H 5800 4250 60  0000 C CNN
	1    5400 3600
	1    0    0    -1  
$EndComp
$EndSCHEMATC
