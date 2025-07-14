#include "gpio.h"

void initPins(void) {
		ANSELH &= ~(1 << 4);
    TRISB |= (1 << 0);     // Puerto D como entrada

    TRISD &= ~(1 << 0);     // Puerto D como salida
    PORTD &= ~(1 << 0);     // Puerto D como salida
}

void sensePins(void) {
   // Si se presiona el botón (nivel bajo) 
   // Encender LED 
   if (PORTB & (1 << 0)) PORTD &= ~(1 << 0);
   // Apagar LED
   else PORTD |= (1 << 0);
}
