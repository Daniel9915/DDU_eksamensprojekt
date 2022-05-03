
class Grave extends Item {

  Grave(float _x, float _y, float _w, float _h, PImage _image) {
    super(_x, _y, _w, _h, _image);
  }
  Grave(float _x, float _y) {
    super(_x, _y, 70, 70, noImg);
  }

  void display() {
    push();
    translate(x, y-h/2);
    super.display();
    pop();
    
    if(abs(x-PumpkinGhost.get(1).pLoc.x)<w/2 && !gameOver){
      gameWon = true;
      println(gameWon);
    }  
  }
  
  void pickUp() {}
  void interact() {}
  void shatter() {}
}
