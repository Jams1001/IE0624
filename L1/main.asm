;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"main.c"
	list	p=12f675
	radix dec
	include "p12f675.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config 0x3fd7
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_ANSEL
	extern	_VRCON
	extern	_TRISIO
	extern	_CMCON
	extern	_GPIObits
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_display
	global	_delay

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0020
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_main_0	udata
r0x100C	res	1
r0x100D	res	1
r0x100E	res	1
r0x100F	res	1
r0x1010	res	1
r0x1011	res	1
r0x1012	res	1
r0x100B	res	1
r0x100A	res	1
r0x1003	res	1
r0x1002	res	1
r0x1004	res	1
r0x1005	res	1
r0x1006	res	1
r0x1007	res	1
r0x1008	res	1
r0x1009	res	1
_main_bandera_65537_4	res	2
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_main	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _display
;   _delay
;   _display
;   _delay
;   _display
;   _delay
;   _display
;   _delay
;   _delay
;   _delay
;   _delay
;   _display
;   _delay
;   _display
;   _delay
;   _display
;   _delay
;   _display
;   _delay
;   _delay
;   _delay
;   _delay
;8 compiler assigned registers:
;   r0x100C
;   r0x100D
;   r0x100E
;   r0x100F
;   r0x1010
;   r0x1011
;   r0x1012
;   STK00
;; Starting pCode block
S_main__main	code
_main:
; 2 exit points
;	.line	12; "main.c"	TRISIO = 0b00001000; 
	MOVLW	0x08
	BANKSEL	_TRISIO
	MOVWF	_TRISIO
;	.line	13; "main.c"	ANSEL  = 0x00;  
	CLRF	_ANSEL
;	.line	14; "main.c"	CMCON  = 0x07; 
	MOVLW	0x07
	BANKSEL	_CMCON
	MOVWF	_CMCON
;	.line	15; "main.c"	VRCON  = 0x00;  
	BANKSEL	_VRCON
	CLRF	_VRCON
;	.line	16; "main.c"	int num1 = 2;
	MOVLW	0x02
	MOVWF	r0x100C
	CLRF	r0x100D
;	.line	17; "main.c"	int num2 = 1;
	MOVLW	0x01
	MOVWF	r0x100E
	CLRF	r0x100F
;	.line	18; "main.c"	int counter = 0;
	CLRF	r0x1010
	CLRF	r0x1011
_00122_DS_:
;	.line	24; "main.c"	num1 = num1 + 1;
	INCF	r0x100C,F
	BTFSC	STATUS,2
	INCF	r0x100D,F
;	.line	25; "main.c"	num2 = num2 + 1;
	INCF	r0x100E,F
	BTFSC	STATUS,2
	INCF	r0x100F,F
;;signed compare: left < lit(0xA=10), size=2, mask=ffff
;	.line	26; "main.c"	if (num1 >= 10){
	MOVF	r0x100D,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00159_DS_
	MOVLW	0x0a
	SUBWF	r0x100C,W
_00159_DS_:
	BTFSS	STATUS,0
	GOTO	_00106_DS_
;;genSkipc:3307: created from rifx:0x7ffce79c4140
;	.line	27; "main.c"	num1 = 0;
	CLRF	r0x100C
	CLRF	r0x100D
;;signed compare: left < lit(0xA=10), size=2, mask=ffff
_00106_DS_:
;	.line	29; "main.c"	if (num2 >= 10){
	MOVF	r0x100F,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00160_DS_
	MOVLW	0x0a
	SUBWF	r0x100E,W
_00160_DS_:
	BTFSS	STATUS,0
	GOTO	_00108_DS_
;;genSkipc:3307: created from rifx:0x7ffce79c4140
;	.line	30; "main.c"	num2 = 0;
	CLRF	r0x100E
	CLRF	r0x100F
_00108_DS_:
;	.line	33; "main.c"	if(GP3 == 1){
	CLRF	r0x1012
	BANKSEL	_GPIObits
	BTFSC	_GPIObits,3
	INCF	r0x1012,F
	MOVF	r0x1012,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00117_DS_
;	.line	35; "main.c"	counter++;
	INCF	r0x1010,F
	BTFSC	STATUS,2
	INCF	r0x1011,F
;	.line	38; "main.c"	if(bandera == 1){
	MOVF	_main_bandera_65537_4,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00113_DS_
	MOVF	(_main_bandera_65537_4 + 1),W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00113_DS_
;	.line	39; "main.c"	counter = 0;
	CLRF	r0x1010
	CLRF	r0x1011
;	.line	40; "main.c"	bandera = 0;
	CLRF	_main_bandera_65537_4
	CLRF	(_main_bandera_65537_4 + 1)
_00113_DS_:
;	.line	42; "main.c"	while (GP3 == 1){
	CLRF	r0x1012
	BANKSEL	_GPIObits
	BTFSC	_GPIObits,3
	INCF	r0x1012,F
	MOVF	r0x1012,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00117_DS_
;	.line	43; "main.c"	display(num1);
	MOVF	r0x100C,W
	MOVWF	STK00
	MOVF	r0x100D,W
	PAGESEL	_display
	CALL	_display
	PAGESEL	$
;	.line	44; "main.c"	GP5 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
;	.line	45; "main.c"	delay(2);
	MOVLW	0x02
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	46; "main.c"	display(num2);
	MOVF	r0x100E,W
	MOVWF	STK00
	MOVF	r0x100F,W
	PAGESEL	_display
	CALL	_display
	PAGESEL	$
;	.line	47; "main.c"	GP5 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
;	.line	48; "main.c"	delay(2);
	MOVLW	0x02
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
	GOTO	_00113_DS_
_00117_DS_:
;	.line	51; "main.c"	if(counter == 15){
	MOVF	r0x1010,W
	XORLW	0x0f
	BTFSS	STATUS,2
	GOTO	_00119_DS_
	MOVF	r0x1011,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00119_DS_
;	.line	52; "main.c"	display(9);
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_display
	CALL	_display
	PAGESEL	$
;	.line	53; "main.c"	GP5 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
;	.line	54; "main.c"	delay(1);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	55; "main.c"	display(9);
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_display
	CALL	_display
	PAGESEL	$
;	.line	56; "main.c"	GP5 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
;	.line	57; "main.c"	delay(1);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	58; "main.c"	bandera = 1;
	MOVLW	0x01
	MOVWF	_main_bandera_65537_4
	CLRF	(_main_bandera_65537_4 + 1)
	GOTO	_00122_DS_
_00119_DS_:
;	.line	61; "main.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	62; "main.c"	GP1 = 1;    
	BSF	_GPIObits,1
;	.line	63; "main.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	64; "main.c"	GP4 = 1;
	BSF	_GPIObits,4
;	.line	65; "main.c"	delay(1);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	66; "main.c"	GP5 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
;	.line	67; "main.c"	delay(1);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	68; "main.c"	GP5 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
;	.line	69; "main.c"	delay(1);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
	GOTO	_00122_DS_
;	.line	73; "main.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;9 compiler assigned registers:
;   r0x1002
;   STK00
;   r0x1003
;   r0x1004
;   r0x1005
;   r0x1006
;   r0x1007
;   r0x1008
;   r0x1009
;; Starting pCode block
S_main__delay	code
_delay:
; 2 exit points
;	.line	144; "main.c"	void delay(unsigned int tiempo){
	MOVWF	r0x1002
	MOVF	STK00,W
	MOVWF	r0x1003
;	.line	148; "main.c"	for(i=0;i<tiempo;i++)
	CLRF	r0x1004
	CLRF	r0x1005
_00204_DS_:
	MOVF	r0x1002,W
	SUBWF	r0x1005,W
	BTFSS	STATUS,2
	GOTO	_00225_DS_
	MOVF	r0x1003,W
	SUBWF	r0x1004,W
_00225_DS_:
	BTFSC	STATUS,0
	GOTO	_00206_DS_
;;genSkipc:3307: created from rifx:0x7ffce79c4140
;	.line	149; "main.c"	for(j=0;j<1275;j++);
	MOVLW	0xfb
	MOVWF	r0x1006
	MOVLW	0x04
	MOVWF	r0x1007
_00202_DS_:
	MOVLW	0xff
	ADDWF	r0x1006,W
	MOVWF	r0x1008
	MOVLW	0xff
	MOVWF	r0x1009
	MOVF	r0x1007,W
	BTFSC	STATUS,0
	INCFSZ	r0x1007,W
	ADDWF	r0x1009,F
	MOVF	r0x1008,W
	MOVWF	r0x1006
	MOVF	r0x1009,W
	MOVWF	r0x1007
	MOVF	r0x1009,W
	IORWF	r0x1008,W
	BTFSS	STATUS,2
	GOTO	_00202_DS_
;	.line	148; "main.c"	for(i=0;i<tiempo;i++)
	INCF	r0x1004,F
	BTFSC	STATUS,2
	INCF	r0x1005,F
	GOTO	_00204_DS_
_00206_DS_:
;	.line	150; "main.c"	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;3 compiler assigned registers:
;   r0x100A
;   STK00
;   r0x100B
;; Starting pCode block
S_main__display	code
_display:
; 2 exit points
;	.line	76; "main.c"	void display(int num){
	MOVWF	r0x100A
	MOVF	STK00,W
;	.line	78; "main.c"	if (num == 0){
	MOVWF	r0x100B
	IORWF	r0x100A,W
	BTFSS	STATUS,2
	GOTO	_00192_DS_
;	.line	79; "main.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	80; "main.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	81; "main.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	82; "main.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00194_DS_
_00192_DS_:
;	.line	84; "main.c"	else if (num == 1){
	MOVF	r0x100B,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00189_DS_
	MOVF	r0x100A,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00189_DS_
;	.line	85; "main.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	86; "main.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	87; "main.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	88; "main.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00194_DS_
_00189_DS_:
;	.line	90; "main.c"	else if (num == 2){
	MOVF	r0x100B,W
	XORLW	0x02
	BTFSS	STATUS,2
	GOTO	_00186_DS_
	MOVF	r0x100A,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00186_DS_
;	.line	91; "main.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	92; "main.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	93; "main.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	94; "main.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00194_DS_
_00186_DS_:
;	.line	96; "main.c"	else if (num == 3){
	MOVF	r0x100B,W
	XORLW	0x03
	BTFSS	STATUS,2
	GOTO	_00183_DS_
	MOVF	r0x100A,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00183_DS_
;	.line	97; "main.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	98; "main.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	99; "main.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	100; "main.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00194_DS_
_00183_DS_:
;	.line	102; "main.c"	else if (num == 4){
	MOVF	r0x100B,W
	XORLW	0x04
	BTFSS	STATUS,2
	GOTO	_00180_DS_
	MOVF	r0x100A,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00180_DS_
;	.line	103; "main.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	104; "main.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	105; "main.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	106; "main.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00194_DS_
_00180_DS_:
;	.line	108; "main.c"	else if (num == 5){
	MOVF	r0x100B,W
	XORLW	0x05
	BTFSS	STATUS,2
	GOTO	_00177_DS_
	MOVF	r0x100A,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00177_DS_
;	.line	109; "main.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	110; "main.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	111; "main.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	112; "main.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00194_DS_
_00177_DS_:
;	.line	115; "main.c"	else if (num == 6){
	MOVF	r0x100B,W
	XORLW	0x06
	BTFSS	STATUS,2
	GOTO	_00174_DS_
	MOVF	r0x100A,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00174_DS_
;	.line	116; "main.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	117; "main.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	118; "main.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	119; "main.c"	GP4 = 0;    
	BCF	_GPIObits,4
	GOTO	_00194_DS_
_00174_DS_:
;	.line	121; "main.c"	else if (num == 7){
	MOVF	r0x100B,W
	XORLW	0x07
	BTFSS	STATUS,2
	GOTO	_00171_DS_
	MOVF	r0x100A,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00171_DS_
;	.line	122; "main.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	123; "main.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	124; "main.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	125; "main.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00194_DS_
_00171_DS_:
;	.line	127; "main.c"	else if (num == 8){
	MOVF	r0x100B,W
	XORLW	0x08
	BTFSS	STATUS,2
	GOTO	_00168_DS_
	MOVF	r0x100A,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00168_DS_
;	.line	128; "main.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	129; "main.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	130; "main.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	131; "main.c"	GP4 = 1;
	BSF	_GPIObits,4
	GOTO	_00194_DS_
_00168_DS_:
;	.line	133; "main.c"	else if (num == 9){
	MOVF	r0x100B,W
	XORLW	0x09
	BTFSS	STATUS,2
	GOTO	_00194_DS_
	MOVF	r0x100A,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00194_DS_
;	.line	134; "main.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	135; "main.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	136; "main.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	137; "main.c"	GP4 = 1;
	BSF	_GPIObits,4
_00194_DS_:
;	.line	141; "main.c"	}
	RETURN	
; exit point of _display


;	code size estimation:
;	  307+   44 =   351 instructions (  790 byte)

	end
