int data;

void setup() 
{ 
  Serial.begin(9600); 
  pinMode(LED_BUILTIN, OUTPUT); 
  digitalWrite (LED_BUILTIN, LOW); 
  // Serial.println("Test Serial.");
}
 
void loop() 
{
    data = Serial.read();
  if (data >= 50)
  digitalWrite (LED_BUILTIN, HIGH);

  else if (data < 50)
  digitalWrite (LED_BUILTIN, LOW);

}
