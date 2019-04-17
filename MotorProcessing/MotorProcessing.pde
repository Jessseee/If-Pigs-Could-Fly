import processing.serial.*;
Serial Arduino;

void setup() {
  size(100,100);
  background(255);
  printArray(Serial.list());
  Arduino = new Serial(this, Serial.list()[0], 9600);
}

void draw() {
  if(Arduino.available() > 0) {
    println(Arduino.read());
  }
}

void keyPressed() {
  if (key == 'w') {
    Arduino.write('w');
  }
  if (key == 's') {
    Arduino.write('s');
  }
  if (key == 'a') {
    Arduino.write('a');
  }
  if (key == 'd') {
    Arduino.write('d');
  }
}

void keyReleased() {
  Arduino.write('0');
}
