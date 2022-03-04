class Ghost extends Player{
  float w;
  float speed = 2;
  PVector velocity = new PVector(0,0);
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
    PVector acceleration = new PVector(gLoc.x-mouseX,gLoc.y-mouseY);
    
    acceleration.normalize();
    acceleration.mult(0.3);
    
    if(dist(gLoc.x,gLoc.y,mouseX,mouseY)>40){
      velocity.x += acceleration.x;
      velocity.y += acceleration.y;
    }else{
      velocity.x += acceleration.x*0.5;
      velocity.y += acceleration.y*0.5;
    }
    velocity.mult(0.95);
    velocity.limit(4);
    gLoc.x -= velocity.x;
    gLoc.y -= velocity.y;
    
  }
  
}
