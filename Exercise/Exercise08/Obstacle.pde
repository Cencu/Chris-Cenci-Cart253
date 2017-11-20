class Obstacle {
  float x;
  float y;
  float speed = 5; 
  float sizeX = 10;
  float sizeY = 50;
 int start;

String time = "00";
int t;
int interval = 00;

  
  Obstacle(float tempX, float tempY, float tempS, float tempSX, float tempSY) {
    x = tempX;
    y = tempY;
    speed = tempS;
    sizeX = tempSX;
    sizeY = tempSY;
    
  }
  //Obstacle moves downwards
  void update() {
   y += speed;
  }
  
void timer(Obstacle obstacle) {

  t = interval+int(millis()/1000);
  time = nf(t,2);
if (t == 5);

}
  
  void display() {
   fill(255,0,0);
   rect(x,y,sizeX,sizeY);
   text(time,width/2, 50);
  }
}