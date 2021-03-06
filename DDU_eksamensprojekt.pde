import processing.sound.*;
import de.bezier.data.sql.*;

SQLite Data;
SoundFile music;
SoundFile done;

Game game = new Game();
ArrayList<Player> GhostPumpkin = new ArrayList<Player>();
ArrayList<Button> levelButtons = new ArrayList<Button>();
ArrayList<PImage> humanImges = new ArrayList<PImage>();
ArrayList<PImage> humanImgesH = new ArrayList<PImage>();
ArrayList<PImage> humanImgesRun = new ArrayList<PImage>();
ArrayList<PImage> humanImgesRunH = new ArrayList<PImage>();
boolean[] levelsCompleted;

PFont font;

PImage ghostImg, pumpkinImg, chandelier, 
  vase, vase_broken, cup, cup_broken, glass, glass_broken, 
  noImg, BG, check, menu, menu2, button, house, stairsUp, stairsDown, grave, keyImg, tv, tv_broken1, tv_broken2, 
  houseHitbox, scare1, scare2, scare3, doorSide, chair, table, doorSide2, doorOpen, doorOpen2, ghostFog, painting, painting_broken;

PImage tutorial1, tutorial2;

int scene = 0;
int numberOfLevels = 0;
int completedDelay;
boolean gameOver = false, gameWon = false;
boolean keyCollected = false;
boolean stairTeleport = false;
boolean stairTeleportReleased = true;


void setup() {
  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER);
  size(1200, 800);
  frameRate(60);
  loadData();
  game.startUp();
  loadLevel();
}

void draw() {
  clear();
  switch(scene) {
  case 0:
    menuDraw();
    break;

  case 1:
    levelSelect();
    break;

  case 2:
    levelEditSelect();
    break;

  case 3:
    levelDesignDraw();
    break;

  case 4:
    game.run();
    break;

  case 5:
    signIn();
    break;
  }
}

void loadData() {
  font = createFont("data/FingerPaint-Regular.ttf", 128);
  textFont(font);

  music = new SoundFile(this, "music.mp3");
  done = new SoundFile(this, "done.mp3");

  Data = new SQLite( this, "Levels.sqlite" );
  ghostImg = loadImage("data/images/ghost.png");
  pumpkinImg = loadImage("data/images/pumpkin.png"); 
  chandelier = loadImage("data/images/chandelier.png");
  vase = loadImage("data/images/vase.png");
  vase_broken = loadImage("data/images/vaseBroken.png");
  cup = loadImage("data/images/cup.png");
  cup_broken = loadImage("data/images/brokenCup.png");
  glass = loadImage("data/images/glass.png");
  glass_broken = loadImage("data/images/brokenGlass.png");
  check = loadImage("data/images/check.png");
  menu = loadImage("data/images/menu.png");
  menu2 = loadImage("data/images/menu2.png");
  button = loadImage("data/images/button.png");
  noImg = loadImage("data/images/noImg.png");
  BG = loadImage("data/images/backgroundLowerQual.png");
  stairsDown = loadImage("data/images/stairDown.png");
  stairsUp = loadImage("data/images/stairUp.png");
  BG = loadImage("data/images/backgroundLowerQual.png");
  tutorial1 = loadImage("data/images/tutorial1.png");
  tutorial2 = loadImage("data/images/tutorial2.png");
  scare1 = loadImage("data/images/scare1.png");
  scare2 = loadImage("data/images/scare2.png");
  scare3 = loadImage("data/images/scare3.png");
  grave = loadImage("data/images/grave.png");
  keyImg = loadImage("data/images/key.png");
  tv = loadImage("data/images/tv.png");
  house = loadImage("data/images/houseLQ.png");
  houseHitbox = loadImage("data/images/houseLQHitbox.png");
  tv_broken1 = loadImage("data/images/tvStatic1.png");
  tv_broken2 = loadImage("data/images/tvStatic2.png");
  chair = loadImage("data/images/chair.png");
  table = loadImage("data/images/table.png");
  doorSide = loadImage("data/images/doorSide.png");
  doorOpen = loadImage("data/images/door.png");
  doorOpen2 = loadImage("data/images/door2.png");
  doorSide2 = loadImage("data/images/doorSide2.png");
  ghostFog = loadImage("data/images/ghostFog.png");
  painting = loadImage("data/images/painting.png");
  painting_broken = loadImage("data/images/paintingBroken.png");

  for (int i = 0; i<16; i++) {
    if (i<8)
      humanImges.add(loadImage("data/images/"+i+".png"));
    else
      humanImgesH.add(loadImage("data/images/"+(i-8)+"H.png"));
  }
  for (int i = 0; i<14; i++) {
    if (i<7)
      humanImgesRun.add(loadImage("data/images/R"+i+".png"));
    else
      humanImgesRunH.add(loadImage("data/images/R"+(i-7)+"H.png"));
  }


  addAllItems();

  if ( Data.connect() ) {
    Data.query( "SELECT ClassIndex, X, Y, LevelIndex FROM Level;" );
    while (Data.next()) {
      if (Data.getInt("LevelIndex")>numberOfLevels) {
        numberOfLevels = Data.getInt("LevelIndex");
      }
    }
  }
  int i = 0;
  for (int y = 0; i<=numberOfLevels; y+=200) {
    for (int x = 0; x < width-200 && i<=numberOfLevels; x+= 350) {
      i++;
      if (i<=numberOfLevels)
        levelButtons.add(new Button(x+200, y+150, 3, str(i)));
      else
        levelButtons.add(new Button(x+200, y+150, 3, "+"));
    }
  }
  levelsCompleted =  new boolean[numberOfLevels];
}

void keyPressed() {
  if (scene == 4)
    game.tutorial = false;
  game.keyPressed();
  if (scene == 3) {
    levelDesignKeys();
  }
  if (key == BACKSPACE && scene != 5) {
    scene = 0;
  }
  if (scene == 5) {
    username.type(key, keyCode);
    password.type(key, keyCode);

    if (keyCode == ENTER)
      logIn();
  }
}

void keyReleased() {
  game.keyReleased();
}

//Check if coordinates is in box
boolean coordinatesBox(Coords point, float startX, float endX, float startY, float endY) {
  if (coordinatesBetween(point.x, startX, endX)) {
    if (coordinatesBetween(point.y, startY, endY)) {
      return true;
    }
  }
  return false;
}

//Check if coordinate is between two others.
boolean coordinatesBetween(float point, float start, float end) {
  if (point > start && point < end) {
    return true;
  }
  return false;
}
