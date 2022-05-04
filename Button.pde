
class Button {
  int x, y, setScene;
  String text;

  Button(int x_, int y_, int scene_, String text_) {
    x = x_;
    y = y_;
    setScene = scene_;
    text = text_;
  }

  void display() {
    fill(250,145,0);
    rect(x, y, 300, 150, 10);
    fill(0);
    textSize(40);
    text(text, x, y+15);

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
