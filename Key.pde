class Key extends Item {

  float yUp;
  float yDown;

  Key(float _x, float _y, float _w, float _h, PImage _image) {
    super(_x, _y, _w, _h, _image);
    yUp = y-10;
    yDown = y+10;
    velocity.y = 1;
    itemName = "Key";
  }
  Key(float _x, float _y) {
    super(_x, _y, 30, 30, noImg);
    yUp = y-10;
    yDown = y+10;
    velocity.y = 1;
    itemName = "Key";
  }

  void display() {
    if (!keyCollected) {

      if (y>yDown) {
        velocity.y = -1;
      }
      if (y<yUp) {
        velocity.y = 1;
      }

      y += velocity.y/3;
      image(activeImage, x, y, w, h);

      if (abs(x-GhostPumpkin.get(1).pLoc.x)<w/2 && abs(y-GhostPumpkin.get(1).pLoc.y)<h/2) {
        keyCollected = true;
      }
    }
  }

  void pickUp() {
  }
  void interact() {
  }
}
