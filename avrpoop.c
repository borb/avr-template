/**
 * small template for starting an avr project.
 * uart_init() sets up uart0 and redirects stdio over to it.
 */

#include <stdio.h>

#include "uart.h"

int main(void)
{
    uart_init();

    printf("hello, world.\n");
}
