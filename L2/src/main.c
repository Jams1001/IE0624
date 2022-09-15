#include<avr/io.h>
#include <avr/interrupt.h>

ISR (INT0_vect) {      // Interrupt service routine 

  PORTB ^= (1 << PB1);    // Toggling
}

void external_interrupt() {
  DDRB |= (1<<PB1)|(1<<PB0);     // set PB2 as output(LED)
  sei();     //enabling global interrupt
  GIMSK |= (1 << INT0);     // enabling the INT0 (external interrupt) 
  MCUCR |= (1 << ISC01);    // Configuring as falling edge 
}


int main() {
  external_interrupt();
  while(1) {
    
  }
}