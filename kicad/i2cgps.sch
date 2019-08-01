EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L dk_Embedded-Microcontrollers:ATTINY85-20PU U?
U 1 1 5D140988
P 4700 3350
F 0 "U?" H 4928 3353 60  0000 L CNN
F 1 "ATTINY85-20PU" H 4928 3247 60  0000 L CNN
F 2 "digikey-footprints:DIP-8_W7.62mm" H 4900 3550 60  0001 L CNN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en589894" H 4900 3650 60  0001 L CNN
F 4 "ATTINY85-20PU-ND" H 4900 3750 60  0001 L CNN "Digi-Key_PN"
F 5 "ATTINY85-20PU" H 4900 3850 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 4900 3950 60  0001 L CNN "Category"
F 7 "Embedded - Microcontrollers" H 4900 4050 60  0001 L CNN "Family"
F 8 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en589894" H 4900 4150 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/microchip-technology/ATTINY85-20PU/ATTINY85-20PU-ND/735469" H 4900 4250 60  0001 L CNN "DK_Detail_Page"
F 10 "IC MCU 8BIT 8KB FLASH 8DIP" H 4900 4350 60  0001 L CNN "Description"
F 11 "Microchip Technology" H 4900 4450 60  0001 L CNN "Manufacturer"
F 12 "Active" H 4900 4550 60  0001 L CNN "Status"
	1    4700 3350
	1    0    0    -1  
$EndComp
$Comp
L power:GNDPWR #PWR?
U 1 1 5D140A46
P 4800 5300
F 0 "#PWR?" H 4800 5100 50  0001 C CNN
F 1 "GNDPWR" H 4804 5146 50  0000 C CNN
F 2 "" H 4800 5250 50  0001 C CNN
F 3 "" H 4800 5250 50  0001 C CNN
	1    4800 5300
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5D140D7D
P 4800 2450
F 0 "#PWR?" H 4800 2300 50  0001 C CNN
F 1 "VCC" H 4817 2623 50  0000 C CNN
F 2 "" H 4800 2450 50  0001 C CNN
F 3 "" H 4800 2450 50  0001 C CNN
	1    4800 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 2450 4800 2700
$Comp
L RF_GPS:ublox_SAM-M8Q U?
U 1 1 5D140E61
P 2800 3350
F 0 "U?" H 2800 2764 50  0000 C CNN
F 1 "ublox_SAM-M8Q" H 2800 2673 50  0000 C CNN
F 2 "RF_Module:ublox_SAM-M8Q" H 3350 2900 50  0001 C CNN
F 3 "https://www.u-blox.com/sites/default/files/SAM-M8Q_DataSheet_%28UBX-16012619%29.pdf" H 2800 3350 50  0001 C CNN
	1    2800 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 2700 4800 2700
Connection ~ 4800 2700
Wire Wire Line
	4800 2700 4800 2950
Text GLabel 4050 3150 0    50   BiDi ~ 0
SDA
Text GLabel 4050 3350 0    50   BiDi ~ 0
SCL
Wire Wire Line
	4050 3350 4500 3350
NoConn ~ 2800 3650
NoConn ~ 2900 3650
NoConn ~ 2300 3550
NoConn ~ 2300 3450
NoConn ~ 2300 3350
NoConn ~ 2300 3250
Wire Wire Line
	4050 3150 4500 3150
Wire Wire Line
	2700 2700 2700 2850
Wire Wire Line
	4500 3250 3300 3250
Wire Wire Line
	4800 3850 4800 4300
Wire Wire Line
	2800 3850 2800 4300
Wire Wire Line
	2800 4300 4800 4300
Connection ~ 4800 4300
Wire Wire Line
	4800 4300 4800 5300
NoConn ~ 3300 3150
NoConn ~ 3300 3450
NoConn ~ 3300 3550
$EndSCHEMATC
