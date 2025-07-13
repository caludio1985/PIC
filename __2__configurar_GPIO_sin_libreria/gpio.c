#include "gpio.h"

void initPins(void) {
		STATUS |= (1 << RP0);		//Banco 1
    TRISD &= ~(1 << RD0);     // Puerto D como salida

		STATUS &= ~(1 << RP0);		//Banco 0
    PORTD |= (1 << RD0);   
}
