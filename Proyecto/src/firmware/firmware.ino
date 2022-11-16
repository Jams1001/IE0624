int data;

void setup() 
{ 
  Serial.begin(9600); 
  pinMode(LED_BUILTIN, OUTPUT); 
  digitalWrite (LED_BUILTIN, LOW); 
  Serial.println("Test Serial.");
}
 
void loop() 
{
    data = Serial.readString().toFloat();
    Serial.print(data);
    Serial.print("\r\n");
  if (data >= 0.5)
  digitalWrite (LED_BUILTIN, HIGH);

  else if (data <= 0.5)
  digitalWrite (LED_BUILTIN, LOW);

}
