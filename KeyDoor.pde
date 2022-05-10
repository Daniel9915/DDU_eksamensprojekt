class KeyDoor extends Door {

  KeyDoor(float _x, float _y, float _w, float _h, PImage _image) {
    super(_x, _y, _w, _h, _image);
    itemName = "Door";
  }
  KeyDoor(float _x, float _y) {
    super(_x, _y, 20, 150, noImg);
    itemName = "Door";
  }
}
