#include <RBDdimmer.h>

#define USE_SERIAL  Serial
#define outputPin  12 // PSM
#define zerocross  2
#define potPin A0

const int potMin = 354;
const int potMax = 829;
int potValue;

dimmerLamp dimmer(outputPin);

int outVal = 0;

void setup() {
  USE_SERIAL.begin(9600);
  dimmer.begin(NORMAL_MODE, ON);
}

void loop() 
{
  potValue =analogRead(potPin);

 correctValue(); 

  outVal = map(potValue, 19, 1023, 100, 0);
  USE_SERIAL.print("potValue:"); 
  USE_SERIAL.print(potValue);
  USE_SERIAL.print(" ");     
  USE_SERIAL.print(outVal);
  USE_SERIAL.println("%");
  dimmer.setPower(outVal);
}

void correctValue()
{
   if(potValue <potMin)
  {
    potValue =potMin;
  }
  if(potValue >potMax)
  {
    potValue =potMax;
  }   
}
