class Ghost extends Player{
  float w;
  float speed = 2;
  Ghost(Coords _loc, float _w){
    gLoc = new Coords(_loc.x, _loc.y);
    w = _w;
  }
  
  void display(){
    image(ghostImg,gLoc.x,gLoc.y,w,w);
    
  }
  
  void update(){
    if(isGhost){
      move();
    }
    enterPumpkin();
  }
  
  void enterPumpkin(){
    if(!isGhost){
      gLoc.x = game.PumpkinGhost.get(1).pLoc.x;
      gLoc.y = game.PumpkinGhost.get(1).pLoc.y;
    }
  }
  
  void move(){
    if(left){
      gLoc.x = gLoc.x-speed;
    }
    if(right){
      gLoc.x = gLoc.x+speed;
    }
    if(up){
      gLoc.y = gLoc.y-speed;
    }
    if(down){
      gLoc.y = gLoc.y+speed;
    }
  }
  
}
