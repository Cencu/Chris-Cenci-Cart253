class Car {
   float x = 150;
 float y = height/3;
 float sizeX = 500;
 float sizeY = 80;
PImage redCar;
 
 Car(float tempX, float tempY, float tempSizeX, float tempSizeY) {
 x = tempX;
 y = tempY;
 sizeX = tempSizeX;
 sizeY = tempSizeY;
 redCar = loadImage("car.png");
 }
 
 void switchLanesLeft() {
   x+=-100;
 }
 void switchLanesRight() {
   x+=100;
 }
 
 void display() {
     x= constrain(x,50,450);

 noStroke();
 fill(255,0,0);
 imageMode(CENTER);
image(redCar,x,y,sizeX,sizeY);
}

}