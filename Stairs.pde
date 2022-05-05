class Stairs extends Item {


  Coords locOne;
  Coords locTwo;
  float stairWidth;

  Stairs(float _x, float _y, float _w, float _h, PImage _image) {
    super(_x, _y, _w, _h, _image);
  }

  Stairs(float firstCoordinateX, float firstCoordinateY, float secondCoordinateX, float secondCoordinateY, float _stairWidth) {
    super(firstCoordinateX,firstCoordinateY,_stairWidth,200,noImg);
    locOne = new Coords(firstCoordinateX, firstCoordinateY);
    locTwo = new Coords(secondCoordinateX, secondCoordinateY);
    stairWidth = _stairWidth;
  }

  void display() {
    push();
    rectMode(CENTER);
    square(locOne.x, locOne.y, width);
    square(locTwo.x, locTwo.y, width);
    pop();
  }

  void movePlayer() {
  }

  //Return 0 if there is no stair in range  ||  return 1 if first rect is in range || return 2 if second rect is in range
  int isInBox() {
    if (coordinatesBox(GhostPumpkin.get(1).pLoc, locOne.x-(stairWidth/2), locOne.x+(stairWidth/2), locOne.y-(stairWidth/2), locOne.y+(stairWidth/2))) {
      return 1;
    }

    if (coordinatesBox(GhostPumpkin.get(1).pLoc, locTwo.x-(stairWidth/2), locTwo.x+(stairWidth/2), locTwo.y-(stairWidth/2), locTwo.y+(stairWidth/2))) {
      return 2;
    }

    return 0;
  }
}
