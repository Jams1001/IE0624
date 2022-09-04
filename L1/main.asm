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
	extern	__muluchar
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
	global	_dividirby10
	global	_residuo

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
r0x1011	res	1
r0x1012	res	1
r0x1013	res	1
r0x1014	res	1
r0x1015	res	1
r0x1010	res	1
r0x1009	res	1
r0x1008	res	1
r0x100A	res	1
r0x100B	res	1
r0x100C	res	1
r0x100D	res	1
r0x100E	res	1
r0x100F	res	1
r0x1004	res	1
r0x1005	res	1
r0x1006	res	1
r0x1007	res	1
r0x1001	res	1
r0x1002	res	1
r0x1003	res	1
_main_bandera_65537_6	res	1
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
;   _dividirby10
;   _residuo
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
;   _dividirby10
;   _residuo
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
;7 compiler assigned registers:
;   r0x1011
;   r0x1012
;   r0x1013
;   STK01
;   STK00
;   r0x1014
;   r0x1015
;; Starting pCode block
S_main__main	code
_main:
; 2 exit points
;	.line	13; "main.c"	TRISIO = 0b00001000; 
	MOVLW	0x08
	BANKSEL	_TRISIO
	MOVWF	_TRISIO
;	.line	14; "main.c"	ANSEL  = 0x00;  
	CLRF	_ANSEL
;	.line	15; "main.c"	CMCON  = 0x07; 
	MOVLW	0x07
	BANKSEL	_CMCON
	MOVWF	_CMCON
;	.line	16; "main.c"	VRCON  = 0x00; 
	BANKSEL	_VRCON
	CLRF	_VRCON
;	.line	17; "main.c"	unsigned char num0 = 0; 
	CLRF	r0x1011
;	.line	20; "main.c"	unsigned char counter = 0;
	CLRF	r0x1012
_00122_DS_:
;	.line	26; "main.c"	num0++;
	INCF	r0x1011,F
;;unsigned compare: left < lit(0x64=100), size=1
;	.line	27; "main.c"	if (num0 >= 100){
	MOVLW	0x64
;	.line	28; "main.c"	num0 = 0;
	SUBWF	r0x1011,W
;	.line	31; "main.c"	num1 = dividirby10(num0);
	BTFSC	STATUS,0
	CLRF	r0x1011
	MOVF	r0x1011,W
	PAGESEL	_dividirby10
	CALL	_dividirby10
	PAGESEL	$
;	.line	32; "main.c"	num2 = residuo(num0, 10, num1);
	MOVWF	r0x1013
	MOVWF	STK01
	MOVLW	0x0a
	MOVWF	STK00
	MOVF	r0x1011,W
	PAGESEL	_residuo
	CALL	_residuo
	PAGESEL	$
	MOVWF	r0x1014
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0xA=10), size=1
;	.line	34; "main.c"	if (num0 <= 9){
	MOVLW	0x0a
	SUBWF	r0x1011,W
	BTFSC	STATUS,0
	GOTO	_00108_DS_
;;genSkipc:3307: created from rifx:0x7fff48c0f9c0
;	.line	35; "main.c"	num1 = num0;
	MOVF	r0x1011,W
	MOVWF	r0x1013
;	.line	36; "main.c"	num2 = 0;
	CLRF	r0x1014
_00108_DS_:
;	.line	39; "main.c"	if(GP3 == 1){
	CLRF	r0x1015
	BANKSEL	_GPIObits
	BTFSC	_GPIObits,3
	INCF	r0x1015,F
	MOVF	r0x1015,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00117_DS_
;	.line	41; "main.c"	counter++;
	INCF	r0x1012,F
;	.line	44; "main.c"	if(bandera == 1){
	MOVF	_main_bandera_65537_6,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00113_DS_
;	.line	45; "main.c"	counter = 0;
	CLRF	r0x1012
;	.line	46; "main.c"	bandera = 0;
	CLRF	_main_bandera_65537_6
_00113_DS_:
;	.line	48; "main.c"	while (GP3 == 1){
	CLRF	r0x1015
	BANKSEL	_GPIObits
	BTFSC	_GPIObits,3
	INCF	r0x1015,F
	MOVF	r0x1015,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00117_DS_
;	.line	49; "main.c"	display(num1);
	MOVF	r0x1013,W
	PAGESEL	_display
	CALL	_display
	PAGESEL	$
;	.line	50; "main.c"	GP5 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
;	.line	51; "main.c"	delay(2);
	MOVLW	0x02
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	52; "main.c"	display(num2);
	MOVF	r0x1014,W
	PAGESEL	_display
	CALL	_display
	PAGESEL	$
;	.line	53; "main.c"	GP5 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
;	.line	54; "main.c"	delay(2);
	MOVLW	0x02
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
	GOTO	_00113_DS_
_00117_DS_:
;	.line	57; "main.c"	if(counter == 15){
	MOVF	r0x1012,W
	XORLW	0x0f
	BTFSS	STATUS,2
	GOTO	_00119_DS_
;	.line	58; "main.c"	display(9);
	MOVLW	0x09
	PAGESEL	_display
	CALL	_display
	PAGESEL	$
;	.line	59; "main.c"	GP5 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
;	.line	60; "main.c"	delay(1);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	61; "main.c"	display(9);
	MOVLW	0x09
	PAGESEL	_display
	CALL	_display
	PAGESEL	$
;	.line	62; "main.c"	GP5 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
;	.line	63; "main.c"	delay(1);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	64; "main.c"	bandera = 1;
	MOVLW	0x01
	MOVWF	_main_bandera_65537_6
	GOTO	_00122_DS_
_00119_DS_:
;	.line	67; "main.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	68; "main.c"	GP1 = 1;    
	BSF	_GPIObits,1
;	.line	69; "main.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	70; "main.c"	GP4 = 1;
	BSF	_GPIObits,4
;	.line	71; "main.c"	delay(1);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	72; "main.c"	GP5 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
;	.line	73; "main.c"	delay(1);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	74; "main.c"	GP5 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
;	.line	75; "main.c"	delay(1);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
	GOTO	_00122_DS_
;	.line	79; "main.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __muluchar
;   __muluchar
;5 compiler assigned registers:
;   r0x1001
;   STK00
;   r0x1002
;   STK01
;   r0x1003
;; Starting pCode block
S_main__residuo	code
_residuo:
; 2 exit points
;	.line	168; "main.c"	unsigned char residuo(unsigned char num0, unsigned char divisor, unsigned char num1) {
	MOVWF	r0x1001
	MOVF	STK00,W
	MOVWF	r0x1002
	MOVF	STK01,W
	MOVWF	r0x1003
;	.line	170; "main.c"	r = num0 - num1*divisor;
	MOVF	r0x1002,W
	MOVWF	STK00
	MOVF	r0x1003,W
	PAGESEL	__muluchar
	CALL	__muluchar
	PAGESEL	$
	MOVF	STK00,W
	MOVWF	r0x1002
	SUBWF	r0x1001,F
;	.line	171; "main.c"	return r;
	MOVF	r0x1001,W
;	.line	172; "main.c"	}
	RETURN	
; exit point of _residuo

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;4 compiler assigned registers:
;   r0x1004
;   r0x1005
;   r0x1006
;   r0x1007
;; Starting pCode block
S_main__dividirby10	code
_dividirby10:
; 2 exit points
;	.line	158; "main.c"	unsigned char dividirby10(unsigned char n) {
	MOVWF	r0x1004
;;shiftRight_Left2ResultLit:5474: shCount=1, size=1, sign=0, same=0, offr=0
;	.line	160; "main.c"	q = (n >> 1) + (n >> 2);
	BCF	STATUS,0
	RRF	r0x1004,W
	MOVWF	r0x1005
;;shiftRight_Left2ResultLit:5474: shCount=1, size=1, sign=0, same=0, offr=0
	BCF	STATUS,0
	RRF	r0x1004,W
	MOVWF	r0x1006
;;shiftRight_Left2ResultLit:5474: shCount=1, size=1, sign=0, same=1, offr=0
	BCF	STATUS,0
	RRF	r0x1006,F
	MOVF	r0x1006,W
	ADDWF	r0x1005,F
;	.line	161; "main.c"	q = q + (q >> 4);
	SWAPF	r0x1005,W
	ANDLW	0x0f
	MOVWF	r0x1006
	ADDWF	r0x1005,W
	MOVWF	r0x1006
;;shiftRight_Left2ResultLit:5474: shCount=1, size=1, sign=0, same=0, offr=0
;	.line	164; "main.c"	q = q >> 3;
	BCF	STATUS,0
	RRF	r0x1006,W
	MOVWF	r0x1005
;;shiftRight_Left2ResultLit:5474: shCount=1, size=1, sign=0, same=1, offr=0
	BCF	STATUS,0
	RRF	r0x1005,F
;;shiftRight_Left2ResultLit:5474: shCount=1, size=1, sign=0, same=1, offr=0
	BCF	STATUS,0
	RRF	r0x1005,F
;	.line	165; "main.c"	r = n - (((q << 2) + q) << 1); return q + (r > 9);
	MOVF	r0x1005,W
	MOVWF	r0x1006
	BCF	STATUS,0
	RLF	r0x1006,W
	MOVWF	r0x1007
	BCF	STATUS,0
	RLF	r0x1007,F
	MOVF	r0x1006,W
	ADDWF	r0x1007,W
	MOVWF	r0x1006
	BCF	STATUS,0
	RLF	r0x1006,W
	MOVWF	r0x1007
	MOVF	r0x1004,W
	MOVWF	r0x1006
	MOVF	r0x1007,W
	SUBWF	r0x1006,W
	MOVWF	r0x1004
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0xA=10), size=1
	MOVLW	0x0a
	SUBWF	r0x1004,W
	CLRF	r0x1006
	RLF	r0x1006,F
	MOVF	r0x1006,W
	ADDWF	r0x1005,W
	MOVWF	r0x1004
;	.line	166; "main.c"	}
	RETURN	
; exit point of _dividirby10

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;9 compiler assigned registers:
;   r0x1008
;   STK00
;   r0x1009
;   r0x100A
;   r0x100B
;   r0x100C
;   r0x100D
;   r0x100E
;   r0x100F
;; Starting pCode block
S_main__delay	code
_delay:
; 2 exit points
;	.line	149; "main.c"	void delay(unsigned int tiempo){
	MOVWF	r0x1008
	MOVF	STK00,W
	MOVWF	r0x1009
;	.line	153; "main.c"	for(i=0; i<tiempo; i++)
	CLRF	r0x100A
	CLRF	r0x100B
_00166_DS_:
	MOVF	r0x1008,W
	SUBWF	r0x100B,W
	BTFSS	STATUS,2
	GOTO	_00187_DS_
	MOVF	r0x1009,W
	SUBWF	r0x100A,W
_00187_DS_:
	BTFSC	STATUS,0
	GOTO	_00168_DS_
;;genSkipc:3307: created from rifx:0x7fff48c0f9c0
;	.line	154; "main.c"	for(j=0; j<1275; j++);
	MOVLW	0xfb
	MOVWF	r0x100C
	MOVLW	0x04
	MOVWF	r0x100D
_00164_DS_:
	MOVLW	0xff
	ADDWF	r0x100C,W
	MOVWF	r0x100E
	MOVLW	0xff
	MOVWF	r0x100F
	MOVF	r0x100D,W
	BTFSC	STATUS,0
	INCFSZ	r0x100D,W
	ADDWF	r0x100F,F
	MOVF	r0x100E,W
	MOVWF	r0x100C
	MOVF	r0x100F,W
	MOVWF	r0x100D
	MOVF	r0x100F,W
	IORWF	r0x100E,W
	BTFSS	STATUS,2
	GOTO	_00164_DS_
;	.line	153; "main.c"	for(i=0; i<tiempo; i++)
	INCF	r0x100A,F
	BTFSC	STATUS,2
	INCF	r0x100B,F
	GOTO	_00166_DS_
_00168_DS_:
;	.line	155; "main.c"	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1010
;; Starting pCode block
S_main__display	code
_display:
; 2 exit points
;	.line	81; "main.c"	void display(unsigned char num){
	MOVWF	r0x1010
;	.line	83; "main.c"	if (num == 0){
	MOVF	r0x1010,W
	BTFSS	STATUS,2
	GOTO	_00154_DS_
;	.line	84; "main.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	85; "main.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	86; "main.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	87; "main.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00156_DS_
_00154_DS_:
;	.line	89; "main.c"	else if (num == 1){
	MOVF	r0x1010,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00151_DS_
;	.line	90; "main.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	91; "main.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	92; "main.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	93; "main.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00156_DS_
_00151_DS_:
;	.line	95; "main.c"	else if (num == 2){
	MOVF	r0x1010,W
	XORLW	0x02
	BTFSS	STATUS,2
	GOTO	_00148_DS_
;	.line	96; "main.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	97; "main.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	98; "main.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	99; "main.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00156_DS_
_00148_DS_:
;	.line	101; "main.c"	else if (num == 3){
	MOVF	r0x1010,W
	XORLW	0x03
	BTFSS	STATUS,2
	GOTO	_00145_DS_
;	.line	102; "main.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	103; "main.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	104; "main.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	105; "main.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00156_DS_
_00145_DS_:
;	.line	107; "main.c"	else if (num == 4){
	MOVF	r0x1010,W
	XORLW	0x04
	BTFSS	STATUS,2
	GOTO	_00142_DS_
;	.line	108; "main.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	109; "main.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	110; "main.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	111; "main.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00156_DS_
_00142_DS_:
;	.line	113; "main.c"	else if (num == 5){
	MOVF	r0x1010,W
	XORLW	0x05
	BTFSS	STATUS,2
	GOTO	_00139_DS_
;	.line	114; "main.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	115; "main.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	116; "main.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	117; "main.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00156_DS_
_00139_DS_:
;	.line	120; "main.c"	else if (num == 6){
	MOVF	r0x1010,W
	XORLW	0x06
	BTFSS	STATUS,2
	GOTO	_00136_DS_
;	.line	121; "main.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	122; "main.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	123; "main.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	124; "main.c"	GP4 = 0;    
	BCF	_GPIObits,4
	GOTO	_00156_DS_
_00136_DS_:
;	.line	126; "main.c"	else if (num == 7){
	MOVF	r0x1010,W
	XORLW	0x07
	BTFSS	STATUS,2
	GOTO	_00133_DS_
;	.line	127; "main.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	128; "main.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	129; "main.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	130; "main.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00156_DS_
_00133_DS_:
;	.line	132; "main.c"	else if (num == 8){
	MOVF	r0x1010,W
	XORLW	0x08
	BTFSS	STATUS,2
	GOTO	_00130_DS_
;	.line	133; "main.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	134; "main.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	135; "main.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	136; "main.c"	GP4 = 1;
	BSF	_GPIObits,4
	GOTO	_00156_DS_
_00130_DS_:
;	.line	138; "main.c"	else if (num == 9){
	MOVF	r0x1010,W
	XORLW	0x09
	BTFSS	STATUS,2
	GOTO	_00156_DS_
;	.line	139; "main.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	140; "main.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	141; "main.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	142; "main.c"	GP4 = 1;
	BSF	_GPIObits,4
_00156_DS_:
;	.line	146; "main.c"	}
	RETURN	
; exit point of _display


;	code size estimation:
;	  298+   50 =   348 instructions (  796 byte)

	end
