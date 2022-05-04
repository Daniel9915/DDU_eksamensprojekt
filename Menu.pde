Button start = new Button(600, 300, 1, "START");
Button edit = new Button(600, 500, 2, "Edit Levels");


void menuDraw() {
  image(menu, width/2, height/2, width, height);
  start.display();
  edit.display();
}

void levelSelect() {

  image(menu2, width/2, height/2, width, height);

  for (Button b : levelButtons) {
    if (!b.text.equals("+")) {
      b.setScene = 4;
      if (mousePressed) {
        currentLevelEdit = int(b.text);
        loadLevel();
      }
      b.display();
    }
  }
  int i = 0;
  for (boolean b : levelsCompleted) {
    if (b == true) {
      image(check, 350*i+325, 200, 50, 50);
    }
    i++;
  }
}
