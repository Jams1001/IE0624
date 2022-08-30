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
r0x100A	res	1
r0x100B	res	1
r0x100C	res	1
r0x100D	res	1
r0x100E	res	1
r0x100F	res	1
r0x1010	res	1
r0x1009	res	1
r0x1008	res	1
r0x1001	res	1
r0x1000	res	1
r0x1002	res	1
r0x1003	res	1
r0x1004	res	1
r0x1005	res	1
r0x1006	res	1
r0x1007	res	1
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
;   _delay
;   _delay
;   _delay
;   _display
;   _delay
;   _display
;   _delay
;   _delay
;   _delay
;   _delay
;8 compiler assigned registers:
;   r0x100A
;   r0x100B
;   r0x100C
;   r0x100D
;   r0x100E
;   r0x100F
;   r0x1010
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
	MOVWF	r0x100A
	CLRF	r0x100B
;	.line	17; "main.c"	int num2 = 1;
	MOVLW	0x01
	MOVWF	r0x100C
	CLRF	r0x100D
;	.line	19; "main.c"	while(1){
	CLRF	r0x100E
	CLRF	r0x100F
_00117_DS_:
;	.line	21; "main.c"	num1 = num1 + 1;
	INCF	r0x100A,F
	BTFSC	STATUS,2
	INCF	r0x100B,F
;	.line	22; "main.c"	num2 = num2 + 1;
	INCF	r0x100C,F
	BTFSC	STATUS,2
	INCF	r0x100D,F
;;signed compare: left < lit(0xA=10), size=2, mask=ffff
;	.line	23; "main.c"	if (num1 >= 10){
	MOVF	r0x100B,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00150_DS_
	MOVLW	0x0a
	SUBWF	r0x100A,W
_00150_DS_:
	BTFSS	STATUS,0
	GOTO	_00106_DS_
;;genSkipc:3307: created from rifx:0x7ffd10c64230
;	.line	24; "main.c"	num1 = 0;
	CLRF	r0x100A
	CLRF	r0x100B
;;signed compare: left < lit(0xA=10), size=2, mask=ffff
_00106_DS_:
;	.line	26; "main.c"	if (num2 >= 10){
	MOVF	r0x100D,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00151_DS_
	MOVLW	0x0a
	SUBWF	r0x100C,W
_00151_DS_:
	BTFSS	STATUS,0
	GOTO	_00108_DS_
;;genSkipc:3307: created from rifx:0x7ffd10c64230
;	.line	27; "main.c"	num2 = 0;
	CLRF	r0x100C
	CLRF	r0x100D
_00108_DS_:
;	.line	30; "main.c"	if(GP3 == 1){
	CLRF	r0x1010
	BANKSEL	_GPIObits
	BTFSC	_GPIObits,3
	INCF	r0x1010,F
	MOVF	r0x1010,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00113_DS_
;	.line	31; "main.c"	counter = counter + 1;
	INCF	r0x100E,F
	BTFSC	STATUS,2
	INCF	r0x100F,F
_00109_DS_:
;	.line	32; "main.c"	while (GP3 == 1){
	CLRF	r0x1010
	BANKSEL	_GPIObits
	BTFSC	_GPIObits,3
	INCF	r0x1010,F
	MOVF	r0x1010,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00113_DS_
;	.line	33; "main.c"	display(num1);
	MOVF	r0x100A,W
	MOVWF	STK00
	MOVF	r0x100B,W
	PAGESEL	_display
	CALL	_display
	PAGESEL	$
;	.line	34; "main.c"	GP5 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
;	.line	35; "main.c"	delay(2);
	MOVLW	0x02
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	36; "main.c"	display(num2);
	MOVF	r0x100C,W
	MOVWF	STK00
	MOVF	r0x100D,W
	PAGESEL	_display
	CALL	_display
	PAGESEL	$
;	.line	37; "main.c"	GP5 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
;	.line	38; "main.c"	delay(2);
	MOVLW	0x02
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
	GOTO	_00109_DS_
_00113_DS_:
;	.line	42; "main.c"	if(counter == 16){
	MOVF	r0x100E,W
	XORLW	0x10
	BTFSS	STATUS,2
	GOTO	_00152_DS_
	MOVF	r0x100F,W
;	.line	47; "main.c"	GP0 = 0;
	XORLW	0x00
	BTFSC	STATUS,2
	GOTO	_00119_DS_
_00152_DS_:
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	48; "main.c"	GP1 = 1;    
	BSF	_GPIObits,1
;	.line	49; "main.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	50; "main.c"	GP4 = 1;
	BSF	_GPIObits,4
;	.line	51; "main.c"	delay(1);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	52; "main.c"	GP5 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
;	.line	53; "main.c"	delay(1);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	54; "main.c"	GP5 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
;	.line	55; "main.c"	delay(1);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
	GOTO	_00117_DS_
_00119_DS_:
;	.line	58; "main.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;9 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;   r0x1002
;   r0x1003
;   r0x1004
;   r0x1005
;   r0x1006
;   r0x1007
;; Starting pCode block
S_main__delay	code
_delay:
; 2 exit points
;	.line	129; "main.c"	void delay(unsigned int tiempo){
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
;	.line	133; "main.c"	for(i=0;i<tiempo;i++)
	CLRF	r0x1002
	CLRF	r0x1003
_00196_DS_:
	MOVF	r0x1000,W
	SUBWF	r0x1003,W
	BTFSS	STATUS,2
	GOTO	_00217_DS_
	MOVF	r0x1001,W
	SUBWF	r0x1002,W
_00217_DS_:
	BTFSC	STATUS,0
	GOTO	_00198_DS_
;;genSkipc:3307: created from rifx:0x7ffd10c64230
;	.line	134; "main.c"	for(j=0;j<1275;j++);
	MOVLW	0xfb
	MOVWF	r0x1004
	MOVLW	0x04
	MOVWF	r0x1005
_00194_DS_:
	MOVLW	0xff
	ADDWF	r0x1004,W
	MOVWF	r0x1006
	MOVLW	0xff
	MOVWF	r0x1007
	MOVF	r0x1005,W
	BTFSC	STATUS,0
	INCFSZ	r0x1005,W
	ADDWF	r0x1007,F
	MOVF	r0x1006,W
	MOVWF	r0x1004
	MOVF	r0x1007,W
	MOVWF	r0x1005
	MOVF	r0x1007,W
	IORWF	r0x1006,W
	BTFSS	STATUS,2
	GOTO	_00194_DS_
;	.line	133; "main.c"	for(i=0;i<tiempo;i++)
	INCF	r0x1002,F
	BTFSC	STATUS,2
	INCF	r0x1003,F
	GOTO	_00196_DS_
_00198_DS_:
;	.line	135; "main.c"	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;3 compiler assigned registers:
;   r0x1008
;   STK00
;   r0x1009
;; Starting pCode block
S_main__display	code
_display:
; 2 exit points
;	.line	61; "main.c"	void display(int num){
	MOVWF	r0x1008
	MOVF	STK00,W
;	.line	63; "main.c"	if (num == 0){
	MOVWF	r0x1009
	IORWF	r0x1008,W
	BTFSS	STATUS,2
	GOTO	_00184_DS_
;	.line	64; "main.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	65; "main.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	66; "main.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	67; "main.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00186_DS_
_00184_DS_:
;	.line	69; "main.c"	else if (num == 1){
	MOVF	r0x1009,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00181_DS_
	MOVF	r0x1008,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00181_DS_
;	.line	70; "main.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	71; "main.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	72; "main.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	73; "main.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00186_DS_
_00181_DS_:
;	.line	75; "main.c"	else if (num == 2){
	MOVF	r0x1009,W
	XORLW	0x02
	BTFSS	STATUS,2
	GOTO	_00178_DS_
	MOVF	r0x1008,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00178_DS_
;	.line	76; "main.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	77; "main.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	78; "main.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	79; "main.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00186_DS_
_00178_DS_:
;	.line	81; "main.c"	else if (num == 3){
	MOVF	r0x1009,W
	XORLW	0x03
	BTFSS	STATUS,2
	GOTO	_00175_DS_
	MOVF	r0x1008,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00175_DS_
;	.line	82; "main.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	83; "main.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	84; "main.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	85; "main.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00186_DS_
_00175_DS_:
;	.line	87; "main.c"	else if (num == 4){
	MOVF	r0x1009,W
	XORLW	0x04
	BTFSS	STATUS,2
	GOTO	_00172_DS_
	MOVF	r0x1008,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00172_DS_
;	.line	88; "main.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	89; "main.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	90; "main.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	91; "main.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00186_DS_
_00172_DS_:
;	.line	93; "main.c"	else if (num == 5){
	MOVF	r0x1009,W
	XORLW	0x05
	BTFSS	STATUS,2
	GOTO	_00169_DS_
	MOVF	r0x1008,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00169_DS_
;	.line	94; "main.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	95; "main.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	96; "main.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	97; "main.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00186_DS_
_00169_DS_:
;	.line	100; "main.c"	else if (num == 6){
	MOVF	r0x1009,W
	XORLW	0x06
	BTFSS	STATUS,2
	GOTO	_00166_DS_
	MOVF	r0x1008,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00166_DS_
;	.line	101; "main.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	102; "main.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	103; "main.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	104; "main.c"	GP4 = 0;    
	BCF	_GPIObits,4
	GOTO	_00186_DS_
_00166_DS_:
;	.line	106; "main.c"	else if (num == 7){
	MOVF	r0x1009,W
	XORLW	0x07
	BTFSS	STATUS,2
	GOTO	_00163_DS_
	MOVF	r0x1008,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00163_DS_
;	.line	107; "main.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	108; "main.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	109; "main.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	110; "main.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00186_DS_
_00163_DS_:
;	.line	112; "main.c"	else if (num == 8){
	MOVF	r0x1009,W
	XORLW	0x08
	BTFSS	STATUS,2
	GOTO	_00160_DS_
	MOVF	r0x1008,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00160_DS_
;	.line	113; "main.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	114; "main.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	115; "main.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	116; "main.c"	GP4 = 1;
	BSF	_GPIObits,4
	GOTO	_00186_DS_
_00160_DS_:
;	.line	118; "main.c"	else if (num == 9){
	MOVF	r0x1009,W
	XORLW	0x09
	BTFSS	STATUS,2
	GOTO	_00186_DS_
	MOVF	r0x1008,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00186_DS_
;	.line	119; "main.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	120; "main.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	121; "main.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	122; "main.c"	GP4 = 1;
	BSF	_GPIObits,4
_00186_DS_:
;	.line	126; "main.c"	}
	RETURN	
; exit point of _display


;	code size estimation:
;	  273+   34 =   307 instructions (  682 byte)

	end
