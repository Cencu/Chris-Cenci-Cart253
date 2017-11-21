

PImage redCar;
float x = 100;
float b = 100;
float y;
float sizex = 8;
float sizey = 150;
float speed = 5;

String time = "00";
int t;
int interval = 00;

//Array of lanes, 16 are appearing on the screen
Lanes[] lanes = new Lanes[16];

//Car class
Car car;
int tempTime = 0;
int globalIndex = 0;

//Obstacle Class
Obstacle[] obstacle = new Obstacle[10];
void setup() {
  size(500, 800); 

  //Each lane are in a different position. So I had to initialze all lanes in different positions
  for (int i = 0; i < lanes.length; i++) {
    lanes[0] = new Lanes(x, 0, speed, sizex, sizey);
    lanes[1] = new Lanes(x*2, 0, speed, sizex, sizey);
    lanes[2] = new Lanes(x*3, 75, speed, sizex, sizey);
    lanes[3] = new Lanes(x*4, 75, speed, sizex, sizey);
    lanes[4] = new Lanes(x, 250, speed, sizex, sizey);
    lanes[5] = new Lanes(x*2, 250, speed, sizex, sizey);
    lanes[6] = new Lanes(x*3, 325, speed, sizex, sizey);
    lanes[7] = new Lanes(x*4, 325, speed, sizex, sizey);
    lanes[8] = new Lanes(x, 500, speed, sizex, sizey);
    lanes[9] = new Lanes(x*2, 500, speed, sizex, sizey);
    lanes[10] = new Lanes(x*3, 575, speed, sizex, sizey);
    lanes[11] = new Lanes(x*4, 575, speed, sizex, sizey);
    lanes[12] = new Lanes(x, 750, speed, sizex, sizey);
    lanes[13] = new Lanes(x*2, 750, speed, sizex, sizey);
    lanes[14] = new Lanes(x*3, 825, speed, sizex, sizey);
    lanes[15] = new Lanes(x*4, 825, speed, sizex, sizey);
  }
  for (int i = 0; i < obstacle.length; i++) {

    obstacle[i] = new Obstacle(b*floor(random(.5,5)), 200, 5, 40, 80);
  }
  //Cars starting location
  car = new Car(157, 600, 40, 80);
}

void draw() {
  background(100); 
  for (int i = 0; i < lanes.length; i++) {
    lanes[i].display();
    lanes[i].update();
    lanes[i].lanesDown();
  }
  for (int i = 0; i < obstacle.length; i++) {
    obstacle[i].display();
    obstacle[i].update();
    car.accident(obstacle[i]);
  }
  
  t = interval+int(millis()/1000)-tempTime;
  time = nf(t, 2);

  if (t == 6) {
  time = "00";
  tempTime = int(millis()/1000);
  }
  text(time, width/2, 50);

  //Displays the car
  car.display();
}
//When the left or right keys are pressed, the car switch lanes loop is called and it switches
//Left or right
void keyPressed() {
  if (keyCode == LEFT) {
    car.switchLanesLeft();
  }
  if (keyCode == RIGHT) {
    car.switchLanesRight();
  }
}