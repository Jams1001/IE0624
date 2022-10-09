
#include <PID_v1.h>
#include <Adafruit_PCD8544.h>

// Definición de pines
int CLK           = 2;
int DIN           = 3;
int DC            = 4;
int CS            = 5;
int RST           = 6;
int BLUE          = 7;
int RED           = 8;
int CALENTADOR    = 9;  
int SWITCH        = 13;
int TERMISTOR     = A0;
int HUMEDAD       = A1;
int POTENCIOMETRO = A2;


// Definición de variables
int Humedad_A, Temperatura_Operacion_A, Temperatura_Termistor_A;
float Humedad, Temperatura_Operacion, Temperatura_Termistor, Temperatura_Calentador;


void setup() { 
   Serial.begin(9600)
   pinMode(CLK, OUTPUT);
   pinMode(DIN, OUTPUT); 
   pinMode(DC, OUTPUT); 
   pinMode(CS, OUTPUT);  
   pinMode(RST, OUTPUT); 
   pinMode(BLUE, OUTPUT); 
   pinMode(RED, OUTPUT);
   pinMode(SWITCH, INPUT);      
   	
} 
void loop() {

Temperatura_Termistor_A = analogRead(TERMISTOR);
Temperatura_Termistor = map(Temperatura_Termistor_A, 0, 1023, 0, 80); 
Serial.println(Temperatura_Termistor);

Humedad_A = analogRead(HUMEDAD);
Humedad = map(Humedad_A, 0, 1023, 0, 100); 
Serial.println(Humedad);

Temperatura_Operacion_A = analogRead(POTENCIOMETRO);
Temperatura_Operacion = map(Temperatura_Operacion_A, 0, 1023, 0, 80); 
Serial.println(Temperatura_Operacion);


Temperatura_Calentador = analogWrite(CALENTADOR, 200);
Serial.println(Temperatura_Calentador);


// LEDs
if (Temperatura_Termistor <= 30){
   digitalWrite(BLUE, HIGH);
}
else {
   digitalWrite(BLUE, LOW);
}
if (Temperatura_Termistor >= 42){
   digitalWrite(RED, HIGH);
}
else {
   digitalWrite(RED, LOW);
}



// Pantalla LCD
digitalWrite(CS, LOW);	
} 

//socat PTY,link=/tmp/ttyS0,raw,echo=0 PTY,link=/tmp/ttyS1,raw,echo=1