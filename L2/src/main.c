#include <avr/io.h>
#include <util/delay.h>

int main(void)
{
  DDRB = 0x08; //Configuracion del puerto (el B3 es salida

  //Parpadear
  while (1) {
    PORTB = 0x00; _delay_ms(5000);
    PORTB = 0x08; _delay_ms(5000);
  }
}
