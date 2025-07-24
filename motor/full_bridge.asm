 LISTP=16F887
#INCLUDE<P16F887.INC>
		
;*******************************
;	Oscilador interno
;*******************************
__CONFIG    _CONFIG1, _LVP_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_OFF & _WDT_OFF & _INTRC_OSC_NOCLKOUT
__CONFIG    _CONFIG2, _WRT_OFF & _BOR21V
;*******************************

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
;******************************************************
;********* Configuro pines de entrada *****************
;******************************************************
			BANCO_2
			BSF		TRISB,0
			BSF		TRISB,2
			MOVLW	B'00000001'
			MOVWF	TRISA
			BCF		OPTION_REG,7
;*****************************************************
;******** Configuro TIMER-2 **************************
;*****************************************************
NUEVO		BANCO_2
			MOVLW	D'255'
			MOVWF	PR2
			BANCO_1
			CLRF	CCPR1L
			MOVLW	B'00001100'
			MOVWF	CCP1CON
			BCF		PIR1,1
			BSF		T2CON,2
TIME		BTFSS	PIR1,1
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
			MOVLW	B'00000000' ;JUSTIF. A LA IZQ.
			MOVWF	ADCON1
			BANCO_1
			MOVLW	B'11000001'	; CANAL-1
			MOVWF	ADCON0
LOOP		BSF		ADCON0,GO	
			CALL	DELAY
STOP		BTFSC	ADCON0,GO
			GOTO	STOP
;****************************************************
;******** CARGAR 10-BITS DE ADC A PWM ***************
;****************************************************
			BANCO_1
			MOVF	ADRESH,W	
			MOVWF	CCPR1L		
;****************************************************
;******** Sentido de giro ***************************
;****************************************************
			BANCO_1
			BTFSC	PORTB,2
			GOTO	NUEVO
			BTFSC	PORTB,0
			GOTO	IZQ
			GOTO	DERECH	
IZQ			MOVLW	B'01001100'
			MOVWF	CCP1CON
			GOTO	LOOP
DERECH		MOVLW	B'11001100'
			MOVWF	CCP1CON
			GOTO 	LOOP

;-----------------------------------
;DELAY 20US
;-----------------------------------
DELAY 		MOVLW	.8
			MOVWF	PDel0
PLoop0		CLRWDT
			DECFSZ	PDel0,1
			GOTO	PLoop0
PDelL1		GOTO	PDelL2
PDelL2		CLRWDT	
			RETURN
;-----------------------------------
			END
;-----------------------------------		
