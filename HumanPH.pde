class HumanPlace extends Item {
  String itemName = "Human";

  HumanPlace(float _x, float _y, float _w, float _h, PImage _image) {
    super(_x, _y, _w, _h, _image);
  }
  HumanPlace(float _x, float _y) {
    super(_x, _y, 89, 180, humanImges.get(7));
  }

  void display() {
    push();
    translate(x, y-h/2);
    fill(150,150,150,150);
    noStroke();
    rect(0, h/2, 200, 10, 10);
    super.display();
    pop();
  }
}
