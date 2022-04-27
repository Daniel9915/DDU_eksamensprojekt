import de.bezier.data.sql.*;

SQLite Data;
Game game = new Game();
ArrayList<Player> PumpkinGhost = new ArrayList<Player>();
ArrayList<Item> ItemList = new ArrayList<Item>();
ArrayList<Button> levelButtons = new ArrayList<Button>();

PImage ghostImg;
PImage pumpkinImg;
PImage chandelier;
PImage vase;
PImage vase_broken;
PImage humanImg;
PImage noImg;
PImage BG;

int scene = 0;
int numberOfLevels = 0;
boolean gameOver = false;

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
    game.run();
    break;

  case 2:
    levelEditSelect();
    break;
  case 3:
    levelDesignDraw();
  }
}


void loadData() {
  Data = new SQLite( this, "Levels.sqlite" );
  ghostImg = loadImage("data/images/ghost.png");
  pumpkinImg = loadImage("data/images/pumpkin.png"); 
  chandelier = loadImage("data/images/chandelier.png");
  vase = loadImage("data/images/vase.png");
  vase_broken = loadImage("data/images/VaseBroken.png");
  humanImg = loadImage("data/images/human.png");
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
