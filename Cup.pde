class Cup extends Vase {

  Cup(float _x, float _y, float _w, float _h, PImage _image) {
    super(_x, _y, _w, _h, _image);
  }
  Cup(float _x, float _y) {
    super(_x, _y, 20, 20, cup);
    image2 = cup_broken;
  }
}
