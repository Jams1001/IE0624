#include <PID_v1.h>
#include <SPI.h>
#include <Adafruit_PCD8544.h>
#include <Adafruit_GFX.h>
#include <math.h>

// Definición de pines
int CLK           = 2;
int DIN           = 3;
int DC            = 4;
int CS            = 5;
int RST           = 6;
int BLUE          = 7;
int RED           = 8;
int CALENTADOR    = 9;  
int SWITCH        = 12;
int TERMISTOR     = A0;
int HUMEDAD       = A1;
int POTENCIOMETRO = A2;
int Kp = 2;
int Ki = 5;
int Kd = 1;

// Definicion de constantes
int Resistencia = 10000;
float A = 1.11492089e-3;
float B = 2.372075385e-4;
float C = 6.954079529e-8;

// Definición de variables
int Temperatura_Operacion_A, Humedad_A;
double temp_ac, setPoint, ctrl_sgn, output_sgn;
float V_term, R_term, T_term, Humedad, logR;

float K = 2.5; //factor de disipacion en mW/C

// Controlador PID
PID pid(&temp_ac, &ctrl_sgn, &setPoint, Kp, Ki, Kd, DIRECT);

// Objeto PCD para conectar y escribir datos al display LCD
Adafruit_PCD8544 display = Adafruit_PCD8544(CLK,DIN,DC,CS,RST);

void setup() { 
   Serial.begin(9600);
   pinMode(CLK, OUTPUT);
   pinMode(DIN, OUTPUT); 
   pinMode(DC, OUTPUT); 
   pinMode(CS, OUTPUT);  
   pinMode(RST, OUTPUT); 
   pinMode(BLUE, OUTPUT); 
   pinMode(RED, OUTPUT);
   pinMode(SWITCH, INPUT);

   Temperatura_Operacion_A = analogRead(POTENCIOMETRO);
   setPoint = map(Temperatura_Operacion_A, 0, 1023, 0, 80);
   
   output_sgn = 0;
   
   V_term = analogRead(TERMISTOR)*5/1023;
   R_term = V_term*Resistencia/(5-V_term);
   logR = log(R_term);
   T_term = 1.0 /(A+B*logR+C*logR*logR*logR);
   temp_ac = (T_term - V_term*V_term/(K * R_term)*1000) - 273.15;
   
   Humedad = 0;

   pid.SetMode(AUTOMATIC);

   display.begin();
} 
void loop() {

  Temperatura_Operacion_A = analogRead(POTENCIOMETRO);
  setPoint = map(Temperatura_Operacion_A, 0, 1023, 0, 80);
  delay(500);
  
  Humedad_A = analogRead(HUMEDAD);
  Humedad = map(Humedad_A, 0, 1023, 0, 100);
  delay(500);

  V_term = analogRead(TERMISTOR);
  V_term = analogRead(TERMISTOR)*5/1023;
  R_term = V_term*Resistencia/(5-V_term);
  logR = log(R_term);
  T_term = 1.0 /(A+B*logR+C*logR*logR*logR);
  temp_ac = (T_term - V_term*V_term/(K * R_term)*1000) - 273.15;
  delay(500);

  pid.Compute();

  if(ctrl_sgn > 100){
    ctrl_sgn = 100;
  }
  else if(ctrl_sgn < 0){
    ctrl_sgn = 0;
  }
  
  output_sgn = ctrl_sgn*255/100;
  analogWrite(CALENTADOR, output_sgn);
  delay(500);
  
  display.clearDisplay();
  display.setCursor(0,0);
  // Imprime temperatura de operacion en el display
  display.print("Temp op: "); 
  display.println(setPoint);
  
  // Imprime salida del controlador en el display
  display.print("Ctrl sgn: "); 
  display.println(ctrl_sgn);
  
  // Imprime temperatura actual en el display
  display.print("Temp ac: ");
  display.println(temp_ac);
  
  // Imprime humedad actual en el display
  display.print("Humd: ");
  display.println(Humedad);
  
  display.display();
  
  // LEDs
  if (temp_ac <= 30){
     digitalWrite(BLUE, HIGH);
  }
  else {
     digitalWrite(BLUE, LOW);
  }
  if (temp_ac >= 42){
     digitalWrite(RED, HIGH);
  }
  else {
     digitalWrite(RED, LOW);
  }

  // Habilitador de la comunicación con la PC
 if(digitalRead(SWITCH) == HIGH){  
    Serial.print(temp_ac);
    Serial.print(",");
    Serial.print(Humedad);
    Serial.print(",");
    Serial.print(setPoint);
    Serial.print(",");
    Serial.println(ctrl_sgn);
   }
   else {
    Serial.print("NULL");
    Serial.print(",");
    Serial.print("NULL");
    Serial.print(",");
    Serial.print("NULL");
    Serial.print(",");
    Serial.println("NULL");
   }
} 

//socat PTY,link=/tmp/ttyS0,raw,echo=0 PTY,link=/tmp/ttyS1,raw,echo=1
