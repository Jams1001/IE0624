void setup() { 
   inMode(pin, OUTPUT); 	
} 
void loop() {
   digitalWrite(pin, HIGH);	
   delay(1000); 		
   digitalWrite(pin, LOW); 
   delay(1000);
} 
 