subtitle "Microchip MPLAB XC8 C Compiler v3.00 (Free license) build 20241204225717 Og1 "

pagewidth 120

	opt flic

	processor	16F887
include "/opt/microchip/xc8/v3.00/pic/include/proc/16f887.cgen.inc"
getbyte	macro	val,pos
	(((val) >> (8 * pos)) and 0xff)
endm
byte0	macro	val
	(getbyte(val,0))
endm
byte1	macro	val
	(getbyte(val,1))
endm
byte2	macro	val
	(getbyte(val,2))
endm
byte3	macro	val
	(getbyte(val,3))
endm
byte4	macro	val
	(getbyte(val,4))
endm
byte5	macro	val
	(getbyte(val,5))
endm
byte6	macro	val
	(getbyte(val,6))
endm
byte7	macro	val
	(getbyte(val,7))
endm
getword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffff)
endm
word0	macro	val
	(getword(val,0))
endm
word1	macro	val
	(getword(val,2))
endm
word2	macro	val
	(getword(val,4))
endm
word3	macro	val
	(getword(val,6))
endm
gettword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffff)
endm
tword0	macro	val
	(gettword(val,0))
endm
tword1	macro	val
	(gettword(val,3))
endm
tword2	macro	val
	(gettword(val,6))
endm
getdword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffffff)
endm
dword0	macro	val
	(getdword(val,0))
endm
dword1	macro	val
	(getdword(val,4))
endm
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
# 52 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
INDF equ 00h ;# 
# 59 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
TMR0 equ 01h ;# 
# 66 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
PCL equ 02h ;# 
# 73 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
STATUS equ 03h ;# 
# 159 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
FSR equ 04h ;# 
# 166 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
PORTA equ 05h ;# 
# 228 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
PORTB equ 06h ;# 
# 290 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
PORTC equ 07h ;# 
# 352 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
PORTD equ 08h ;# 
# 414 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
PORTE equ 09h ;# 
# 452 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
PCLATH equ 0Ah ;# 
# 459 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
INTCON equ 0Bh ;# 
# 537 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
PIR1 equ 0Ch ;# 
# 593 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
PIR2 equ 0Dh ;# 
# 650 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
TMR1 equ 0Eh ;# 
# 657 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
TMR1L equ 0Eh ;# 
# 664 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
TMR1H equ 0Fh ;# 
# 671 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
T1CON equ 010h ;# 
# 765 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
TMR2 equ 011h ;# 
# 772 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
T2CON equ 012h ;# 
# 843 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
SSPBUF equ 013h ;# 
# 850 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
SSPCON equ 014h ;# 
# 920 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
CCPR1 equ 015h ;# 
# 927 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
CCPR1L equ 015h ;# 
# 934 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
CCPR1H equ 016h ;# 
# 941 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
CCP1CON equ 017h ;# 
# 1038 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
RCSTA equ 018h ;# 
# 1133 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
TXREG equ 019h ;# 
# 1140 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
RCREG equ 01Ah ;# 
# 1147 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
CCPR2 equ 01Bh ;# 
# 1154 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
CCPR2L equ 01Bh ;# 
# 1161 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
CCPR2H equ 01Ch ;# 
# 1168 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
CCP2CON equ 01Dh ;# 
# 1238 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
ADRESH equ 01Eh ;# 
# 1245 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
ADCON0 equ 01Fh ;# 
# 1346 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
OPTION_REG equ 081h ;# 
# 1416 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
TRISA equ 085h ;# 
# 1478 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
TRISB equ 086h ;# 
# 1540 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
TRISC equ 087h ;# 
# 1602 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
TRISD equ 088h ;# 
# 1664 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
TRISE equ 089h ;# 
# 1702 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
PIE1 equ 08Ch ;# 
# 1758 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
PIE2 equ 08Dh ;# 
# 1815 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
PCON equ 08Eh ;# 
# 1862 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
OSCCON equ 08Fh ;# 
# 1927 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
OSCTUNE equ 090h ;# 
# 1979 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
SSPCON2 equ 091h ;# 
# 2041 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
PR2 equ 092h ;# 
# 2048 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
SSPADD equ 093h ;# 
# 2055 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
SSPMSK equ 093h ;# 
# 2060 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
MSK equ 093h ;# 
# 2177 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
SSPSTAT equ 094h ;# 
# 2346 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
WPUB equ 095h ;# 
# 2416 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
IOCB equ 096h ;# 
# 2486 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
VRCON equ 097h ;# 
# 2556 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
TXSTA equ 098h ;# 
# 2642 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
SPBRG equ 099h ;# 
# 2704 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
SPBRGH equ 09Ah ;# 
# 2774 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
PWM1CON equ 09Bh ;# 
# 2844 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
ECCPAS equ 09Ch ;# 
# 2926 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
PSTRCON equ 09Dh ;# 
# 2970 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
ADRESL equ 09Eh ;# 
# 2977 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
ADCON1 equ 09Fh ;# 
# 3011 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
WDTCON equ 0105h ;# 
# 3064 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
CM1CON0 equ 0107h ;# 
# 3129 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
CM2CON0 equ 0108h ;# 
# 3194 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
CM2CON1 equ 0109h ;# 
# 3245 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
EEDATA equ 010Ch ;# 
# 3250 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
EEDAT equ 010Ch ;# 
# 3257 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
EEADR equ 010Dh ;# 
# 3264 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
EEDATH equ 010Eh ;# 
# 3271 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
EEADRH equ 010Fh ;# 
# 3278 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
SRCON equ 0185h ;# 
# 3335 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
BAUDCTL equ 0187h ;# 
# 3387 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
ANSEL equ 0188h ;# 
# 3449 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
ANSELH equ 0189h ;# 
# 3499 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
EECON1 equ 018Ch ;# 
# 3544 "/opt/microchip/xc8/v3.00/pic/include/proc/pic16f887.h"
EECON2 equ 018Dh ;# 
	debug_source C
	FNCALL	_main,_initPins
	FNROOT	_main
; #config settings
	config pad_punits      = on
	config apply_mask      = off
	config ignore_cmsgs    = off
	config default_configs = off
	config default_idlocs  = off
	config FOSC = "INTRC_NOCLKOUT"
	config WDTE = "OFF"
	config PWRTE = "ON"
	config MCLRE = "OFF"
	config CP = "OFF"
	config CPD = "OFF"
	config BOREN = "OFF"
	config IESO = "OFF"
	config FCMEN = "OFF"
	config LVP = "OFF"
	config BOR4V = "BOR40V"
	config WRT = "OFF"
	file	"main.s"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect cinit,class=CODE,delta=2,merge=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1,noexec
global __pcstackCOMMON
__pcstackCOMMON:
?_initPins:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
??_initPins:	; 1 bytes @ 0x0
??_main:	; 1 bytes @ 0x0
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        0
;!    BSS         0
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14      0       0
;!    BANK0            80      0       0
;!    BANK1            80      0       0
;!    BANK3            96      0       0
;!    BANK2            96      0       0

;!
;!Pointer List with Targets:
;!
;!    None.


;!
;!Critical Paths under _main in COMMON
;!
;!    None.
;!
;!Critical Paths under _main in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 0     0      0       0
;!                           _initPins
;! ---------------------------------------------------------------------------------
;! (1) _initPins                                             0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 1
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _initPins
;!

;!Address spaces:

;!Name               Size   Autos  Total    Usage
;!BITCOMMON           14      0       0      0.0%
;!BITBANK0            80      0       0      0.0%
;!BITBANK1            80      0       0      0.0%
;!BITBANK3            96      0       0      0.0%
;!BITBANK2            96      0       0      0.0%
;!COMMON              14      0       0      0.0%
;!BANK0               80      0       0      0.0%
;!BANK1               80      0       0      0.0%
;!BANK3               96      0       0      0.0%
;!BANK2               96      0       0      0.0%
;!STACK                0      0       0      0.0%
;!DATA                 0      0       0      0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 3 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called: 1
;; This function calls:
;;		_initPins
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"main.c"
	line	3
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"main.c"
	line	3
	
_main:	
;incstack = 0
	callstack 7
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	5
	
l563:	
	fcall	_initPins
	line	7
	
l7:	
	line	8
	
l8:	
	goto	l7
	global	start
	ljmp	start
	callstack 0
	line	9
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_initPins

;; *************** function _initPins *****************
;; Defined at:
;;		line 3 in file "gpio.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	file	"gpio.c"
	line	3
global __ptext1
__ptext1:	;psect for function _initPins
psect	text1
	file	"gpio.c"
	line	3
	
_initPins:	
;incstack = 0
	callstack 7
; Regs used in _initPins: [wreg+status,2+status,0]
	line	4
	
l557:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(3)+(5/8),(5)&7	;volatile
	line	5
	
l559:	
	movlw	low(0FEh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	andwf	(136)^080h,f	;volatile
	line	7
	movlw	low(0DFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(3),f	;volatile
	line	8
	
l561:	
	bsf	(8)+(0/8),(0)&7	;volatile
	line	9
	
l13:	
	return
	callstack 0
GLOBAL	__end_of_initPins
	__end_of_initPins:
	signat	_initPins,89
global	___latbits
___latbits	equ	2
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
