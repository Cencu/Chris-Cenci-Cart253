class Lanes {
  float x = 100;
  float y = 100; 
  float vy = 5;
  float sizeX = 10;
  float sizeY = 200;
  
  Lanes(float tempX, float tempY, float tempVY, float tempSizeX, float tempSizeY) {
    x = tempX;
    y = tempY;
    vy = tempVY;
    sizeX = tempSizeX;
    sizeY = tempSizeY;
  }
  void update() {
    y += vy;
  }
  void lanesDown() {
     if (y >= height) {
      y -= height+200;
    }
  }
  void display() {
   noStroke();
   fill(255);
   rect(x,y,sizeX,sizeY);
  }
}