#include "gpio.h"

void initPins(void) {
    TRISD &= ~(1 << LED);     // Puerto D como salida
}
