Button start = new Button(600, 300, 1, "START");
Button edit = new Button(600, 500, 2, "Edit Levels");


void menuDraw() {
  start.display();
  edit.display();
}

void levelSelect() {

  for (Button b : levelButtons) {
    if (!b.text.equals("+")) {
      b.setScene = 4;
      b.display();
    }
  }
}
