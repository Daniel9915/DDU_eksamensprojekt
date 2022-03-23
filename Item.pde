//Item - Overklasse til ting som spøgelset kan interagere med
class Item {
  float x, y, w, h;
  float angle = 0;
  float weight = 1.1;
  PVector acceleration = new PVector(0,1);
  PImage image;
  boolean picekedUp = false;
  
  Item(float _x, float _y, float _w, float _h, PImage _image) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    image = _image;
  }

  void display() {
    image(image,0,h/2, w, h);
    if(picekedUp){
      acceleration.y *= weight;
      y+=acceleration.y;
    }
  }

  void pickUp(boolean holding) {
    picekedUp = true;
    if(holding){
      x = PumpkinGhost.get(0).gLoc.x;
      y = PumpkinGhost.get(0).gLoc.y;
    }else{
      acceleration.y*=weight;
      y+=acceleration.y;
    }
  }
  
  void throwItem(){
    acceleration.set(5,-5);
  }
  
  
}
