class Grave extends Item {
  int delay = 0;

  Grave(float _x, float _y, float _w, float _h, PImage _image) {
    super(_x, _y, _w, _h, _image);
    itemName = "Grave";
  }
  Grave(float _x, float _y) {
    super(_x, _y, 70, 80, grave);
    itemName = "Grave";
  }

  void display() {
    push();
    translate(x, y-h/2);
    super.display();
    pop();
    
    if (abs(x-GhostPumpkin.get(1).pLoc.x)<w/2 && !gameOver && !gameWon) {
      completedDelay = frameCount+200;
      gameWon = true;
      if (currentLevelEdit <= levelsCompleted.length) {
        levelsCompleted[currentLevelEdit-1] = true;
        if (signedIn && delay<frameCount) {
          Data.query( "SELECT Name, Password, Completed FROM Users;" );
          int insert = Data.getInt("Completed");
          String sql = "Update Users SET Completed = '" + insert + "' WHERE Name = '"+username.tempText+"';";
          Data.execute(sql);
          delay = completedDelay+10;
        }
      }
    }
  }

  void pickUp() {
  }
  void interact() {
  }
  void shatter() {
  }
}
