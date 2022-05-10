class Door extends Item {
  boolean isKeyDoor;

  Door(float _x, float _y, float _w, float _h, PImage _image) {
    super(_x, _y, _w, _h, _image);
    itemName = "Door";
  }
  Door(float _x, float _y) {
    super(_x, _y, 20, 150, noImg);
    itemName = "Door";
  }
  
  void display(){
    //image(doorImage,x,y,w,h);
    push();
      fill(0,0,255);
      rect(x,y,w,h);
      pop();
  }
  
  void displayHitbox(){
    if(isKeyDoor){
      push();
      fill(0,255,0);
      rect(x,y,w,h);
      pop();
    }else{
      push();
      fill(0,0,255);
      rect(x,y,w,h);
      pop();
    }
  }
}
