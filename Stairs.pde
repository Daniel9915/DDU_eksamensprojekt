class Stairs extends Item {

  
  Stairs(float _x, float _y) {
    super(_x, _y, 100, 200, noImg);
    itemName = "Stairs";
  }

  void display() {
    rect(x, y, w, h);
    movePlayer();
  }

  void movePlayer() {
    println(isInBox());
  }


  boolean isInBox() {
    if (coordinatesBox(GhostPumpkin.get(1).pLoc, x-(w/2),x+(w/2), y, y+h)) {
      println("in stairs");
      return true;
    }
    return false;
  }
}
