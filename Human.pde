class Human{
  float x,y;
  float w,h;
  float leftDistance,rightDistance;
  float viewDistance;
  float speed;
  PImage humanImg;
  
  
  boolean left = false;
  float wait = 0;
  
  Human(float _x, float _y, float _w, float _h, float _leftDistance, float _rightDistance, float _viewDistance, float _speed, PImage _humanImg){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    leftDistance = _leftDistance;
    rightDistance = _rightDistance;
    viewDistance = _viewDistance;
    speed = _speed;
    humanImg = _humanImg;
  }
  
  void display(){
    image(humanImg,x,y,w,h);
  }
  
  void update(){
    walk();
  }
  
  void walk(){
    if(left){
      if(wait>0){
        x-= speed;
        if(x<leftDistance){
          left = false;
          wait = 240;
        }
      }else{
        wait--;
      }
    }
    if(!left){
      if(wait>0){
        x+= speed;
        if(x>rightDistance){
          left = true;
          wait = 240;
        }
      }else{
        wait--;
      }
    }
  
  }
}
