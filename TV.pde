class Tv extends Item {
  
  String itemName = "Tv";
  Tv(float _x, float _y, float _w, float _h, PImage _image) {
    super(_x, _y, _w, _h, _image);
  }
  Tv(float _x, float _y) {
    super(_x, _y, 50, 50, noImg);
  }

  void display() {
    push();
    translate(x, y-h/2);
    super.display();
    pop();
  }
  void Interact() {
    //activeImage = image2;
  }
}
