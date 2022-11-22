String pos;

void setup() 
{ 
  Serial.begin(9600); 
  pinMode(LED_BUILTIN, OUTPUT); 
  digitalWrite (LED_BUILTIN, LOW); 
  // Serial.println("Test Serial.");
}
 
void loop() 
{
  pos = Serial.readString();
  
  if (pos == "ON"){
    digitalWrite (LED_BUILTIN, HIGH);
    delay(1000);
  }

  else if (pos == "OFF"){
    digitalWrite (LED_BUILTIN, LOW);
    delay(1000);
  }

}
