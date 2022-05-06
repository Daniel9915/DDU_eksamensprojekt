class Spawn extends Item {
  
  
  Spawn(float _x, float _y, float _w, float _h, PImage _image) {
    super(_x, _y, _w, _h, _image);
    itemName = "Spawn";
  }
  Spawn(float _x, float _y) {
    super(_x, _y, 70, 70, pumpkinImg);
    itemName = "Spawn";
  }

  void display() {
    push();
    translate(x, y-h/2);
    super.display();
    pop();
  }
}
