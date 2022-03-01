class Ghost extends Player{
  Coords loc;
  float w;
  Ghost(Coords _loc, float _w){
    loc = _loc;
    w = _w;
  }
  
  void display(){
    image(ghostImg,loc.x,loc.y,w,w);
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
