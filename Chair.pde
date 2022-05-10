
class Chair extends Item {

  Chair(float _x, float _y, float _w, float _h, PImage _image) {
    super(_x, _y, _w, _h, _image);
    itemName = "Chair";
  }
  Chair(float _x, float _y) {
    super(_x, _y, 50, 90, chair);
    itemName = "Chair";
  }

  void display() {
    push();
    translate(x, y-h/2);
    super.display();
    pop();
  }

  void interact() {
  }
  void shatter() {
  }
}
