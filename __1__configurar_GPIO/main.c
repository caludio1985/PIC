#include "gpio.h"

void main(void) {

	initPins();

    while (1) {
        PORTD |= (1 << RD0);   // Encender todos los LEDs
    }
}
