class Human extends Game {
  float x, y;
  float w, h;
  //The coordinate it walks left and right before switching
  float leftWalk, rightWalk;
  float viewDistance;
  float speed;
  PImage humanImg, scareImg;
  int imgIndex = 0;
  boolean hasDetectedPumpkin = false;

  boolean left = false;
  float scaredCounter = 0;  
  float scaredMax = random(50, 200);
  float waitTime = 0;
  int delay = int(random(18,30)*10);

  float attackRange = 40;
  boolean isInAttackRange = false;
  float runSpeed = 3;

  Human(float _x, float _y, float _w, float _h, float _leftWalk, float _rightWalk, float _viewDistance, float _speed, PImage _humanImg) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    leftWalk = _leftWalk;
    rightWalk = _rightWalk;
    viewDistance = _viewDistance;
    speed = _speed;
    humanImg = _humanImg;
  }

  void display() {
    image(humanImg, x, y, w, h);

    if (scaredCounter>scaredMax/3) {
      scareImg = scare1;
    }
    if (scaredCounter>(scaredMax/3)*2) {
      scareImg = scare2;
    }
    if (scaredCounter>scaredMax) {
      scareImg = scare3;
    }

    if (scareImg != null)
      image(scareImg, x, y-h/2,50,50);
  }

  void update() {

    if (scaredCounter>scaredMax) {
      rightWalk = width+viewDistance+50;
      left = false;
      speed = runSpeed;
      
    }

    move();
    detect();
    //showRange();
    if (hasDetectedPumpkin) {
      attack();
    }
  }

  void attack() {
    if (isInAttackRange) {
      gameOver = true;
    }
  }

  void detect() {
    if (GhostPumpkin.get(1).isGhost == false) {
      if (GhostPumpkin.get(1).isMoving == true) {
        if (scaredCounter < scaredMax) {
          if ((left && GhostPumpkin.get(1).pLoc.x > x-viewDistance && GhostPumpkin.get(1).pLoc.x < x-attackRange) || (!left && GhostPumpkin.get(1).pLoc.x < x+viewDistance && GhostPumpkin.get(1).pLoc.x > x+attackRange)) {
            if (abs(GhostPumpkin.get(1).pLoc.y-y)<h/2)
              hasDetectedPumpkin = true;
          }
        }
      }
    }
    if (hasDetectedPumpkin) {
      if (GhostPumpkin.get(1).pLoc.x > x-attackRange && GhostPumpkin.get(1).pLoc.x < x+attackRange) {
        isInAttackRange = true;
      }
    }
  }

  void showRange() {
    push();
    rectMode(CENTER);
    if (hasDetectedPumpkin) {
      fill(255, 0, 0);
    } else {
      fill(0, 255, 0);
    }
    rect(x-viewDistance, y, 5, 50);
    rect(x+viewDistance, y, 5, 50);

    if (isInAttackRange) {
      fill(255, 0, 0);
    } else {
      fill(0, 255, 0);
    }
    rect(x-attackRange, y, 5, 50);
    rect(x+attackRange, y, 5, 50);

    pop();
  }

  void move() {
    if (!hasDetectedPumpkin) {
      walk();
    } else {
      run();
    }
  }

  void walk() {
    if (frameCount%10 == 0) {
      imgIndex++;
    }
    if (left) {
      humanImg = humanImges.get(imgIndex%8);
      if (waitTime<0) {
        x-= speed;
        if (x<leftWalk) {
          left = false;
          waitTime = delay;
        }
      } else {
        waitTime--;
        humanImg = humanImges.get(2);
      }
    }
    if (!left) {
      humanImg = humanImgesH.get(imgIndex%8);
      if (scaredCounter > scaredMax) {
        humanImg = humanImgesRunH.get(imgIndex%7);
        waitTime = -1;
      }
      if (waitTime<0) {
        x+= speed;
        if (x>rightWalk) {
          left = true;
          waitTime = delay;
        }
      } else {
        waitTime--;
        humanImg = humanImgesH.get(2);
      }
    }
  }

  void run() {
    if (frameCount%7 == 0) {
      imgIndex++;
    }
    if (GhostPumpkin.get(1).pLoc.x < x-5) {
      x-=runSpeed;
      humanImg = humanImgesRun.get(imgIndex%7);
    } else if (GhostPumpkin.get(1).pLoc.x > x+5) {
      x+=runSpeed;
      humanImg = humanImgesRunH.get(imgIndex%7);
    }
  }
}
