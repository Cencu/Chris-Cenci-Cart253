//Welcome to dodgePongBall!
//Each player starts with 10 lives.
//The objective of the game is to avoid the ball, opposite of what pong is supposed to be.
//Click to start game
//Starts the game
boolean start = false;
//Background Image
PImage img;

Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;

float SPEED = 8;


int PADDLE_INSET = 40;




void setup() {
  size(640, 480);
  //loads the background image onto the screen
  img = loadImage("midterm.png");


  //Changed the controls. W,S and O,L
  leftPaddle = new Paddle(PADDLE_INSET, height/2, 'w', 's');
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, 'o', 'l');

  ball = new Ball(width/2, height/2);
}
//If the mouse is pressed, the game will start, or the velocities will be able to function.
void mouseClicked() {
  start=!start;
}
void draw() {
  background(img);
  //This if statement registers if the start function above was called. 
  if (start) {

    ball.x += ball.vx;
    ball.y += ball.vy;
// If the ball is less than half the width, then the verlocity of the X axix will increase
     if (ball.x <= width/2) {
     ball.x += ball.vx++; 
// If not it will decrease if its greater than half the width. 
    } else if ( ball.x >= width/2) {
     ball.x += ball.vx--; 
    }
  }


  leftPaddle.update();
  rightPaddle.update();


  ball.update();
  ball.collide(leftPaddle);
  ball.collide(rightPaddle);
  ball.outOfScreen();
  rectMode(CORNER);
  //Borders on the left and right side
  rect(0, 0, 20, 640);
  rect(620, 0, 20, 540);

  leftPaddle.display();
  rightPaddle.display();
  ball.display();
  //activates when a player reaches 10 points
  ball.whoWins();
}

void keyPressed() {
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
}


void keyReleased() {
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}