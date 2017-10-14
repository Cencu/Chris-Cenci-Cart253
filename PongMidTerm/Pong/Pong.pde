//Welcome to dodgePongBall!
//Each player starts with 10 lives.
//The objective of the game is to avoid the ball, opposite of what pong is supposed to be.
//

//Images for the ball and background
PImage img;
PImage imgb;
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;


int PADDLE_INSET = 40;

color backgroundColor = color(0);



void setup() {
  size(640, 480);
  frameRate(60);
  //loads the image onto the screen
  img = loadImage("midterm.png");
  
//Changed the controls.
  leftPaddle = new Paddle(PADDLE_INSET, height/2, 'w', 's');
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, 'o', 'l');

  ball = new Ball(width/2, height/2);
}


void draw() {
  background(backgroundColor);
  image(img, 0, 0);

  leftPaddle.update();
  rightPaddle.update();


  ball.update();

  ball.collide(leftPaddle);
  ball.collide(rightPaddle);
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