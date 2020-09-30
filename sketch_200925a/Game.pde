class Game {
  //egenskaber
  int w;
  int h;
  int numberOfEnemies;
  int playerLife;
  int[][]board;
  Dot player;
  Dot[] enemies;
  Keys keys;

  //konstruktør
  Game (int gridWidth, int gridHeight, int enemyNumbers) {
    w = gridWidth;
    h = gridHeight;
    numberOfEnemies = enemyNumbers;
    enemies = new Dot[enemyNumbers];
    playerLife = 50;
    board = new int[gridWidth][gridHeight];
    player = new Dot(0, 1, w-1, h-1);
    keys = new Keys();

    for (int i = 0; i < enemyNumbers; i++) {
      enemies[i] = new Dot ( w-1, h-1, w-1, h-1);
    }
  }
  //metoder
  int[][] getBoard() { 
    return board;
  }

  int getWidth() {
    return h;
  }

  int getHeight() {
    return w;
  }

  int getPlayerLife() {
    return playerLife;
  }

  void onKeyPressed(char k) {
    keys.onKeyPressed(k);
  }
  void onKeyReleased(char k) {
    keys.onKeyReleased(k);
  }

  void update() {
    updatePlayer();
    updateEnemies();
    checkForCollisions();
    clearBoard();
    populateBoard();
  }
  void updatePlayer() {
    // tjekke om spilleren har trykket på a,s,d eller w
    //og koden fortæller hvilken vej man skal rykke sig
    if (keys.wDown) { 
      player.moveUp();
    }
    if (keys.aDown) {
      player.moveLeft();
    }
    if (keys.sDown) {
      player.moveDown();
    }
    if (keys.dDown) {
      player.moveRight();
    }
    // denne blok er tilføjet til void update()
  }
  
  void updateEnemies() {
    // looper igennem alle fjender
    for (int i=0; i<enemies.length; i++) {
      // nogle gange skal fjende i følge efter spiller andre gange flytte sig random

      if (i>=0) {
        int dX = player.xPos - enemies[i].xPos;
        int dY = player.yPos - enemies[i].yPos;

        //denne blok fortæller enemy hvilken vej den skal rykke sig.
        if (dX>0) {
          enemies[i].moveRight();
        } else  if (dX<0) {
          enemies[i].moveLeft();
        } else if (dY>0) {
          enemies[i].moveDown();
        } else if (dY<0) {
          enemies[i].moveUp();
        }
      }
      int rand = (int) random(4);
      if (rand == 0) {
        enemies[i].moveUp();
      }
      if (rand == 1) {
        enemies[i].moveDown();
      }
      if (rand == 2) {
        enemies[i].moveRight();
      }
      if (rand == 3) {
        enemies[i].moveLeft();
      }
    }
  }
  void checkForCollisions() {
    // dvs hvis der er 1 i feltet og 2 er samme sted har vi collision
    // spørg hver fjende er du samme sted som player?
    for (int i=0; i<enemies.length; i++) {
      //getX og getY er funktioner under dots
      if (enemies[i].getX() == player.getX() && enemies[i].getY() == player.getY()) {
        // then coll and player looses one lifepoint
        playerLife--;
      }
    }
  }
  // denne metode sikre at der ikke kommer uendelige enemies, da de ikke bliver "fjernet"
  void clearBoard() {
    for (int y = 0; y < h; ++y) {
      for (int x = 0; x < w; ++x) {
        board[x][y]=0;
      }
    }
  }
  // denne metode sikre at man kan se player og enemies
  void populateBoard() {
    // insert player
    board[player.getX()][player.getY()] = 1;
    for (int i = 0; i < enemies.length; ++i) {
      board[enemies[i].getX()][enemies[i].getY()]= 2;
    }
  }  
}
