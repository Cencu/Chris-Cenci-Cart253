class Obstacle {
  float x=100;
  float b = 100;
  float y;
  float speed = 5; 
  float sizeX = 10;
  float sizeY = 50;
  float moment;
  boolean displaying = true;
  int index;

  
  Obstacle(float tempX, float tempY, float tempS, float tempSX, float tempSY) {
    x = tempX;
    y = tempY;
    speed = tempS;
    sizeX = tempSX;
    sizeY = tempSY;
    moment = 0;
    index = globalIndex++;
    
    
  }
  //Obstacle moves downwards
  void update() {
    if (moment < millis()){
   y += speed;
    }
  }
  
  void display() {
   //  b= constrain(b,50,450);

    if (moment < millis()){
   fill(255,0,0);
   rectMode(CENTER);
   rect(x,y,sizeX,sizeY);
   println(index + " displaying");
    }
    
    if (y >= height) {
      b = b*floor(random(0,5));
      moment = millis() + floor(random(0,10000));
      y -= (height+sizeY);
    }   
  }
}