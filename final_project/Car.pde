class Car {
 float x = 157;
 float y = 600;
 float sizeX = 40;
 float sizeY = 80;
 PImage redCar;
 boolean slipped = false;
 
 float grip = 2;
 
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
   if (!slipped) {
   x-=100;
 } if (slipped) {
   x +=0;
 }
 }
 //Same as code above, but moves right
 void switchLanesRight() {
   if  (!slipped){
   x+=100;
 } if (slipped) {
   x +=0;
 }
 }
 
 //This loop checks when the car has been touched by the obstacle class
 //The booleans check when the car has collided with an object on all sides
 void accident(Obstacle obstacle) {
    boolean left = (x + sizeX/2 > obstacle.x - obstacle.sizeX/2);
    boolean right = (x - sizeX/2 < obstacle.x + obstacle.sizeX/2);
    boolean top = (y + sizeY/2 > obstacle.y - obstacle.sizeY/2);
    boolean bottom = (y - sizeY/2 < obstacle.y + obstacle.sizeY/2);
//When the booleans are true, then the car disappears
    if (left && right &&top && bottom) {
     sizeX = 0;
     sizeY = 0;
    }
 }
 void accidentTruck (Obstacle truck) {
    boolean leftT = (x + sizeX/2 > truck.x - truck.sizeX/2);
    boolean rightT = (x - sizeX/2 < truck.x + truck.sizeX/2);
    boolean topT = (y + sizeY/2 > truck.y - truck.sizeY/2);
    boolean bottomT = (y - sizeY/2 < truck.y + truck.sizeY/2);
    
    if (leftT && rightT &&topT && bottomT) {
     sizeX = 0;
     sizeY = 0;
    }
 }
 
 void oilspill(Obstacle oil) {
    boolean left = (x + sizeX/2 > oil.x - oil.sizeX/2);
    boolean right = (x - sizeX/2 < oil.x + oil.sizeX/2);
    boolean top = (y + sizeY/2 > oil.y - oil.sizeY/2);
    boolean bottom = (y - sizeY/2 < oil.y + oil.sizeY/2);
    
    if (left && right &&top && bottom) {
      slipped = true;
    }
    
 }
 void oilreset(Obstacle oil) {
    if (slipped && oil.y > height+100) {
      slipped = false;
    } 
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