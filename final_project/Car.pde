class Car {
  //Variables for the car
  float x = 157;
  float y = 600;
  float sizeX = 40;
  float sizeY = 80;
  //Car image
  PImage redCar;
  //Boolean to detect if the obstacle has "slipped"
  //in oil
  boolean slipped = false;
  //Used for the powerups
  float c;
  float p;
  //Checks if the car is still on the screen
  boolean alive = true;
  //Checks for the reddest object on the webcam, then tracks it
  color trackColor = color (255, 0, 0);
  float trackX = 0;
  float trackY = 0;

  //Car constructor
  Car(float tempX, float tempY, float tempSizeX, float tempSizeY) {
    x = tempX;
    y = tempY;
    sizeX = tempSizeX;
    sizeY = tempSizeY;
    redCar = loadImage("cars1.png");
  }

  //If the left key is pressed, then the car will move on the x axis by 100 pixels, like it
  //Is switching lanes
  //when slipped is true, the boolean stops you from switching lanes, like there is no more grip on the car
  //See oilspill void below.
  //If the webcam is on, the car will have no need to switch lanes
  void switchLanesLeft(Menu menu) {
    if (!slipped) {
      if (!menu.vidstart) {

        x-=100;
      }
    } 
    if (slipped) {
      x +=0;
    }
  }
  //Same as code above, but moves right
  void switchLanesRight(Menu menu) {
    if  (!slipped) {
      if (!menu.vidstart) {
        x+=100;
      }
    } 
    if (slipped) {
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
    //When the booleans are true, then alive becomes false
    if (left && right &&top && bottom && obstacle.sizeX > 0 && obstacle.sizeY > 0) {
      alive = false;
      println(alive);
    }
  }
  //Check the collision for trucks as well
  void accidentTruck (Obstacle truck) {
    boolean leftT = (x + sizeX/2 > truck.x - truck.sizeX/2);
    boolean rightT = (x - sizeX/2 < truck.x + truck.sizeX/2);
    boolean topT = (y + sizeY/2 > truck.y - truck.sizeY/2);
    boolean bottomT = (y - sizeY/2 < truck.y + truck.sizeY/2);

    if (leftT && rightT &&topT && bottomT && truck.sizeX > 0 && truck.sizeY > 0) {
      alive = false;
    }
  }
  //This is where alive gets called, when you have no shield and collide with another car, then you lose. 
  void shield(GameOver gameOver, Invisibility invisibility ) {
    if (!alive && !invisibility.shield) {
      sizeX = 0;
      sizeY = 0;
      gameOver.gameDone = true;
      println(gameOver.gameDone);
      crashed.play();
    }
  }
  //Checks the same as above, if the car comes into contact with oil, then the boolean will turn true
  //What this obstacle does is stops you from changing lanes for a short time
  void oilspill(Obstacle oil) {
    boolean left = (x + sizeX/2 > oil.x - oil.sizeX/2);
    boolean right = (x - sizeX/2 < oil.x + oil.sizeX/2);
    boolean top = (y + sizeY/2 > oil.y - oil.sizeY/2);
    boolean bottom = (y - sizeY/2 < oil.y + oil.sizeY/2);

    if (left && right &&top && bottom) {
      slipped = true;
    }
  }
  //Once the oilspill is ofscreen, then slipped goes back to false, so that you can change lanes again
  void oilreset(Obstacle oil) {
    if (slipped && oil.y > height+100) {
      slipped = false;
    }
  }

  //Checks if the webcam option has been chosen
  //If it has, then the car will no longer move with left and right keys but tracking the reddest pixel
  void track(Menu menu) {
    if (menu.vidstart) {
      //radius to detect changes
      float record = 1000;
      //The for loop keeps on re-checking the width and height of the screen for any
      //changes
      for (int x = 1; x < video.width; x++) {
        for (int y = 0; y < video.height; y++) {
          int loc = x+y *640;
          //The floats are equal to the location of the pixels. They are tracking red, so the float amount will follow changes in red motion. 
          color pixelColor = video.pixels[loc];
          float r1 = red(pixelColor);
          float g1 = green(pixelColor);
          float b1 = blue(pixelColor);
          float r2 = red(trackColor);
          float g2 = green(trackColor);
          float b2 = blue(trackColor);
          //compares the current color with the color being tracked
          float amount = dist(r1, g1, b1, r2, g2, b2);
          //If the current color being tracked is less than the recorded color which is red, then 
          //it tracks its location.
          if (amount < record) {
            record = amount;
            trackX = x;
            trackY = y;
          }
        }
      }
    }
  }


  //Displays the car as a car image, starting in the second lane
  void display(Menu menu) {
    //Constrains the car the the screen so it doesnt go off when switching lanes
    x= constrain(x, 50, 450);
    //c = y is made so you can "trick" the rocket and shield/invisibility into thinking that it is following the car
    //When the rocket is used, it uses the X and Y location to launch from, however, when setting the speed of the rocket to launch, the car would
    //Also launch. By putting c = y, the car stays in place but the rocket still launches
    p = x;
    c = y;
    if (menu.vidstart) {
      x = trackX;
      y = trackY;
    } else {
      //since the webcam only captures Y = 480, when the webcam option is not selected, the car will revert back to its original position
      y = 600;
    }
    noStroke();
    fill(255, 0, 0);
    imageMode(CENTER);
      avatar.setXY(x, y);
    //image(redCar, x, y, sizeX, sizeY);
  }
}