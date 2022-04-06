class Human{
  float x,y;
  float w,h;
  //The coordinate it walks left and right before switching
  float leftWalk,rightWalk;
  float viewDistance;
  float speed;
  PImage humanImg;
  boolean hasDetectedPumpkin = false;
  
  boolean left = false;
  //0 to 100
  float scaredCounter = 0;
  float wait = 0;
  
  Human(float _x, float _y, float _w, float _h, float _leftWalk, float _rightWalk, float _viewDistance, float _speed, PImage _humanImg){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    leftWalk = _leftWalk;
    rightWalk = _rightWalk;
    viewDistance = _viewDistance;
    speed = _speed;
    humanImg = _humanImg;
  }
  
  void display(){
    image(humanImg,x,y,w,h);
  }
  
  void update(){
    walk();
    detect();
    showVision();
  }
  
  void attack(){
  
  }
  
  void detect(){
    if(PumpkinGhost.get(1).pLoc.x > x-viewDistance && PumpkinGhost.get(1).pLoc.x < x+viewDistance){
      if(PumpkinGhost.get(1).isGhost == false){
        if(PumpkinGhost.get(1).isMoving == true){
          if(scaredCounter != 100){
            hasDetectedPumpkin = true;
          }
        }
      }
    }
  }
  
  void showVision(){
    push();
    rectMode(CENTER);
    if(hasDetectedPumpkin){
      fill(255,0,0);
    }else{
      fill(0,255,0);
    }
    rect(x-viewDistance,y,5,50);
    rect(x+viewDistance,y,5,50);
    pop();
  }
  
  void walk(){
    if(left){
      if(wait<0){
        x-= speed;
        if(x<leftWalk){
          left = false;
          wait = 240;
        }
      }else{
        wait--;
      }
    }
    if(!left){
      if(wait<0){
        x+= speed;
        if(x>rightWalk){
          left = true;
          wait = 240;
        }
      }else{
        wait--;
      }
    }
  
  }
}
