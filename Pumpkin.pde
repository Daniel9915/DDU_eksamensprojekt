class Pumpkin extends Player{
  float w;
  float speed = 1.5;
  Pumpkin(Coords _loc, float _w){
    pLoc = new Coords(_loc.x, _loc.y);
    w = _w;
  }
  
  void display(){
    image(pumpkinImg,pLoc.x,pLoc.y,w,w);
    
    push();
    noFill();
    strokeWeight(2);
    stroke(255,140,0);
    ellipseMode(CENTER);
    ellipse(pLoc.x,pLoc.y,400,400);
    pop();
  }
  
  void update(){
    println(pLoc.x,pLoc.y);
    
    if(!isGhost){
      move();
    }
  }
  
  void move(){
    if(left){
      pLoc.x = pLoc.x-speed;
    }
    if(right){
      pLoc.x = pLoc.x+speed;
    }
  }
  
}
