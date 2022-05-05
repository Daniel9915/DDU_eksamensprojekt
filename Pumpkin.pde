class Pumpkin extends Player {
  float w;
  float speed = 1.5;
  
  Pumpkin(Coords _loc, float _w) {
    pLoc = new Coords(_loc.x, _loc.y);
    w = _w;
  }

  void display() {
    image(pumpkinImg, pLoc.x, pLoc.y, w, w);
    push();
    noFill();
    strokeWeight(2);
    stroke(255, 140, 0, (dist(PumpkinGhost.get(0).gLoc.x, PumpkinGhost.get(0).gLoc.y, pLoc.x, pLoc.y))/2);
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
    isMoving = false;
    if (left) {
      pLoc.x = pLoc.x-speed;
      isMoving = true;
    }
    if (right) {
      pLoc.x = pLoc.x+speed;
      isMoving = true;
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
