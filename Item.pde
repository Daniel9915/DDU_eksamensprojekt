//Item - Overklasse til ting som spøgelset kan interagere med
class Item {
  float x, y, w, h;
  float angle = 0;
  PImage image;
  
  Item(float _x, float _y, float _w, float _h, PImage _image) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    image = _image;
  }

  void display() {
    image(image,0,h/2, w, h);
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
