class Lanes {
  float x = 100;
  float y; 
  float vy = 5;
  float sizeX = 8;
  float sizeY = 150;
  
  Lanes(float tempX, float tempY, float tempVY, float tempSizeX, float tempSizeY) {
    x = tempX;
    y = tempY;
    vy = tempVY;
    sizeX = tempSizeX;
    sizeY = tempSizeY;
  }
  
  //The update loop has all the lanes moving downwards on the Y axis
  void update() {
    y += vy;
  }
  
  //The lanesDown loop has all the lanes resetting when they top of the lanes reach the bottom of the screen
  //If the top of the rectangle touches the bottom of the screen, they reappear as coming down from the top of the screen
  //Over and over
  void lanesDown() {
     if (y >= height) {
      y -= height+200;
    }
  }
  //Displays the lanes, all are the same
  void display() {
   noStroke();
   fill(255);
   rectMode(CORNER);
   rect(x,y,sizeX,sizeY);
  }
}