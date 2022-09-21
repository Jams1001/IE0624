#include<avr/io.h>
#include <avr/interrupt.h>
#include<util/delay.h>

// struct que define los miembros que componen cada estado de la máquina
typedef struct Semaforo{
  void (*state_func_ptr)(void); // Puntero a las funciones de salida de cada estado
  int time; // Tiempo de duración de cada estado
} FSM;

// Salidas en cada estado

void A_out(void){
  PORTB = 0x09;
}

void B_out(void){
  PORTB ^= 0x01;
}

void C_out(void){
  PORTB = 0x0A;
}

void D_out(void){
  PORTB = 0x06;
}

void E_out(void){
  PORTB ^= 0x04;
}

// Definición de los estados

#define A 0 // Paso de vehículos por al menos 10 segundos
#define B 1 // Parpadeo de luces de semáforo vehicular
#define C 2 // Paro total de vehículos y peatones
#define D 3 // Paso de peatones por 10 segundos
#define E 4 // Parpadeo de luces de semáforos peatonales

// Se define la máquina conformada por 5 estados
FSM semaforo[5] = {
  {&A_out, 10},
  {&B_out, 3},
  {&C_out, 1},
  {&D_out, 10},
  {&E_out, 3},
};

// Configuración del timer
void timer_setup() {
  TCCR0A=0x00; // Modo normal
  TCCR0B=0x00; 
  TCCR0B |= (1<<CS00)|(1<<CS02); // Prescaling de 1024
  sei(); // Se llama a la función sei() para habilitar las interrupciones globales
  TCNT0=0;
  TIMSK|=(1<<TOIE0); // Se habilita la interrupción del timer1
}

int B1_B2; // Estado de los pulsadores
unsigned char state; // Estado la máquina
int int_count; // Contador de timer
int TVP; // Contador de 10 segundos
int TI; // Contador de 1 segundo
int pass_flag; // Indicador de paso (vehículos o peatones)

ISR (INT1_vect) {     
  B1_B2 = 1;
}

// Interrupt vector para Timer0
ISR (TIMER0_OVF_vect){
  if((int_count) == 1 || (int_count == 15)){ // Cuenta de medio segundo
    if(state == B){
      (semaforo[B].state_func_ptr)(); // Llamado a salidas de estado B
    }
    if(state == E){
      (semaforo[E].state_func_ptr)(); // Llamado a salidas de estado B
    }
  }
  else if(int_count == 30){ // cuenta de un segundo
    ++TI;
    int_count = 0;
  }
  if(TI == 10){
    ++TVP;
  }
  ++int_count;
}

int main(void){
  DDRB = 0x0F; // Configurando los pines de entrada/salida del puerto B
  GIMSK = 0x80; // Habilitando la interrupción externa en INT1  
  MCUCR = 0x08; // Interrupción generada por el flanco decreciente en INT1
  PORTB = 0x00; // Se setean todas las salidas en estado bajo (y se activan las resistencias de pull-up de todas las entradas)
  timer_setup(); // Llamado a configuración del timer

  // Inicialización de las variables
  state = A;
  B1_B2 = 0;
  TVP = 0;
  TI = 0;
  int_count = 0;
  pass_flag = 0;

  // Ejecución en un bucle infinito de la máquina de estados
  while(1){
    switch (state){
      case A:
        (semaforo[A].state_func_ptr)();
        if ((B1_B2 == 1)&&(TVP >= semaforo[A].time)){
          state = B;
          int_count = 0;
          TVP = 0;
          TI = 0;
        }
        else {
          state = A;
        }
        break;
      case B:
        if(TI == semaforo[B].time){
          state = C;
          int_count = 0;
          TVP = 0;
          TI = 0;
          pass_flag = 0;
        }
        else{
          state = B;
        }
        break;
      case C:
        (semaforo[C].state_func_ptr)();
        if(TI == semaforo[C].time){
          int_count = 0;
          TVP = 0;
          TI = 0;
          if(pass_flag == 0){
            state = D;
          }
          else if(pass_flag == 1){
            state = A;
          }
        }
        else{
          state = C;
        }
        break;
      case D:
        (semaforo[D].state_func_ptr)();
        if (TVP >= semaforo[D].time){
          state = E;
          int_count = 0;
          TVP = 0;
          TI = 0;
        }
        else {
          state = D;
        }
        break;
      case E:
        if(TI == semaforo[E].time){
          state = C;
          int_count = 0;
          TVP = 0;
          TI = 0;
          B1_B2 = 0;
          pass_flag = 1;
        }
        else{
          state = E;
        }
        break;
    }
  }
}