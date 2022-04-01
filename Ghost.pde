class Ghost extends Player {
  float w;
  float speed = 2;
  PVector velocity = new PVector(0, 0);
  Coords buttomLoc;
  Ghost(Coords _loc, float _w) {
    gLoc = new Coords(_loc.x, _loc.y);
    buttomLoc = new Coords(_loc.x, _loc.y+20);
    w = _w;
  }

  void display() {
    circle(buttomLoc.x, buttomLoc.y, 20);
    image(ghostImg, gLoc.x, gLoc.y, w, w);
  }

  void update() {
    if (isGhost) {
      move();
    }
    enterPumpkin();

    for (Item i : ItemList) { // tjekker om spøgelset er tæt på et opjekt og om man højre- eller venstre-klikker.
      if (dist(i.x, i.y, gLoc.x, gLoc.y) < 50) {
        if (abs(mouseX-i.x)<i.w && abs(mouseY-i.y)<i.h) {
          if (mousePressed && (mouseButton == LEFT)) {
            i.pickUp();
          } else if (mousePressed && (mouseButton == RIGHT)) {
            i.Interact();
          }
        }
      }
    }
  }

  void enterPumpkin() {
    if (!isGhost) {
      gLoc.x = PumpkinGhost.get(1).pLoc.x;
      gLoc.y = PumpkinGhost.get(1).pLoc.y;
      buttomLoc.x = gLoc.x;
      buttomLoc.y = gLoc.y;
    }
  }

  void move() {
    PVector acceleration = new PVector(gLoc.x-mouseX, gLoc.y-mouseY);

    acceleration.normalize();
    acceleration.mult(0.3);
    if (dist(gLoc.x, gLoc.y, PumpkinGhost.get(1).pLoc.x, PumpkinGhost.get(1).pLoc.y) < maxMoveDistance) {
      if (dist(gLoc.x, gLoc.y, mouseX, mouseY)>40) {
        velocity.x += acceleration.x;
        velocity.y += acceleration.y;
      } else {
        velocity.x += acceleration.x*0.5;
        velocity.y += acceleration.y*0.5;
      }
    } else {
      gLoc.x += velocity.x;
      gLoc.y += velocity.y;
      velocity.mult(-0.8);
    }

    if (dist(buttomLoc.x, buttomLoc.y, gLoc.x, gLoc.y)>5) {
      buttomLoc.x += (gLoc.x-buttomLoc.x)/3;
      buttomLoc.y += (gLoc.y+20-buttomLoc.y)/3;
    }

    velocity.mult(0.95);
    velocity.limit(4);
    gLoc.x -= velocity.x;
    gLoc.y -= velocity.y;
  }
}
