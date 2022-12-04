#include <TimeLib.h>

void setup()  {
  Serial.begin(9600);
  //setTime(1670178144);
  setTime(Serial.readString());
}

void loop(){    
  digitalClockDisplay();  
  delay(1000);
}

void digitalClockDisplay(){
  Serial.print(hour());
  printDigits(minute());
  printDigits(second());
  Serial.print(" ");
  Serial.print(day());
  Serial.print(" ");
  Serial.print(month());
  Serial.print(" ");
  Serial.print(year()); 
  Serial.println(); 
}

void printDigits(int digits){
  // utility function for digital clock display: prints preceding colon and leading 0
  Serial.print(":");
  if(digits < 10)
    Serial.print('0');
  Serial.print(digits);
}


  
