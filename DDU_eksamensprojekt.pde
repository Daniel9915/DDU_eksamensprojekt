import de.bezier.data.sql.*;

SQLite Data;
Game game = new Game();
ArrayList<Player> PumpkinGhost = new ArrayList<Player>();
ArrayList<Item> ItemList = new ArrayList<Item>();
ArrayList<Button> levelButtons = new ArrayList<Button>();
ArrayList<PImage> humanImges = new ArrayList<PImage>();
ArrayList<PImage> humanImgesH = new ArrayList<PImage>();

PImage ghostImg;
PImage pumpkinImg;
PImage chandelier;
PImage vase;
PImage vase_broken;
PImage noImg;
PImage BG;

int scene = 0;
int numberOfLevels = 0;
boolean gameOver = false, gameWon = false;

Chandelier chan;

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
  }
}

void loadData() {
  Data = new SQLite( this, "Levels.sqlite" );
  ghostImg = loadImage("data/images/ghost.png");
  pumpkinImg = loadImage("data/images/pumpkin.png"); 
  chandelier = loadImage("data/images/chandelier.png");
  vase = loadImage("data/images/vase.png");
  vase_broken = loadImage("data/images/VaseBroken.png");
  humanImges.add(loadImage("data/images/0.png"));
  humanImges.add(loadImage("data/images/1.png"));
  humanImges.add(loadImage("data/images/2.png"));
  humanImges.add(loadImage("data/images/3.png"));
  humanImges.add(loadImage("data/images/4.png"));
  humanImges.add(loadImage("data/images/5.png"));
  humanImges.add(loadImage("data/images/6.png"));
  humanImges.add(loadImage("data/images/7.png"));
  humanImgesH.add(loadImage("data/images/0H.png"));
  humanImgesH.add(loadImage("data/images/1H.png"));
  humanImgesH.add(loadImage("data/images/2H.png"));
  humanImgesH.add(loadImage("data/images/3H.png"));
  humanImgesH.add(loadImage("data/images/4H.png"));
  humanImgesH.add(loadImage("data/images/5H.png"));
  humanImgesH.add(loadImage("data/images/6H.png"));
  humanImgesH.add(loadImage("data/images/7H.png"));
  noImg = loadImage("data/images/noImg.png");
  BG = loadImage("data/images/BackgroundLowerQual.png");

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
}

void keyPressed() {
  game.keyPressed();
  levelDesignKeys();
}

void keyReleased() {
  game.keyReleased();
}
