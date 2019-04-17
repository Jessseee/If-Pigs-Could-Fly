class Cable {
  float x1, y1, z1, x2, y2, z2, initX, initY, initZ;
  int i;
  Cable(float _x1, float _y1, float _z1, float _x2, float _y2, float _z2, int _i) {
    x1=_x1;
    y1=_y1;
    z1=_z1;
    x2=_x2;
    y2=_y2;
    z2=_z2;
    i=_i;
    initX=_x2;
    initY=_y2;
    initZ=_z2;
  }

  void display() {
    line(x1, y1, z1, x2, y2, z2);
  }
  void update() {
    if (i<4) {
      stroke(#FF0000);//red color
    } else {
      stroke(#0000FF);//blue color
    }
    if (left==true) {
      x2-=2.5;
    }
    if (right==true) {
      x2+=2.5;
    }
    if (up==true) {
      y2-=2.5;
    }
    if (down==true) {
      y2+=2.5;
    }
    if (lower==true) {
      z2-=2.5;
    }
    if (higher==true) {
      z2+=2.5;
    }
    if (i<4) {
      redCables+=dist(x1, y1, z1, x2, y2, z2);
    } else {
      blueCables+=dist(x1, y1, z1, x2, y2, z2);
    }
  }
  void reset() {
    if (i<4) {
      redCables-=dist(x1, y1, z1, initX, initY, initZ);
    } else {
      blueCables-=dist(x1, y1, z1, initX, initY, initZ);
    }
  }
}
