//Item - Overklasse til ting som spøgelset kan interagere med
class Item {
  float x, y, w, h;
  float angle = 0;
  float weight = 1.01;
  PVector acceleration = new PVector(0, 1);
  PVector velocity = new PVector(0, 0);
  PImage image;
  boolean picekedUp = false;

  Item(float _x, float _y, float _w, float _h, PImage _image) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    image = _image;
  }

  void display() {
    image(image, 0, h/2, w, h);
    if (picekedUp) {
      acceleration.y *= weight;
      velocity.add(acceleration);
      y+=velocity.y;
      x+=velocity.x;
    }
    if (picekedUp && mousePressed && (mouseButton == LEFT) && velocity.y < 1.5) {
      pickUp();
    }
  }

  void pickUp() {
    picekedUp = true;
    x = PumpkinGhost.get(0).gLoc.x;
    y = PumpkinGhost.get(0).gLoc.y;
    acceleration.y = 1;
    velocity.y = 0;
  }

  void throwItem() {
    picekedUp = true;
    velocity.set(10, -10);
  }
}
