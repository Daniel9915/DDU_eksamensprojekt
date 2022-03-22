//Item - Overklasse til ting som spøgelset kan interagere med
class Item {
  float x, y, w, h;
  PImage image;
  
  Item(float _x, float _y, float _w, float _h, PImage _image) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    image = _image;
  }

  void display() {
    image(image, x, y, w, h);
  }

  void pickUp(boolean pickedUp) {
    if(pickedUp){
      //x = ghost x, y = ghost y
    }else{
      //Gravity fall down
    }
  }
  
  void throwItem(){
    
  }
  
  
}
