class Pilaar {
  float xPos, yPos;
  Pilaar(float x, float y) {
    xPos=x;
    yPos=y;
  }

  void display() {
    fill(255);
    pushMatrix();
    translate(xPos, yPos, 0.5*pillarHeight);
    box(20, 20, pillarHeight);
    popMatrix();
  }
}
