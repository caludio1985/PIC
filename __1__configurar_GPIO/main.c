#include "gpio.h"

void main(void) {

	initPins();

    while (1) {
        PORTD |= (1 << LED);   // Encender todos los LEDs
    }
}
