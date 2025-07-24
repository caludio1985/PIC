LISTP=16F887
#INCLUDE<P16F887.INC>		
;*******************************
__CONFIG    _CONFIG1, _LVP_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_OFF & _WDT_OFF & _INTRC_OSC_NOCLKOUT
__CONFIG    _CONFIG2, _WRT_OFF & _BOR21V
;************************************************
;OSCILADOR EXTERNO 16MHZ
;************************************************
;__CONFIG    _CONFIG1, _LVP_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_OFF & _PWRTE_ON & _WDT_OFF & _HS_OSC
;__CONFIG    _CONFIG2, _WRT_OFF & _BOR21V 
;************************************************

BANCO_1	MACRO
			BCF		STATUS,RP1
			BCF		STATUS,RP0
			ENDM
BANCO_2	MACRO
			BCF		STATUS,RP1
			BSF		STATUS,RP0
			ENDM
BANCO_3 MACRO
			BSF		STATUS,RP1
			BCF		STATUS,RP0
			ENDM
BANCO_4 MACRO
			BSF		STATUS,RP1
			BSF		STATUS,RP0
			ENDM

CBLOCK	0X20
AUX
WREG
PDel0
PDel1
ENDC

ORG		0X00
GOTO	INICIO
ORG		0X05

;******************************************************
;********* Configuro pines analogicos *****************
;******************************************************
INICIO		
			BANCO_4
			MOVLW	B'00000001'
			MOVWF	ANSEL
			MOVLW	B'00000000'
			MOVWF	ANSELH
;******************************************************
;********* OScilador **********************************
;******************************************************
			BANCO_2
			MOVLW	B'01110101'
			MOVWF	OSCCON			
			;BCF		OSCCON,0
;******************************************************
;********* Configuro pines de entrada *****************
;******************************************************
			BANCO_2
			BSF		TRISB,0
			BSF		TRISB,2
			MOVLW	B'00000001'
			MOVWF	TRISA
;*****************************************************
;******** Configuro TIMER-2 **************************
;*****************************************************
			BANCO_2
			MOVLW	D'255'
			MOVWF	PR2
			BANCO_1
			CLRF	CCPR1L
			MOVLW	B'00111100'
			MOVWF	CCP1CON
			BCF		PIR1,1
			BSF		T2CON,2
TIME	BTFSS	PIR1,1
			GOTO	TIME
			BCF		PIR1,1
;****************************************************
;******** ACTIVO SALIDAS PWN ************************
;****************************************************
			BANCO_2
			BCF		TRISD,7
			BCF		TRISD,6
			BCF		TRISD,5
			BCF		TRISC,2
;****************************************************
;******** configuro modulo ADC ****************
;****************************************************
			BANCO_2
			MOVLW	B'00000000' ;JUSTIFICACION A LA IZQUIERDA
			MOVWF	ADCON1
			BANCO_1
			MOVLW	B'11000001'	; CANAL-1
			MOVWF	ADCON0
LOOP	BSF		ADCON0,GO	
			CALL	DELAY
STOP	BTFSC	ADCON0,GO
			GOTO	STOP
;****************************************************
;******** CARGAR 10-BITS DE ADC A PWM ***************
;****************************************************
			BANCO_1
			MOVF	ADRESH,W	
			MOVWF	CCPR1L		
			BANCO_2
			MOVF	ADRESL,W
			ANDLW	0xC0
			RRF		WREG,W
			RRF		WREG,W
			MOVWF	AUX
			BANCO_1
			MOVF	CCP1CON,W
			ANDLW	B'11001111'
			IORWF	AUX,W
			MOVWF	CCP1CON
;****************************************************
;******** Sentido de giro ***************************
;****************************************************
			BANCO_1
			BTFSS	PORTB,2
			GOTO	UNO
			BTFSS	PORTB,0
			GOTO	CUATRO
			GOTO	CINCO	

CINCO	
			BANCO_1
			MOVF	CCP1CON,W
			ANDLW	0x3F
			IORLW	0x40
			MOVWF	CCP1CON
			GOTO	LOOP

CUATRO
			BANCO_1
			MOVF	CCP1CON,W
			ANDLW	0x3F
			IORLW	0xC0
			MOVWF	CCP1CON
			GOTO	LOOP

UNO		
			BANCO_1
			CLRF	CCPR1L
			CLRF	CCP1CON
			GOTO	LOOP

;-----------------------------------
;DELAY 20US
;-----------------------------------
DELAY MOVLW	.8
			MOVWF	PDel0
PLoop0	
			CLRWDT
			DECFSZ	PDel0,1
			GOTO	PLoop0
PDelL1	
			GOTO	PDelL2
PDelL2	
			CLRWDT	
			RETURN
;-----------------------------------
			END
;-------------------------		
