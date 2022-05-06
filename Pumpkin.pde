class Pumpkin extends Player {
  float w;
  float speed = 2.5;
  
  
  float currentJumpPower = 1.5;
  float defaultJumpPower = 1.5;
  float floorLevel;
  boolean inAir;
  float defaultDelay = 2.5;
  float delayCounter = 2.5;
  boolean canJump = true;
  float gravity = 0.1;
  
  
  Pumpkin(Coords _loc, float _w) {
    pLoc = new Coords(_loc.x, _loc.y);
    w = _w;
    floorLevel = pLoc.y;
  }

  void display() {
    image(pumpkinImg, pLoc.x, pLoc.y, w, w);
    push();
    noFill();
    strokeWeight(2);
    stroke(255, 140, 0, (dist(GhostPumpkin.get(0).gLoc.x, GhostPumpkin.get(0).gLoc.y, pLoc.x, pLoc.y))/2);
    ellipseMode(CENTER);
    ellipse(pLoc.x, pLoc.y, maxMoveDistance*2, maxMoveDistance*2);
    pop();
  }

  void update() {
    if (!isGhost) {
      move();
    }
  }

  void move() {
    if(!left && !right){
    isMoving = false;
  }else{
    isMoving = true;
  }
  
  if(isMoving){
    if(right){
      if(canJump){
        inAir = true;
      }
      pLoc.x += speed;
    }
    if(left){
      if(canJump){
        inAir = true;
      }
      pLoc.x -= speed;
    }
  }
  
  
  if(!canJump){
    delayCounter -= 0.5;
    if(delayCounter < 0){
      canJump = true;
      delayCounter = defaultDelay;
    }
  }
  
  
  if(inAir == true){
    pLoc.y -= currentJumpPower;
    currentJumpPower -= gravity;

    if(pLoc.y > floorLevel){
      inAir = false;
      pLoc.y = floorLevel;
      canJump = false;
      currentJumpPower = defaultJumpPower;
    }
  }
  if(isMoving){
    if(inAir == false){
      if(canJump){
        inAir = true;
      }
    }
  }
  }

  void keyPressed() {
    if (key == 'a' ||key == 'A') {
      left = true;
    }
    if (key == 'd' ||key == 'D') {
      right = true;
    }
    
  }
  void keyReleased() {
    if (key == 'a' ||key == 'A') {
      left = false;
    }
    if (key == 'd' ||key == 'D') {
      right = false;
    }
   
  }
}
