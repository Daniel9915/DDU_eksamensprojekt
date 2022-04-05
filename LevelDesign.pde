ArrayList<Item> allItems = new ArrayList<Item>();
ArrayList<Item> levelItems = new ArrayList<Item>();
int frame = 0;
int item = 0;

void levelDesignDraw() {

  for (Item t : levelItems) {
    t.display();
  }

  allItems.get(item).x = mouseX;
  allItems.get(item).y = mouseY;
  allItems.get(item).display();

  if (mousePressed && frame < frameCount) {
    frame = frameCount+30;
    addNew();
  }
}

void addNew() {
  if (allItems.get(item) instanceof Chandelier) {
    levelItems.add(new Chandelier(mouseX, mouseY));
  } else if (allItems.get(item) instanceof Tv) {
    levelItems.add(new Tv(mouseX, mouseY));
  } else if (allItems.get(item) instanceof Vase) {
    levelItems.add(new Vase(mouseX, mouseY));
  }
}

void levelDesignKeys() {
  switch(key) {
  case '0':
    item = 0;
    break;
  case '1':
    item = 1;
    break;
  case '2':
    item = 2;
    break;
  }
}

void addAllItems() {
  allItems.add(new Chandelier(0, 0));
  allItems.add(new Tv(0, 0));
  allItems.add(new Vase(0, 0));
}
