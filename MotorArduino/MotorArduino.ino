/*************************************************************
Motor Shield 1-Channel DC Motor Demo
by Randy Sarafan

Modified to work with serial input
by Jesse Visser

For more information see:
https://www.instructables.com/id/Arduino-Motor-Shield-Tutorial/

*************************************************************/

#define dirAPin 12
#define brakeAPin 9
#define speedAPin 3
#define dirBPin 13
#define brakeBPin 8
#define speedBPin 11

void setup() {

  Serial.begin(9600);
  
  //Setup NXT Motor Channel A
  pinMode(dirAPin, OUTPUT); //Initiates Motor Channel A pin
  pinMode(brakeAPin, OUTPUT); //Initiates Brake Channel A pin

  //Setup NXT Motor Channel 2
  pinMode(dirBPin, OUTPUT); //Initiates Motor Channel A pin
  pinMode(brakeBPin, OUTPUT); //Initiates Brake Channel A pin
  
}

void loop(){
  if(Serial.available() != 0) {
    int incoming = Serial.read();
    
    if(incoming == 's') {
      //Channel A forward @ full speed
      digitalWrite(dirAPin, HIGH); //Establishes forward direction of Channel A
      digitalWrite(brakeAPin, LOW);   //Disengage the Brake for Channel A
      analogWrite(speedAPin, 255);   //Spins the motor on Channel A at full speed
    }

    if(incoming == 'w') {
      //Channel A backward @ full speed
      digitalWrite(dirAPin, LOW); //Establishes backward direction of Channel A
      digitalWrite(brakeAPin, LOW);   //Disengage the Brake for Channel A
      analogWrite(speedAPin, 255);   //Spins the motor on Channel A at full speed
    }

    if(incoming == 'd') {
      //Channel B forward @ full speed
      digitalWrite(dirBPin, HIGH); //Establishes forward direction of Channel B
      digitalWrite(brakeBPin, LOW);   //Disengage the Brake for Channel B
      analogWrite(speedBPin, 255);   //Spins the motor on Channel B at full speed
    }

    if(incoming == 'a') {
      //Channel B backward @ full speed
      digitalWrite(dirBPin, LOW); //Establishes backward direction of Channel B
      digitalWrite(brakeBPin, LOW);   //Disengage the Brake for Channel B
      analogWrite(speedBPin, 255);   //Spins the motor on Channel B at full speed
    }

    if(incoming == '0') {
      //Engage brakes on both channels
      digitalWrite(brakeAPin, HIGH); //Engage the Brake for Channel A
      digitalWrite(brakeBPin, HIGH); //Engage the brake for channel B
      
    }
  }
}
