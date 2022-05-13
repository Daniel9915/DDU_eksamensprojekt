
class Painting extends Item{
  boolean on = false;
  
  Painting(float _x, float _y, float _w, float _h, PImage _image) {
    super(_x, _y, _w, _h, _image);
    itemName = "Painting";
  }
  Painting(float _x, float _y) {
    super(_x, _y, 100, 100, painting);
    itemName = "Painting";
    image2 = painting_broken;
  }

  void display() {
    push();
    translate(x, y-h/2);
    super.display();
    pop();
  }
  void interact() {
    if (!on) {
      on = true;
      activeImage = image2;
      for (Human h : game.humanList) { // jo tættere et menneske er på en genstand, jo mere bliver han skræmt. Hvis afstanden er mere end 400px så sker der ikke noget.
        if ((abs(x-h.x)/4)<50 && abs(y-h.y) <100) {
          h.scaredCounter += 50-(abs(x-h.x)/4);
        }
      }
    }
  }
  void pickUp() {
  }
  void shatter() {
  }
}
  

}
