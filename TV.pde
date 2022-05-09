class Tv extends Item {
  
  
  Tv(float _x, float _y, float _w, float _h, PImage _image) {
    super(_x, _y, _w, _h, _image);
    itemName = "Tv";
  }
  Tv(float _x, float _y) {
    super(_x, _y, 100, 100, tv);
    itemName = "Tv";
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
