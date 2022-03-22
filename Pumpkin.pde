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
    stroke(255, 140, 0, dist(PumpkinGhost.get(0).gLoc.x, PumpkinGhost.get(0).gLoc.y, pLoc.x, pLoc.y));
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
    if (left) {
      pLoc.x = pLoc.x-speed;
    }
    if (right) {
      pLoc.x = pLoc.x+speed;
    }
  }

  void keyPressed() {
    if (key == 'a' ||key == 'A') {
      left = true;
    }
    if (key == 'd' ||key == 'D') {
      right = true;
    }
    if (key == 's' ||key == 'S') {
      down = true;
    }
    if (key == 'w' ||key == 'W') {
      up = true;
    }
  }
  void keyReleased() {
    if (key == 'a' ||key == 'A') {
      left = false;
    }
    if (key == 'd' ||key == 'D') {
      right = false;
    }
    if (key == 's' ||key == 'S') {
      down = false;
    }
    if (key == 'w' ||key == 'W') {
      up = false;
    }
  }
}
