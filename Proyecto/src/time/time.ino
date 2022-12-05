#include <TimerOne.h>
#include <LiquidCrystal.h>
#include <Wire.h>

const int rs = 7, en = 8, d4 = 9, d5 = 10, d6 = 11, d7 = 13;
LiquidCrystal lcd(rs, en, d4, d5, d6, d7);

int horas=6;
int minutos=0;
volatile int segundos=0;
volatile boolean actualizar=true;

void setup(){
  Wire.begin();  
  lcd.begin(16,2);

  Timer1.initialize(1000000);
  Timer1.attachInterrupt(manejadoraTimer);
}

void manejadoraTimer(){
    segundos++;
    actualizar=true;
}

void actualizarReloj(){
  minutos += segundos / 60;
  segundos = segundos % 60;

  horas += minutos / 60;
  minutos = minutos % 60;

  horas = horas % 24;
}

void loop(){
  if(actualizar == true){
    actualizarReloj();
    lcd.clear();
    lcd.setCursor(0,0);
    if(horas < 10){
      lcd.print("0");
    }
    lcd.print(horas);
    lcd.print(":");
    if(minutos < 10){
      lcd.print("0");
    }
    lcd.print(minutos);
    lcd.print(":");
    if(segundos < 10){
      lcd.print("0");
    }
    lcd.print(segundos);
    actualizar = false;
  }
  
}
