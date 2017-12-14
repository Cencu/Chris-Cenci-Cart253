//ARTIST STATMENT\\

/*The game I created is called “Deadline Avoider”. The point of the game is that you are a student who is really bad at time management and is literally running away from his deadlines. 
The objective of the game is to avoid them for as long as possible before they eventually “catch up” with you. This was originally intended to be a car game, however I changed the subject 
to be a little more enticing. In the game you have one help, a shield, or a doctor’s note. What this does is, it lets you avoid one obstacle if ever you are in trouble. There is also the 
yelling part, when you yell at a deadline, it can move out of the way. The most interesting part of the game in my opinion, is the deadlines and the shield. I used lots of timers and append 
the obstacles, two things I had never done in this level of detail. It took a lot of time and understanding to append the obstacles within the parameters I wanted, and without them overlapping. 
As for the shield, it also took lots of time to develop, I had lots of trouble with the timer and making the shield disappear after a certain amount of time, therefore I found a workaround.
What I tried to do in the game, is incorporate code I’ve learned in class, and bring it up a level, for example, I learned how to append arrays and create an array of images, so each 
appended object can have a unique image. I also attempted to make the game fully interactive, I brought in usage of the microphone and the webcam to interact with the game. Lastly, I intended 
for the game to be slightly comedic, by incorporating a running sprite man, who yells “I’m late!” (Although he says it very low).*/


//LIBRARIES\\
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import processing.sound.*;
import sprites.*;
import sprites.maths.*;
import sprites.utils.*;
import processing.video.*;

//Import sounds, video and microphone
SoundFile tone;
SoundFile shieldTone;
SoundFile crashed;
Minim minim;
AudioPlayer stereoSound;
AudioPlayer menuMusic;
AudioInput mic;
Capture video;

//IMAGES\\
//Player Sprite
Sprite avatar;

// Create a StopWatch to keep track of time passing
// (So we know how fast the animation should run.)
// How fast the avatar mores (pixels per second)
StopWatch times = new StopWatch();
float avatarSpeed = 1;

//Shield Powerup
PImage shieldPic;
//Array of obstacles, the images of the obstacles
PImage[] cars = new PImage[5];
PImage[] lockerPic = new PImage[2];
//The Menu on the right side, which displays time/score
PImage scoremenu;

//Global X location
int x = 100;
//Lanes sizes
float sizex = 150;
float sizey = 400;
//Obstacles location
float b =100;
float sizeX = 80;
float sizeY = 80;
//X and Y location, Y location depends on the webcam
float carX = 157;
float carY = 450;


//Global Speed
float speed = 5;

//Fonts\\
PFont clock;
PFont titlefont;
PFont instructionFont;

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

//Timer for appending rocket
String timeC = ":00";
int tC;
int intervalC = 00;
int tempTimeC = 0;
int invisiadd = 0;


//Webcam Tracker\\
int reddestX = 0;
int reddestY = 0;
float record = 1000;


//Array of lanes, 16 are appearing on the screen
Lanes[] lanes = new Lanes[8];

//Obstacle Classes\\
Obstacle[] obstacle = new Obstacle[2];
Obstacle[] truck = new Obstacle[1];
Obstacle[] oil = new Obstacle[1];

//Powerup Classes\\
Invisibility[] invisibility = new Invisibility[1];

//Car class/Player\\
Car car;

// An enum is a way to group together a set of named options
// In this case I'm using it for tracking the state the program is in.
enum State {
  NONE, 
    TITLE, 
    MENU, 
    OBSTACLE, 
    WEBCAM_MODE, 
    GAME_OVER
}

// This is the variable that actually tracks the state in the game
State state;
//create variables to store the different objects that
//represent the different states of the game
Title title;
Menu menu;
GameOver gameOver;
Obstacle obstacleGame;
void setup() {
  size(700, 800); 
  //Capturing the webcam of the game, webcam's maximum capture is 640,480\\
  video = new Capture(this, 640, 480, 30);

  // Create our Sprite by providing "this", the file
  // with the spritesheet, the number of columns in the
  // sheet, the number of rows in the sheet, and the
  // z-depth of this sprite
  avatar = new Sprite(this, "cars1.png", 3, 1, 1);
  //Set the default frame squence, since he doesnt stop moving,
  //There is no single frame he rests on
  avatar.setFrameSequence(0, 2);

  // Create the different states
  title = new Title();
  //Menu screen for different options of the game
  menu = new Menu();
  //Game over screen
  gameOver = new GameOver();
  //main game screen
  obstacleGame = new Obstacle();
  //state in the title screen
  state = State.TITLE;

  //Load in the sounds and microphone levels
  //"I'm Late"
  tone = new SoundFile(this, "honk.wav");
  //Calling the shield
  shieldTone = new SoundFile(this, "hailmary.wav");
  //Crashing sound when all the deadlines catch up to you
  crashed = new SoundFile(this, "dead.wav");
  minim = new Minim(this);
  mic = minim.getLineIn();

  //Load in the music
  menuMusic = minim.loadFile("menuMusic.wav");
  //The menu on the left
  scoremenu = loadImage("scoremenu.png");   
  //Fonts used in the game
  clock = createFont("digital-7.ttf", 50);
  titlefont = createFont("ABATI__.TTF", 50);
  instructionFont = createFont("HelveticaNeueLTCom-Md.ttf", 15);

  //Each lane are in a different position. So I had to initialze all lanes in different positions
  //More or less to keep track of where the player is and where the objects are
  //Appending
  
    for (int i = 0; i < lockerPic.length; i++) {
        lockerPic[i] = loadImage("lockers" +i+ ".png");
    }
  for (int i = 0; i < lanes.length; i++) {
    lanes[0] = new Lanes(lockerPic[0],x*4, 0, speed, sizex, sizey);
    lanes[1] = new Lanes(lockerPic[0],x*4, 400, speed, sizex, sizey);
    lanes[2] = new Lanes(lockerPic[0],x*4, -400, speed, sizex, sizey);
    lanes[3] = new Lanes(lockerPic[0],x*4, -800, speed, sizex, sizey);
    lanes[4] = new Lanes(lockerPic[1],-40, 0, speed, sizex, sizey);
    lanes[5] = new Lanes(lockerPic[1],-40, 400, speed, sizex, sizey);
    lanes[6] = new Lanes(lockerPic[1],-40, -400, speed, sizex, sizey);
    lanes[7] = new Lanes(lockerPic[1],-40, -800, speed, sizex, sizey);

  }

  //Load in the array of car images
  for (int i = 0; i < cars.length; i++) {
    cars[i] = loadImage("cars" +i+ ".png");
  }

  //All obstacles and powerups spawn in a random lane
  for (int i = 0; i < obstacle.length; i++) {
    obstacle[i] = new Obstacle(cars[0], 50 + x*floor(random(0, 5)), -80, sizeX, sizeY, speed);
  }
  for (int i = 0; i < truck.length; i++) {
    truck[i] = new Obstacle(cars[4], 50 + b*floor(random(0, 5)), -150, 40, 120, speed);
  }
  for (int i = 0; i < oil.length; i++) {
    oil[i] = new Obstacle(cars[3], 50 + b*floor(random(0, 5)), -50, 60, 60, speed);
  }

  for (int i = 0; i < invisibility.length; i++) {
    invisibility[i] = new Invisibility(shieldPic, 50 + b*floor(random(0, 5)), -50, speed, 80, 80);
  }

  //Cars starting location, starts in the second lane
  car = new Car(carX, carY, 40, 80);
}

void draw() {
  //Checks if the webcam is availabe
  if (video.available()) {
    video.read();
  }
  image(video, 0, 0);

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
    // obstacle objects which runs the game and then check whether 
    // the player has chosen to return to the menu. If so we set
    // the state appropriate, and reset the game.
  case OBSTACLE:
  case WEBCAM_MODE:
    if (menu.selection == State.NONE ) {
      //Checks when the game is over
      if (!gameOver.gameDone) {
        background(153, 51, 0); 
        image(scoremenu, 625, height/2);
        scoremenu.resize(160, 805);
        double deltaTime  = times.getElapsedTime();
        S4P.updateSprites(deltaTime);
        S4P.drawSprites();
        avatar.setFrameSequence(1, 0, .01);

        //Loop all the functions
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

        for (int i = 0; i < invisibility.length; i++) {

          invisibility[i].update();
          invisibility[i].display();
          invisibility[i].collected(car);
          invisibility[i].follow(car);
          invisibility[i].activate();
          car.shield(gameOver, invisibility[i]);
        }
        //Displays the car
        car.display(menu);
        car.track(menu);
        if (gameOver.gameDone) {
          state = State.GAME_OVER;
        }
      }
    }
    break;
  case GAME_OVER:
    //When the game is over the game over screen displays
    gameOver.update();      
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
  case GAME_OVER:
    break;

    //Switch lanes with left and right
    //Honk your horn with the Z key
  case OBSTACLE:
  case WEBCAM_MODE:
    if (keyCode == LEFT) {
      car.switchLanesLeft(menu);
    }
    if (keyCode == RIGHT) {
      car.switchLanesRight(menu);
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
  case WEBCAM_MODE:
    break;
  case GAME_OVER:
    break;
  }
}