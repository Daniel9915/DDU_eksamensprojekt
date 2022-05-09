
class InputField {

  int x, y, w=500, h=100;
  String defultTekst, tempText = "";
  boolean clicked = false;

  InputField(int x_, int y_, String defultTekst_) {
    x = x_;
    y = y_;
    defultTekst = defultTekst_;
  }

  void display() {
    image(button, x, y, w, h);

    if (abs(x-mouseX)<w/2 && abs(y-mouseY)<h/2 && mousePressed) {
      mousePressed = false;
      clicked = !clicked;
      if (clicked) {
        password.clicked = false;
        username.clicked = false;
        clicked = true;
      }
    }

    if (tempText.length()>0) {
      fill(0);
      text(tempText, x, y+10);
    } else {
      fill(255, 255, 255, 150);
      text(defultTekst, x, y+10);
    }

    if (clicked) {
      w = 510;
      h = 110;
    } else {
      w = 500;
      h = 100;
    }
  }

  void type(char letter, int code) {
    if (clicked) {
      if (code < 65) {
        if (code == TAB) {
          password.clicked = true;
          username.clicked = true;
          clicked = false;
          keyCode = 0;
        } else if (code == BACKSPACE) {
          String tempTempTekst = "";
          for (int i = 0; i < tempText.length()-1; i++) {
            tempTempTekst += tempText.charAt(i);
          }
          tempText = tempTempTekst;
        }
      } else if (tempText.length()<17) {
        tempText += letter;
      }
    }
  }
}
