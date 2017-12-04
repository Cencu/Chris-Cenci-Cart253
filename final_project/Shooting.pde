class Shooting {
  float x;
  float y;
  float speed;
  float sizeX;
  float sizeY;
  
  boolean powerup = true;
  
  Shooting(float tempx, float tempy, float tempspeed, float tempsizex, float tempsizey) {
  x = tempx;
  y = tempy;
  speed = tempspeed;
  sizeX = tempsizex;
  sizeY = tempsizey;
  }
  
  void ifShot(Car car) {
   if (keyCode=='q' && powerup) {
     y -= 5;
     rect(car.x,y,40,120);
  } 
  }
  
}