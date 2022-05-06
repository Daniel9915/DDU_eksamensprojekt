class Button {
  int x, y, w, h, setScene;
  String text;

  Button(int x_, int y_, int w_ , int h_ ,int scene_, String text_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    setScene = scene_;
    text = text_;
  }

  Button(int x_, int y_, int scene_, String text_) {
    x = x_;
    y = y_;
    w = 300;
    h = 150;
    setScene = scene_;
    text = text_;
  }

  void display() {
    fill(250, 145, 0);
    image(button, x, y, w, h);
    fill(0);
    textSize(40);
    text(text, x, y+13);

    if (mousePressed) {
      if (abs(x-mouseX)<150 && abs(y-mouseY)<75) {
        mousePressed = false;
        scene = setScene;
        if (int(text) == 0) {
          if (text.equals("+")) {
            currentLevelEdit = numberOfLevels+1;
            loadLevel();
          }
        } else {
          currentLevelEdit = int(text);
          loadLevel();
        }
      }
    }
  }
}
