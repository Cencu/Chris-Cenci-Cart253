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
 
 //If the left key is pressed, then the car will move on the x axis by 100 pixels, like it
 //Is switching lanes
 void switchLanesLeft() {
   x+=-100;
 }
 //Same as code above, but moves right
 void switchLanesRight() {
   x+=100;
 }
 
 //Displays the car as a car image, starting in the second lane
 void display() {
 //Constrains the car the the screen so it doesnt go off when switching lanes
 x= constrain(x,50,450);
 
 noStroke();
 fill(255,0,0);
 imageMode(CENTER);
image(redCar,x,y,sizeX,sizeY);
}

}