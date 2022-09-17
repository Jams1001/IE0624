#include<avr/io.h>
#include <avr/interrupt.h>
#include<util/delay.h>

void external_interrupt() {
  DDRB |= (1<<PB3)|(1<<PB2)|(1<<PB1)|(1<<PB0);   
  sei();   
  GIMSK |= (1 << INT0);   
  MCUCR |= (1 << ISC01);  
}

void timer_setup() {
  //DDRB |= (1<<PB1); // set PB1 as output(LED)
  TCCR0A=0x00;   //Normal mode
  TCCR0B=0x00;
  TCCR0B |= (1<<CS00)|(1<<CS02);   //prescaling with 1024
  //sei(); //enabling global interrupt
  TCNT0=0;
  TIMSK|=(1<<TOIE0); //enabling timer0 interrupt
  //PORTB|=(1<<PB1);
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
int intr_count;
int sec;
int TVP;
int TI;
int flag;
int C3;

ISR (INT0_vect) {     
  B1 = 1;
}

ISR (TIMER0_OVF_vect)      //Interrupt vector for Timer0
{
  if (intr_count == TVP) {
    flag = 1;
  }
  else if (intr_count == TI){
    C3++;
  }
}

int main() {
  external_interrupt();
  timer_setup();

  current_state = A;
  nxt_state = A;
  B1 = 0;
  intr_count = 0;
  sec = 0;
  C3 = 0;
  flag = 0;

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
      TVP = 630;
      if (B1 == 1 && flag == 1) {
        nxt_state = D;
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
      PORTB ^= (1 << PB0);
      TI = 63;
      PORTB ^= (1 << PB0);
      if (C3 == 3) {
        nxt_state = E;
      }
      else{
        nxt_state = D;
      }
      break;
    case E:
      PORTB ^= (1 << PB3)|(1 << PB1);
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