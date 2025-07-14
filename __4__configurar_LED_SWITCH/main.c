#include "gpio.h"

void main(void) {

	initPins();

    while (1) {
			sensePins();
    }
}
