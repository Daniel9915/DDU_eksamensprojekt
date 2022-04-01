class Chandelier extends Item {
  float angleAdder;
  Chandelier(float _x, float _y, float _w, float _h, PImage _image) {
    super(_x, _y, _w, _h, _image);
  }

  void display() {
    push();
    translate(x, y-h/2);
    rotate(angle);
    super.display();
    pop();
    angle += angleAdder;
    if (abs(angleAdder-0)>0.001) {
      if (angle>0) {
        angleAdder-=0.01;
      } else if (angle<0) {
        angleAdder+=0.01;
      }
      angleAdder*=0.96;
    } else {
      angle = 0;
    }
  }

  void Interact() {
    angleAdder = 0.1;
  }
}
