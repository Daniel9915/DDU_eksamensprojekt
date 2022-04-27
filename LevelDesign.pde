ArrayList<Item> allItems = new ArrayList<Item>();
ArrayList<Item> levelItems = new ArrayList<Item>();
int frame = 0;
int item = 0;
int currentLevelEdit;
boolean spawnSet = false;
boolean graveSet = false;

void levelDesignDraw() {
  image(BG, width/2, height/2);

  if (spawnSet && item == 0) {
    item = 1;
  }
  if (graveSet && item == 1) {
    item = 2;
  }

  for (Item t : levelItems) {
    t.display();
  }

  allItems.get(item).x = mouseX;
  allItems.get(item).y = mouseY;
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
    levelItems.add(new Vase(mouseX, mouseY));
  } else if (allItems.get(item) instanceof HumanPlace) {
    levelItems.add(new HumanPlace(mouseX, mouseY));
  }
  if ( Data.connect() ) {
    Data.query( "SELECT ClassIndex, X, Y, LevelIndex FROM Level;" );
    String sql = "INSERT INTO Level( ClassIndex, X, Y, LevelIndex)VALUES ('" + item + "', '" + mouseX + "', '" + mouseY + "', '" + currentLevelEdit + "');";
    Data.execute(sql);
  }
}

void levelDesignKeys() {
  if (int(key-48)<allItems.size() && int(key-48)>-1) {
    item = int(key-48);
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
}

void loadLevel() {
  spawnSet = false;
  graveSet = false;
  println("load level " + currentLevelEdit);
  if ( Data.connect() ) {
    Data.query( "SELECT ClassIndex, X, Y, LevelIndex FROM Level;" );
    levelItems.clear();
    while (Data.next()) {
      if (Data.getInt("LevelIndex")==currentLevelEdit) {
        if (Data.getInt("ClassIndex")==0 && spawnSet == false) {
          levelItems.add(new Spawn(Data.getInt("X"), Data.getInt("Y")));
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
        } else if (Data.getInt("ClassIndex")==5) {
          levelItems.add(new HumanPlace(Data.getInt("X"), Data.getInt("Y")));
        }
      }
    }
  }
}

void levelEditSelect() {

  for (Button b : levelButtons) {
    b.display();
  }
}
