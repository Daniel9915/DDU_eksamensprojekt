class Tv extends Item {
  boolean on = false;

  Tv(float _x, float _y, float _w, float _h, PImage _image) {
    super(_x, _y, _w, _h, _image);
    itemName = "Tv";
  }
  Tv(float _x, float _y) {
    super(_x, _y, 100, 100, tv);
    itemName = "Tv";
  }

  void display() {

    if (on) {
      if (frameCount%20 == 0) {
        activeImage = tv_broken1;
      } else if (frameCount%20 == 10) {
        activeImage = tv_broken2;
      }
    }

    push();
    translate(x, y-h/2);
    super.display();
    pop();
  }
  void interact() {
    if (!on) {
      on = true;
      for (Human h : game.humanList) { // jo tættere et menneske er på en genstand, jo mere bliver han skræmt. Hvis afstanden er mere end 400px så sker der ikke noget.
        if ((abs(x-h.x)/4)<50 && abs(y-h.y) <100) {
          h.scaredCounter += 50-(abs(x-h.x)/4);
        }
      }
    }
  }
  
  void shatter(){
  }
}
