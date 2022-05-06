class Glass extends Vase {
  
  
  Glass(float _x, float _y, float _w, float _h, PImage _image) {
    super(_x, _y, _w, _h, _image);
    itemName = "Glass";
  }
  Glass(float _x, float _y) {
    super(_x, _y, 13, 20, glass);
    image2 = glass_broken;
    itemName = "Glass";
  }
}
