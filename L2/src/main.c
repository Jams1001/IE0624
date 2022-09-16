#include<avr/io.h>
#include <avr/interrupt.h>

void external_interrupt() {
  DDRB |= (1<<PB3)|(1<<PB2)|(1<<PB1)|(1<<PB0);   
  sei();   
  GIMSK |= (1 << INT0);   
  MCUCR |= (1 << ISC01);  
}

#define A 0
#define B 1
#define C 2
#define D 3
#define E 4
#define F 5
#define G 6
#define H 7

void fsm();

int B1;
int current_state, nxt_state;


ISR (INT0_vect) {    
  //PORTB ^= (1 << P);   
  B1 = 1;
}

/*
ISR(TIMER0_OVF_vect){
}
*/


int main() {
  external_interrupt();

  current_state = A;  // estado inicial es el paso de vehículos
  nxt_state = A;
  B1 = 0;

  while(1) {
    current_state = nxt_state;
    fsm();
  }
  return 0;
}

void fsm(){
  switch (current_state){
    case A:
      PORTB ^= (1 << PB3)|(1 << PB0);  
      //PORTB = 0x0A;  
      if(B1 == 1) {
        nxt_state = F;
      }
      else {
        nxt_state = A;
      }
      break;
    case B:
      break;
    case C:
      break;
    case D:
      break;
    case E:
      break;
    case F:
      PORTB ^= (1 << PB2)|(1 << PB1);
      break;
    case G:
      break;
    case H:
      break;
  }

}