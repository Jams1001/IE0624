#define LED_PIN 11
#define POTENTIOMETER_PIN A1

String pos, prev_pos;

void setup()
{
  Serial.begin(9600); 
  pinMode(LED_PIN, OUTPUT);
}

void loop()
{
  if(Serial.available()){
    pos = Serial.readString();
    prev_pos = pos;
  }
  else if(!Serial.available()){
    pos = prev_pos;
  }

  if (pos == "0"){
    analogWrite(LED_PIN, 0);
  }

  else if (pos == "10"){
    analogWrite(LED_PIN, 25);
  }

  else if (pos == "20"){
    analogWrite(LED_PIN, 51);
  }

  else if (pos == "30"){
    analogWrite(LED_PIN, 77);
  }

  else if (pos == "40"){
    analogWrite(LED_PIN, 102);
  }

  else if (pos == "50"){
    analogWrite(LED_PIN, 128);
  }

  else if (pos == "60"){
    analogWrite(LED_PIN, 153);
  }

  else if (pos == "70"){
    analogWrite(LED_PIN, 179);
  }

  else if (pos == "80"){
    analogWrite(LED_PIN, 204);
  }
  
  else if (pos == "90"){
    analogWrite(LED_PIN, 230);
  }
}
