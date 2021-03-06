class Chandelier extends Item {
  float angleAdder;


  Chandelier(float _x, float _y, float _w, float _h, PImage _image) {
    super(_x, _y, _w, _h, _image);
    itemName = "Chandelier";
  }
  Chandelier(float _x, float _y) {
    super(_x, _y, 60, 70, chandelier);
    itemName = "Chandelier";
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

  void interact() {
    if (interactDelay<frameCount) {
      interactDelay = frameCount+120;
      angleAdder = 0.1;

      for (Human h : game.humanList) {
        if ((abs(x-h.x)/4)<50 && y<h.y)
          h.scaredCounter += 50-(abs(x-h.x)/4);
      }
    }
  }
}
