class Button {
  float x, y;
  PImage arrow;
  color rectColor=#FFFFFF;
  int i, time=0;
  boolean rectPressed=false;
  Button(float _x, float _y, PImage _arrow, int _i) {
    x=_x;
    y=_y;
    arrow=_arrow;
    i=_i;
  }
  //first at 3/16 second at 8/16 third at 13/16(x)
  //first at 6/48 second at 16/48 third at 26/48(y)
  void display() {
    fill(rectColor);
    rectMode(CENTER);
    rect(x, y, 0.25*width, 0.25*width);
    imageMode(CENTER);
    image(arrow, x, y, 0.2*width, 0.2*width);
  }
  void update() {
    if (mouseX<(x+0.125*width) && mouseX>x-0.125*width && mouseY<y+0.125*width && mouseY>y-0.125*width && pressed==true) {
      rectPressed=true;
    } else {
      rectPressed=false;
    }
    if (rectPressed==true) {
      rectColor=#ADABAB;
      if (time>5) {
        c.write(i+ " " + "1" + " ");
        time=0;
      }
      time++;
    } else {
      rectColor=#FFFFFF;
      if (time>15) {
        c.write(i+ " " + "0" + " ");
        time=0;
      }
      time++;
    }
  }
  void run() {
    update();
    display();
  }
}
