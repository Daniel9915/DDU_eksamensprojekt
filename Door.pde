
class Door extends Item {
  boolean locked;

  Door(float _x, float _y, float _w, float _h, PImage _image) {
    super(_x, _y, _w, _h, _image);
    itemName = "Door";
  }
  Door(float _x, float _y) {
    super(_x, _y, 100, 200, noImg);
    itemName = "Door";
  }
}
