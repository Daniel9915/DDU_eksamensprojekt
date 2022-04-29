class HumanPlace extends Item {

  HumanPlace(float _x, float _y, float _w, float _h, PImage _image) {
    super(_x, _y, _w, _h, _image);
  }
  HumanPlace(float _x, float _y) {
    super(_x, _y, 89, 180, humanImg.get(7));
  }

  void display() {
    push();
    translate(x, y-h/2);
    super.display();
    pop();
  }
}
