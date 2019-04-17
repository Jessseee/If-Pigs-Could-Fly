import processing.net.*;
Client c;
String input;
int data[];
Button left, up, down, right, lower, higher;
PImage Lefty, Righty, Uppy, Downy, Lowery, Highery;
boolean pressed=false;
void setup() 
{
  Lefty=loadImage("Lefty.png");
  Righty=loadImage("Righty.png");
  Uppy=loadImage("Uppy.png");
  Downy=loadImage("Downy.png");
  Lowery=loadImage("Lowery.png");
  Highery=loadImage("Highery.png");
  fullScreen();
  left=new Button(0.1875*width, width/2, Lefty, 0);
  right=new Button(width-0.1875*width, width/2, Righty, 1);
  up=new Button(0.5*width, 0.1875*width, Uppy, 2);
  down=new Button(0.5*width, width-0.1875*width, Downy, 3);
  lower=new Button(0.1875*width, 0.1875*width, Lowery, 4);
  higher=new Button(width-0.1875*width, width-0.1875*width, Highery, 5);
  // Connect to the server's IP address and port
  c = new Client(this, "130.89.182.173", 12345); // Replace with your server's IP and port
}

void draw() 
{
  left.run();
  right.run();
  up.run();
  down.run();
  lower.run();
  higher.run();
}
void mousePressed() {
  pressed=true;
}
void mouseReleased() {
  pressed=false;
}
