//WHATS LEFT TO DO
//refine oilspill
//Rockets
//Game over menu
//Timer starts when game starts
//refine game 
//Comment
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import processing.sound.*;
//Import sounds and microphones
SoundFile tone;
Minim minim;
AudioPlayer stereoSound;
AudioInput mic;

//Image of car and menu on the left of the game
PImage redCar;
PImage[] cars = new PImage[5];
int w;
int h;
PImage scoremenu;

//X location
float x = 100;
//Lanes size
float sizex = 8;
float sizey = 150;

//Obstacles location
float b =100;
float y;

//Global Speed
float speed = 5;

//Fonts
PFont clock;

  //Timer for the cars
  //The string displays the time
  String time = ":00";
  int t;
  int interval = 00;
  //CarAdd adds time for when the next car is supposed to appear
  int carAdd = 0;
  int tempTime = 0;
//Timer for the trucks
  String timeTruck = "00";
  int tTruck;
  int intervalTruck = 00;
  int truckAdd = 0;
  int tempTimeTruck = 0;
  
  String timeC = ":00";
  int tC;
  int intervalC = 00;
  int tempTimeC = 0;

//Array of lanes, 16 are appearing on the screen
Lanes[] lanes = new Lanes[16];

//Obstacle Class
Obstacle[] obstacle = new Obstacle[2];
Obstacle[] truck = new Obstacle[2];
Obstacle[] oil = new Obstacle[2];

//Rocket Class
Rocket[] rocket = new Rocket[1];

//Car class
Car car;

// An enum is a way to group together a set of named options
// In this case I'm using it for tracking the state the program is in.
enum State {
  NONE, 
    TITLE, 
    MENU, 
    OBSTACLE
}
// This is the variable that actually tracks the state in the game
State state;
//create variables to store the different objects that
// represent the different states of the game
Title title;
Menu menu;

void setup() {
  size(700, 800); 

  // Create the different states
  title = new Title();
  menu = new Menu();
  //state in the title screen
  state = State.TITLE;
  //Load in the sound and microphone levels
  tone = new SoundFile(this,"honk.wav");
  minim = new Minim(this);
  mic = minim.getLineIn();
  
  //Load in the sound of highways, the clock font and the menu on the left
 stereoSound = minim.loadFile("highway.wav");
  scoremenu = loadImage("scoremenu.png");   
  clock = createFont("digital-7.ttf", 50);

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
  
      for (int i = 0; i < cars.length; i++) {
   cars[i] = loadImage("cars" +i+ ".png");
    }
  
  //All obstacles spawn in a ranom lane
  for (int i = 0; i < obstacle.length; i++) {
    obstacle[i] = new Obstacle(cars[0],50 + x*floor(random(0, 5)), -80, speed, 40, 80);
  }
  for (int i = 0; i < truck.length; i++) {
    truck[i] = new Obstacle(cars[3], 50 + b*floor(random(0, 5)), -150, speed, 40, 120);
  }
    for (int i = 0; i < oil.length; i++) {
    oil[i] = new Obstacle(cars[2], 50 + b*floor(random(0, 5)), -50, speed, 30, 30);
  }
  for (int i = 0; i < rocket.length; i++) {
    rocket[i] = new Rocket(50 + b*floor(random(0, 5)), -50, speed, 10, 20, color(0, 0, 255));
  }
  
  //Cars starting location, starts in the second lane
  car = new Car(157, 600, 40, 80);

}

void draw() {
//Selects between alternatives
  switch (state) {
    // If our state is NONE, we do nothing
  case NONE:
    break;

    // If our state is TITLE we update the title object
    // which displays it, and then we check whether the title
    // screen is finished and if so we go to the menu state
  case TITLE:
    title.update();
    if (title.finished) {
      state = State.MENU;
    }
    break;

    // If our state is MENU we update the menu
    // We then check whether anything has been selected
    // in the menu and if so we switch to that state
    // (And reset the menu selection for next time.)
  case MENU:
    menu.update();
    if (menu.selection != State.NONE) {
      state = menu.selection;
      menu.selection = State.NONE;
      state = State.OBSTACLE;
    }
    break;
// If our state is OBSTACLE we update the
  // obstacle object which runs the game and then check whether 
  // the player has chosen to return to the menu. If so we set
  // the state appropriate, and reset the game.
  case OBSTACLE:
    if (menu.selection == State.NONE ) {
      background(100); 
      image(scoremenu, 600, height/2);
      scoremenu.resize(200, 805);
      for (int i = 0; i < lanes.length; i++) {
        lanes[i].display();
        lanes[i].update();
        lanes[i].lanesDown();
      }

      for (int i = 0; i < obstacle.length; i++) {
        obstacle[i].display();
        car.accident(obstacle[i]);
        obstacle[i].timer();
        obstacle[i].addToScreen();
        obstacle[i].update();
        obstacle[i].swerve(car);
        obstacle[i].difficulty();


      }

      for (int i = 0; i < truck.length; i++) {
        truck[i].display();
        truck[i].update();
        car.accident(truck[i]);
        truck[i].timerTruck();
        truck[i].addToScreen();
        truck[i].difficulty();
      }
            for (int i = 0; i < oil.length; i++) {
        oil[i].display();
        oil[i].update();
        oil[i].addToScreen();
        oil[i].timer();
        oil[i].difficulty();
        car.oilspill(oil[i]);
        car.oilreset(oil[i]);
      }
      for (int i = 0; i < rocket.length; i++) {
       rocket[i].update();
       rocket[i].display(); 
       rocket[i].collected(car);
       rocket[i].hit(obstacle[i]);
       rocket[i].shooting();
       rocket[i].launchspeed();
       rocket[i].follow(car);
       //rocket[i].timerRocket();
      }

      //Displays the car
      car.display();
    }
    break;
  }
}


//When the left or right keys are pressed, the car switch lanes loop is called and it switches
//Left or right
void keyPressed() {

  switch (state) {
  case NONE:
    break;

  case TITLE:
    title.keyPressed();
    break;

  case MENU:
    menu.keyPressed();
    break;


//Switch lanes with left and right
//Honk your horn with the Z key
  case OBSTACLE:
    if (keyCode == LEFT) {
      car.switchLanesLeft();
    }
    if (keyCode == RIGHT) {
      car.switchLanesRight();
    }
    if (keyCode == 'z' || keyCode == 'Z') {
     tone.play(); 
    }

    break;
  }
}
void keyReleased() {
  switch (state) {
  case NONE:
    break;

  case TITLE:
    title.keyReleased();
    break;

  case MENU:
    menu.keyReleased();
    break;

  case OBSTACLE:
    break;
  }

}