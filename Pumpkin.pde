class Pumpkin extends Player{
  Coords loc;
  float w;
  Pumpkin(Coords _loc, float _w){
    loc = _loc;
    w = _w;
  }
  
  void display(){
    image(pumpkinImg,loc.x,loc.y,w,w);
  }
  
  void update(){
    move();
  }
  
  void move(){
    if(left){
    
    }
    if(right){
    
    }
  }
  
}
