#ifndef GPIO_H
#define GPIO_H

#define _XTAL_FREQ 4000000  // Oscilador interno a 4 MHz

#define TRISD 	(*(volatile unsigned char*)0x88)
#define PORTD 	(*(volatile unsigned char*)0x08)
#define STATUS	(*(volatile unsigned char*)0x03)

#define RP0		5
#define RD0		0


// CONFIG1
#pragma config FOSC = INTRC_NOCLKOUT  // Oscilador interno
#pragma config WDTE = OFF             // Watchdog Timer apagado
#pragma config PWRTE = ON             // Power-up Timer
#pragma config MCLRE = OFF            // MCLR como pin I/O
#pragma config CP = OFF               // Código no protegido
#pragma config CPD = OFF              // Datos no protegidos
#pragma config BOREN = OFF            // Brown-out Reset apagado
#pragma config IESO = OFF             // Oscilador interno apagado en arranque
#pragma config FCMEN = OFF            // Fail-Safe Clock Monitor apagado
#pragma config LVP = OFF              // No usar programación en baja tensión

// CONFIG2
#pragma config BOR4V = BOR40V         // Brown-out Reset a 4.0V
#pragma config WRT = OFF              // Escritura protegida apagada

void initPins(void);

#endif
