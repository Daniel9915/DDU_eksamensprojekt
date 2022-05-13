
class Tabel extends Item {

  Tabel(float _x, float _y, float _w, float _h, PImage _image) {
    super(_x, _y, _w, _h, _image);
    itemName = "Table";
  }
  Tabel(float _x, float _y) {
    super(_x, _y, 200, 70, table);
    itemName = "Table";
  }

  void display() {
    push();
    translate(x, y-h/2);
    super.display();
    pop();
  }
  void pickUp() {
  }
  void interact() {
  }
  void shatter() {
  }
}
