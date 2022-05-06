class Stairs extends Item {

  String itemName = "Stairs";
  Stairs(float _x, float _y) {
    super(_x, _y, 100, 200, noImg);
  }

  void display() {
    push();
    rectMode(CENTER);
    rect(x, y, w, h);
    
    //square(locTwo.x, locTwo.y, width);
    pop();
  }

  void movePlayer() {
  }

  //Return 0 if there is no stair in range  ||  return 1 if first rect is in range || return 2 if second rect is in range
  int isInBox() {
    //if (coordinatesBox(GhostPumpkin.get(1).pLoc, locOne.x-(stairWidth/2), locOne.x+(stairWidth/2), locOne.y-(stairWidth/2), locOne.y+(stairWidth/2))) {
    //  return 1;
    //}

    //if (coordinatesBox(GhostPumpkin.get(1).pLoc, locTwo.x-(stairWidth/2), locTwo.x+(stairWidth/2), locTwo.y-(stairWidth/2), locTwo.y+(stairWidth/2))) {
    //  return 2;
    //}

    return 0;
  }
}
