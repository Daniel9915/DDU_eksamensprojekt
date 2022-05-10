class Door extends Item {

  Door(float _x, float _y, float _w, float _h, PImage _image) {
    super(_x, _y, _w, _h, _image);
    itemName = "Door";
  }
  Door(float _x, float _y) {
    super(_x, _y, 20, 150, noImg);
    itemName = "Door";
  }
  
  void display(){
    if(!coordinatesBox(GhostPumpkin.get(1).pLoc, x-(w*2),x+(w*2),y-h,y+h)){
      image(doorSide,x,y,w,h);
    }else{
      push();
      imageMode(CORNER);
      image(doorOpen,x-w/2,y-h/2,w*4,h);
      pop();
    }
  }
  
  
  
  void displayHitbox(){
    push();
    fill(0,0,255);
    rect(x,y,w,h);
    pop();
  }
}
