#include<avr/io.h>

ISR (INT0_vect) {      // Interrupt service routine 

  PORTB ^= (1 << PB1);    // Toggling the PB2 pin 
}

ISR (PCINT0_vect) {       // Interrupt service routine  
  PORTB ^= (1 << PB0);    // Toggling the PB2 pin 
}


void external_interrupt() {
  DDRB |= (1<<PB1)|(1<<PB0);     // set PB2 as output(LED)
  sei();     //enabling global interrupt
  GIMSK |= (1 << INT0);     // enabling the INT0 (external interrupt) 
  MCUCR |= (1 << ISC01);    // Configuring as falling edge 
}

void pin_change_interrupt() {
  DDRB |= (1 << PB0);
  GIMSK |= (1 << PCIE);
  PCMSK |= (1 << PCINT1);
}
int main() {
  external_interrupt();
  pin_change_interrupt();
  while(1) {
    
  }
}