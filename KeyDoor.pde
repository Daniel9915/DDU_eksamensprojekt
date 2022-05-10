class KeyDoor extends Door {

  KeyDoor(float _x, float _y, float _w, float _h, PImage _image) {
    super(_x, _y, _w, _h, _image);
    itemName = "Door";
  }
  KeyDoor(float _x, float _y) {
    super(_x, _y, 20, 150, noImg);
    itemName = "Door";
  }
  
  void display(){
    //image(doorSide2,x,y,w,h);
    push();
    fill(0,255,0);
    rect(x,y,w,h);
    pop();

  }
  
  void displayHitbox(){
    push();
    fill(0,255,0);
    rect(x,y,w,h);
    pop();
  }
}
