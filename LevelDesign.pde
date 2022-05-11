ArrayList<Item> allItems = new ArrayList<Item>();
ArrayList<Item> levelItems = new ArrayList<Item>();
int frame = 0;
int item = 0;
int currentLevelEdit;
boolean spawnSet = false;
boolean graveSet = false;

void levelDesignDraw() {
  image(BG, width/2, height/2);
  image(house, width/2, (height/2)-40);

  if (spawnSet && item == 0) {
    item = 1;
  }
  if (graveSet && item == 1) {
    item = 2;
  }

  for (Item t : levelItems) {
    t.display();
  }

  int l = 0;
  textSize(12);
  strokeWeight(3);
  for (Item t : allItems) {
    fill(250, 145, 0, 100);
    rect(70*l+35, 13, 70, 25, 5);
    fill(0);
    text(t.itemName, 70*l+35, 15);
    text(l, 70*l+8, 22);
    l++;
  }
  textSize(32);

  allItems.get(item).x = mouseX;
  allItems.get(item).y = mouseY;
  itemText();
  allItems.get(item).display();

  if (mousePressed && frame < frameCount) {
    frame = frameCount+30;
    if (mouseButton == LEFT) {
      addNew();
    } else if (mouseButton == RIGHT) {
      for (Item i : levelItems) {
        if (dist(i.x, i.y, mouseX, mouseY)<25) {
          //String sql = "DELETE FROM Level WHERE X='"+ int(i.x) + "', Y='"+ int(i.y)+"';"; dette fungerede ikke af en eller anden grund
          String sql="DELETE FROM Level WHERE X=" + i.x +";";
          Data.execute(sql);
          levelItems.remove(i);
          break;
        }
      }
    }
  }
}

void addNew() {
  if (allItems.get(item) instanceof Spawn) {
    levelItems.add(new Spawn(mouseX, mouseY));
    spawnSet = true;
  } else if (allItems.get(item) instanceof Grave) {
    levelItems.add(new Grave(mouseX, mouseY));
    graveSet = true;
  } else if (allItems.get(item) instanceof Chandelier) {
    levelItems.add(new Chandelier(mouseX, mouseY));
  } else if (allItems.get(item) instanceof Tv) {
    levelItems.add(new Tv(mouseX, mouseY));
  } else if (allItems.get(item) instanceof Vase) {

    if (allItems.get(item) instanceof Glass) {
      levelItems.add(new Glass(mouseX, mouseY));
    } else if (allItems.get(item) instanceof Cup) {
      levelItems.add(new Cup(mouseX, mouseY));
    } else
      levelItems.add(new Vase(mouseX, mouseY));
  } else if (allItems.get(item) instanceof HumanPlace) {
    levelItems.add(new HumanPlace(mouseX, mouseY));
  } else if (allItems.get(item) instanceof Key) {
    levelItems.add(new Key(mouseX, mouseY));
  } else if (allItems.get(item) instanceof Stairs) {
    levelItems.add(new Stairs(mouseX, mouseY));
  } else if (allItems.get(item) instanceof Door) {
    levelItems.add(new Door(mouseX, mouseY));
  } else if (allItems.get(item) instanceof KeyDoor) {
    levelItems.add(new KeyDoor(mouseX, mouseY));
  } else if (allItems.get(item) instanceof KeyDoor) {
    levelItems.add(new KeyDoor(mouseX, mouseY));
  } else if (allItems.get(item) instanceof Tabel) {
    levelItems.add(new Tabel(mouseX, mouseY));
  } else if (allItems.get(item) instanceof Chair) {
    levelItems.add(new Chair(mouseX, mouseY));
  }
  if ( Data.connect() ) {
    Data.query( "SELECT ClassIndex, X, Y, LevelIndex FROM Level;" );
    String sql = "INSERT INTO Level( ClassIndex, X, Y, LevelIndex)VALUES ('" + item + "', '" + mouseX + "', '" + mouseY + "', '" + currentLevelEdit + "');";
    Data.execute(sql);
  }
}

void itemText() {
  String temp = "";
  if (allItems.get(item) instanceof Spawn) {
    temp = "Spawn";
  } else if (allItems.get(item) instanceof Grave) {
    temp = "Grave";
  } else if (allItems.get(item) instanceof Chandelier) {
    temp = "Chandelier";
  } else if (allItems.get(item) instanceof Tv) {
    temp = "Tv";
  } else if (allItems.get(item) instanceof Vase) {
    temp = "Vase";
    if (allItems.get(item) instanceof Glass) {
      temp = "Glass";
    } else if (allItems.get(item) instanceof Cup) {
      temp = "Cup";
    }
  } else if (allItems.get(item) instanceof HumanPlace) {
    temp = "Human";
  } else if (allItems.get(item) instanceof Key) {
    temp = "Key";
  } else if (allItems.get(item) instanceof Door) {
    temp = "Door";
    if (allItems.get(item) instanceof KeyDoor)
      temp = "Locked Door";
  } else if (allItems.get(item) instanceof Tabel) {
    temp = "Table";
  } else if (allItems.get(item) instanceof Chair) {
    temp = "Chair";
  }
  text(temp, mouseX, mouseY-50);
}

void levelDesignKeys() {
  if (int(key-48)<allItems.size() && int(key-48)>-1) {
    item = int(key-48);
  }

  if (key == 'q') {
    if (item != 10)
      item = 10;
    else {
      item = 11;
    }
  }
  if (key == 'w') {
    item = 12;
  }
  if (key == 'e') {
    item = 13;
  }
  if (keyCode == ENTER) {
    scene = 0;
  }
}

void addAllItems() {
  allItems.add(new Spawn(0, 0));
  allItems.add(new Grave(0, 0));
  allItems.add(new Chandelier(0, 0));
  allItems.add(new Tv(0, 0));
  allItems.add(new Vase(0, 0));
  allItems.add(new HumanPlace(0, 0));
  allItems.add(new Stairs(0, 0));
  allItems.add(new Glass(0, 0));
  allItems.add(new Cup(0, 0));
  allItems.add(new Key(0, 0));
  allItems.add(new Door(0, 0));
  allItems.add(new KeyDoor(0, 0));
  allItems.add(new Tabel(0, 0));
  allItems.add(new Chair(0, 0));
}

void loadLevel() {
  keyCollected = false;
  gameOver = false;
  gameWon = false;
  spawnSet = false;
  graveSet = false;
  game.humanList.clear();
  println("load level " + currentLevelEdit);
  if ( Data.connect() ) {
    Data.query( "SELECT ClassIndex, X, Y, LevelIndex FROM Level;" );
    levelItems.clear();
    while (Data.next()) {
      if (Data.getInt("LevelIndex")==currentLevelEdit) {
        if (Data.getInt("ClassIndex")==0 && spawnSet == false) {
          if (scene == 3) {
            levelItems.add(new Spawn(Data.getInt("X"), Data.getInt("Y")));
          } else if (scene == 4) {
            GhostPumpkin.clear();
            Coords tempLoc = new Coords(Data.getInt("X"), Data.getInt("Y"));
            GhostPumpkin.add(new Ghost(tempLoc, 40));
            GhostPumpkin.add(new Pumpkin(tempLoc, 70));
          }
          spawnSet = true;
        } else if (Data.getInt("ClassIndex")==1 && graveSet == false) {
          levelItems.add(new Grave(Data.getInt("X"), Data.getInt("Y")));
          graveSet = true;
        } else if (Data.getInt("ClassIndex")==2) {
          levelItems.add(new Chandelier(Data.getInt("X"), Data.getInt("Y")));
        } else if (Data.getInt("ClassIndex")==3) {
          levelItems.add(new Tv(Data.getInt("X"), Data.getInt("Y")));
        } else if (Data.getInt("ClassIndex")==4) {
          levelItems.add(new Vase(Data.getInt("X"), Data.getInt("Y")));
        } else if (Data.getInt("ClassIndex")==6) {
          levelItems.add(new Stairs(Data.getInt("X"), Data.getInt("Y")));
        } else if (Data.getInt("ClassIndex")==7) {
          levelItems.add(new Glass(Data.getInt("X"), Data.getInt("Y")));
        } else if (Data.getInt("ClassIndex")==8) {
          levelItems.add(new Cup(Data.getInt("X"), Data.getInt("Y")));
        } else if (Data.getInt("ClassIndex")==9) {
          levelItems.add(new Key(Data.getInt("X"), Data.getInt("Y")));
        } else if (Data.getInt("ClassIndex")==10) {
          levelItems.add(new Door(Data.getInt("X"), Data.getInt("Y")));
        } else if (Data.getInt("ClassIndex")==11) {
          levelItems.add(new KeyDoor(Data.getInt("X"), Data.getInt("Y")));
        } else if (Data.getInt("ClassIndex")==12) {
          levelItems.add(new Tabel(Data.getInt("X"), Data.getInt("Y")));
        } else if (Data.getInt("ClassIndex")==13) {
          levelItems.add(new Chair(Data.getInt("X"), Data.getInt("Y")));
        } else if (Data.getInt("ClassIndex")==5) {
          if (scene == 3) {
            levelItems.add(new HumanPlace(Data.getInt("X"), Data.getInt("Y")));
          } else if (scene == 4) {
            game.humanList.add(new Human(Data.getInt("X"), Data.getInt("Y"), 89, 180, Data.getInt("X")-100, Data.getInt("X")+100, 200, random(0.5,1), humanImges.get(0)));
          }
        }
      }
    }
  }
}

void levelEditSelect() {
  image(menu2, width/2, height/2, width, height);

  for (Button b : levelButtons) {
    b.setScene = 3;
    b.display();
  }
  back.display();
}
