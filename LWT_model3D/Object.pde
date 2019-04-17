class Object {
  float boxSize;
  Object(float _boxSize) {
    boxSize=_boxSize;
  }
  void display() {
    fill(255);
    translate(ObjectX, ObjectY, ObjectZ);
    box(boxSize);
  }
  void update() {
    if (left==true) {
      ObjectX-=2.5;
    }
    if (right==true) {
      ObjectX+=2.5;
    }
    if (up==true) {
      ObjectY-=2.5;
    }
    if (down==true) {
      ObjectY+=2.5;
    }
    if (lower==true) {
      ObjectZ-=2.5;
    }
    if (higher==true) {
      ObjectZ+=2.5;
    }
  }
}
