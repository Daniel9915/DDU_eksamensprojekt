class Vase extends Item {
  String itemName = "Vase";
  
  Vase(float _x, float _y, float _w, float _h, PImage _image) {
    super(_x, _y, _w, _h, _image);
  }
  Vase(float _x, float _y) {
    super(_x, _y, 30, 50, vase);
    image2 = vase_broken;
  }

  void display() {
    push();
    translate(x, y-h/2);
    super.display();
    pop();
  }
  
  void shatter() {
    super.shatter();
    w*=1.7;
  }
}
