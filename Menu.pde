Button start = new Button(600, 300, 1, "START");
Button edit = new Button(600, 500, 2, "Edit Levels");
Button back = new Button(40, 40, 50, 50, 0, "<");
Button signIn = new Button(1125, 40, 150, 75, 5, "Sign In");

boolean signedIn = false;


void menuDraw() {
  creatingUser = false;
  image(menu, width/2, height/2, width, height);
  start.display();
  edit.display();
  if(!signedIn)
    signIn.display();
  //fill(250,145,0);
  fill(255,159,25);
  textSize(60);
  text("Spooky Spirit",width/2,150);
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
      image(check, 350*i+325, 200, 75, 75);
    }
    i++;
  }
  
  back.display();
  
}
