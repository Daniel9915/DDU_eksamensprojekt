//Item - Overklasse til ting som spøgelset kan interagere med
class Item extends Game {
  float x, y, w, h;
  float angle = 0;
  float weight = 1.005;
  int interactDelay = 0;
  PVector acceleration = new PVector(0, 1);
  PVector velocity = new PVector(0, 0);
  PImage activeImage;
  PImage image1;
  PImage image2;
  boolean pickedUp = false, broken = false;
  String itemName = "Undefined";
  boolean isKeyDoor;
  color floor = color(255);

  Item(float _x, float _y, float _w, float _h, PImage _image) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    activeImage = _image;
  }

  void display() {
    image(activeImage, 0, h/2, w, h);
    if (pickedUp) {
      acceleration.y *= weight;
      velocity.add(acceleration);
      y+=velocity.y;
      x+=velocity.x;
    }
    if (pickedUp && mousePressed && (mouseButton == LEFT) && velocity.y < 1.5) {
      pickUp();
    }    
  }
  
  void checkHitbox(){
    for(int i = int(y); i<y+velocity.y; i++){
      if(get(int(x), i) == floor){
        shatter();
        y = i;
      }
    }
  }

  void pickUp() {
    for (Item i : levelItems) {
      if (i.pickedUp && !i.broken && i != this) {
        return;
      }
    }
    if (!broken && GhostPumpkin.get(0).isGhost) {
      pickedUp = true;
      x = GhostPumpkin.get(0).gLoc.x;
      y = GhostPumpkin.get(0).gLoc.y;
      acceleration.y = 1;
      velocity.y = 0;
    }
  }

  void interact() {
    if (interactDelay<frameCount && GhostPumpkin.get(0).isGhost) {
      interactDelay = frameCount+60;
      pickedUp = true;
      velocity.set(10, -10);
    }
  }

  void shatter() {
    if (pickedUp) {
      broken = true;
      acceleration.mult(0);
      velocity.mult(0);

      for (Human h : game.humanList) { // jo tættere et menneske er på en genstand, jo mere bliver han skræmt. Hvis afstanden er mere end 400px så sker der ikke noget.
        if ((abs(x-h.x)/4)<100 && abs(y-h.y) <100)
          h.scaredCounter += 100-(abs(x-h.x)/4);
      }

      if (image2 != null)
        activeImage = image2;
    }
  }

  void displayHitbox() {
  }
}
