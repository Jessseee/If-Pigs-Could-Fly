import peasy.*;
import processing.net.*;
import processing.serial.*;
// init serial-port

Serial port;
PeasyCam cam;
Pilaar[] pillar;
Object object;
Cable[] cable;
int pillarHeight=200;
float initObjectX, initObjectY, ObjectX, ObjectY, ObjectZ=0.5*pillarHeight, redCables=0, blueCables=0;
int boxSize=50;
boolean left, right, up, down, higher, lower;
Server s;
Client c;
String input;
int data[];
int PrefixNumber=4;
boolean [] Prefix=new boolean[PrefixNumber];
void setup() {
  port = new Serial(this, Serial.list()[0], 9600);
  cam = new PeasyCam(this, 300, 300, 800, 50);
  size(1000, 1000, P3D);
  initObjectX=0.3*width;
  initObjectY=0.3*height;
  ObjectX=initObjectX;
  ObjectY=initObjectY;
  ObjectZ=0.5*pillarHeight;
  object=new Object(boxSize);
  pillar=new Pilaar[4];
  cable= new Cable[8];
  pillar[0]=new Pilaar(0, 0);
  pillar[1]=new Pilaar(0.6*width, 0.6*height);
  pillar[2]=new Pilaar(0.6*width, 0);
  pillar[3]=new Pilaar(0, 0.6*height);
  //red cables
  cable[0]=new Cable(0, 0, pillarHeight-20, ObjectX-0.5*boxSize, ObjectY, ObjectZ, 0);
  cable[1]=new Cable(0.6*width, 0.6*height, pillarHeight-20, ObjectX+0.5*boxSize, ObjectY, ObjectZ, 1); 
  cable[2]=new Cable(0.6*width, 0, pillarHeight-20, ObjectX+0.5*boxSize, ObjectY, ObjectZ, 2); 
  cable[3]=new Cable(0, 0.6*height, pillarHeight-20, ObjectX-0.5*boxSize, ObjectY, ObjectZ, 3 );
  //blue cables
  cable[4]=new Cable(0, 0, pillarHeight-20, ObjectX, ObjectY-0.5*boxSize, ObjectZ, 4); 
  cable[5]=new Cable(0.6*width, 0.6*height, pillarHeight-20, ObjectX, ObjectY+0.5*boxSize, ObjectZ, 5 ); 
  cable[6]=new Cable(0.6*width, 0, pillarHeight-20, ObjectX, ObjectY-0.5*boxSize, ObjectZ, 6); 
  cable[7]=new Cable(0, 0.6*height, pillarHeight-20, ObjectX, ObjectY+0.5*boxSize, ObjectZ, 7);
  s = new Server(this, 12345); // Start a simple server on a port
  for (int i=0; i<PrefixNumber; i++) {
    Prefix[i]=false;
  }
}

void draw() {
  c = s.available();
  if (c != null) {
    input = c.readString();
    data = int(split(input, ' ')); // Split values into an array
    if (data[0]==0+PrefixNumber && data[1]==1) {
      left=true;
    }
    if (data[0]==0+PrefixNumber && data[1]==0) {
      left=false;
    }
    if (data[0]==1+PrefixNumber && data[1]==1) {
      right=true;
    }
    if (data[0]==1+PrefixNumber && data[1]==0) {
      right=false;
    }
    if (data[0]==2+PrefixNumber && data[1]==1) {
      up=true;
    }
    if (data[0]==2+PrefixNumber && data[1]==0) {
      up=false;
    }
    if (data[0]==3+PrefixNumber && data[1]==1) {
      down=true;
    }
    if (data[0]==3+PrefixNumber && data[1]==0) {
      down=false;
    }
    if (data[0]==4+PrefixNumber && data[1]==1) {
      lower=true;
    }
    if (data[0]==4+PrefixNumber && data[1]==0) {
      lower=false;
    }
    if (data[0]==5+PrefixNumber && data[1]==1) {
      higher=true;
    }
    if (data[0]==5+PrefixNumber && data[1]==0) {
      higher=false;
    }
    for (int i=0; i<PrefixNumber; i++) {
      if (data[0]==i && data[1]==0) {
        Prefix[i]=false;
      } else if (data[0]==i && data[1]==1) {
        Prefix[i]=true;
      }
    }
  }
  background(0);
  pushMatrix();
  translate(0.3*width, 0.3*height, 0);
  fill(100);
  box(0.8*width, 0.8*height, 5);
  popMatrix();
  for (int i=0; i<4; i++) {
    pillar[i].display();
  }
  redCables=0;
  blueCables=0;
  for (int i=0; i<8; i++) {
    cable[i].reset();
  }
  for (int i=0; i<8; i++) {
    cable[i].update();
    cable[i].display();
  }
  stroke(0);
  object.update();
  object.display();
  fill(0);
  textAlign(CENTER);
  fill(#FF0000);
  text(redCables, 0, -10, 0.5*boxSize+1);
  fill(#0000FF);
  text(blueCables, 0, 10, 0.5*boxSize+1);
  if (left) {
    port.write('a');
  } else if (right) { 
    port.write('d');
  } else if (up) {
    port.write('w');
  } else if (down) {
    port.write('s');
  } else {
    port.write('0');
  }
}

void keyPressed() {
  if (key==CODED) {
    if (keyCode==LEFT) {
      left=true;
    }
    if (keyCode==UP) {
      up=true;
    }
    if (keyCode==DOWN) {
      down=true;
    }
    if (keyCode==RIGHT) {
      right=true;
    }
  }
  if (key=='w') {
    higher=true;
  }
  if (key=='s') {
    lower=true;
  }
}
void keyReleased() {
  if (key==CODED) {
    if (keyCode==LEFT) {
      left=false;
    } 
    if (keyCode==UP) {
      up=false;
    }
    if (keyCode==DOWN ) {
      down=false;
    }
    if (keyCode==RIGHT) {
      right=false;
    }
  }
  if (key=='w') {
    higher=false;
  }
  if (key=='s') {
    lower=false;
  }
}
