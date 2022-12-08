#include <TimerOne.h>
#include <LiquidCrystal.h>
#include <Wire.h>
#include <RBDdimmer.h>

#define outputPin  12 // PSM
#define zerocross  2
#define relayPin 3

String pos = "0";
String prev_pos = "0";
long segundos_t;
long horas;
long minutos;
volatile long segundos;
volatile boolean actualizar = true;

const int rs = 7, en = 8, d4 = 9, d5 = 10, d6 = 11, d7 = 13;
LiquidCrystal lcd(rs, en, d4, d5, d6, d7);

dimmerLamp dimmer(outputPin);

void setup(){
  Serial.begin(9600);
  Wire.begin();

  pinMode(relayPin, OUTPUT);

  lcd.begin(16,2);
  lcd.clear();
  lcd.print("Waiting...");

  while(!Serial.available()){}

  segundos_t = Serial.parseInt();

  horas = segundos_t/3600;
  minutos = segundos_t/60 - horas*60;
  segundos = segundos_t - horas*3600 - minutos*60;
  
  dimmer.begin(NORMAL_MODE, ON);

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
  if(Serial.available()){
    pos = Serial.readString();
    prev_pos = pos;
  }
  else if(!Serial.available()){
    pos = prev_pos;
  }

  if((horas == 7) && (minutos == 0) && (segundos == 0)){
    pos = 40;
    prev_pos = pos;
  }

  if((horas == 8) && (minutos == 30) && (segundos == 0)){
    pos = 80;
    prev_pos = pos;
  }

  if((horas == 20) && (minutos == 45) && (segundos == 0)){
    pos = 45;
    prev_pos = pos;
  }

  if((horas == 22) && (minutos == 15) && (segundos == 0)){
    pos = 20;
    prev_pos = pos;
  }

  if (pos == "0"){
    digitalWrite(relayPin, HIGH);
  }

  else if (pos == "10"){
    digitalWrite(relayPin, LOW);
    dimmer.setPower(20);
  }

  else if (pos == "20"){
    digitalWrite(relayPin, LOW);
    dimmer.setPower(27);
  }

  else if (pos == "30"){
    digitalWrite(relayPin, LOW);
    dimmer.setPower(35);
  }

  else if (pos == "40"){
    digitalWrite(relayPin, LOW);
    dimmer.setPower(37);
  }

  else if (pos == "50"){
    digitalWrite(relayPin, LOW);
    dimmer.setPower(40);
  }

  else if (pos == "60"){
    digitalWrite(relayPin, LOW);
    dimmer.setPower(43);
  }

  else if (pos == "70"){
    digitalWrite(relayPin, LOW);
    dimmer.setPower(50);
  }

  else if (pos == "80"){
    digitalWrite(relayPin, LOW);
    dimmer.setPower(56);
  }
  
  else if (pos == "90"){
    digitalWrite(relayPin, LOW);
    dimmer.setPower(67);
  }
  
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

    if(pos == "0"){
      lcd.setCursor(14,1);
    }
    else{
      lcd.setCursor(13,1);
    }

    lcd.print(pos);

    lcd.setCursor(15,1);
    lcd.print("%");
    
    actualizar = false;
  }
}
