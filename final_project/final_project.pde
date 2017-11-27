

PImage redCar;
PImage scoremenu;
float x = 100;
float b = 100;
float y;
float sizex = 8;
float sizey = 150;
float speed = 5;

PFont clock;

String time = ":00";
int t;
int interval = 00;
int carAdd = 0;

String timeTruck = "00";
int tTruck;
int intervalTruck = 00;
int truckAdd = 0;
//Array of lanes, 16 are appearing on the screen
Lanes[] lanes = new Lanes[16];
//Powerups, which appear at random intervals 
Powerups powerups;

//Car class
Car car;
int tempTime = 0;
int tempTimeTruck = 0;

//Obstacle Class
Obstacle[] obstacle = new Obstacle[2];
Obstacle[] truck = new Obstacle[2];
void setup() {
  size(700, 800); 
  scoremenu = loadImage("scoremenu.png");   
    clock = createFont("digital-7.ttf",50);

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

    obstacle[i] = new Obstacle(50 + b*floor(random(0,5)), -80, 5, 40, 80,color(255,0,0));
    
  }
    for (int i = 0; i < truck.length; i++) {

    truck[i] = new Obstacle(50 + b*floor(random(0,5)), -150, 5, 40, 120,color(0,0,255));
    
  }
  //Cars starting location
  car = new Car(157, 600, 40, 80);
  powerups = new Powerups(x,y,10,30,5);
}

void draw() {
  background(100); 
  image(scoremenu,600,height/2);
  scoremenu.resize(200,805);
  for (int i = 0; i < lanes.length; i++) {
    lanes[i].display();
    lanes[i].update();
    lanes[i].lanesDown();
  }
  for (int i = 0; i < obstacle.length; i++) {
    obstacle[i].display();
    obstacle[i].update();
    car.accident(obstacle[i]);
    obstacle[i].timer();
   obstacle[i].overlap();
  }
  for (int i = 0; i < truck.length; i++){
    truck[i].display();
    truck[i].update();
    car.accident(truck[i]);
    truck[i].timerTruck();
    truck[i].overlap();
  }
  
  
  //t = interval+int(millis()/1000)-tempTime;
  //time = nf(t, 2);

  //if (t == 6) {
  //time = "00";
  //tempTime = int(millis()/1000);
  //Obstacle j = new Obstacle(b*floor(random(0,5)), 2, 5, 40, 80);
  //obstacle = (Obstacle[]) append(obstacle,j);
    
  //}
  //text(time, width/2, 50);


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

 

  