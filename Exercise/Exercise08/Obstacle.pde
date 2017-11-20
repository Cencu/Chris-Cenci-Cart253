class Obstacle {
  float x;
  float y;
  float speed = 5; 
  float sizeX = 10;
  float sizeY = 50;
  
  Obstacle(float tempX, float tempY, float tempS, float tempSX, float tempSY) {
    x = tempX;
    y = tempY;
    speed = tempS;
    sizeX = tempSX;
    sizeY = tempSY;
    
  }
  void update() {
   y += speed;
  }
  
  void display() {
   fill(255,0,0);
   rect(x,y,sizeX,sizeY);
  }
}