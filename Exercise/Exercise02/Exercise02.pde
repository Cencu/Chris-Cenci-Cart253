//CHANGES added a "splitscreen version" where two people can play at the same time, one on the bottom and one at the top.
//the left and right arrow keys control the color of the paddles, ball two and static. 
//The top paddle (paddleTwo) can now control the bottom ball.
color backgroundColor = color(0);

int numStatic = 100;//number of static particles on the screen
int staticSizeMin = 1;//static sizes in the background
int staticSizeMax = 9; //Maximum size of the static on the screen. 
color staticColor = color(200);

float r;//Color variables
float g;
float b;

int paddleX;//variable for the bottom paddle's X axis
int paddleY;//variable for the bottom paddle's Y axis
int paddleVX;//Paddle's velocity on the X axis, moving left and right, equal to the paddle speed. 
int paddleSpeed = 10;//speed of the paddle 
int paddleWidth = 128;//size of the paddle
int paddleHeight = 16;
color paddleColor = color(200);


int ballX;//variable for the ball's X axis 
int ballY;//Variable for the ball's Y axis 
int ballVX;//Variable for the balls velocity on the X axis, equal to ball speed
int ballVY;//Variable for the balls velocity on the Y axis, equal to ball speed
int ballSpeed = 5;
int ballSize = 16;
color ballColor = color(255);



//All the code with "two" at the end of it signifies the second game of pong.
color backgroundColorTwo = color(0);




int paddleXTwo;
int paddleYTwo;
int paddleVXTwo;
int paddleSpeedTwo = 10;
int paddleWidthTwo = 128;
int paddleHeightTwo = 16;
color paddleColorTwo = color(255);

int ballXTwo;
int ballYTwo;
int ballVXTwo;
int ballVYTwo;
int ballSpeedTwo = 5;
int ballSizeTwo = 16;
color ballColorTwo = color(255);


//Setup of the paddle and ball locations.
void setup() {
  size(640, 480);

  setupPaddle();
  setupBall();
  setupPaddleTwo();
  setupBallTwo();
}
//Paddles initial starting location
void setupPaddle() {
  paddleX = width/2;//paddle location at start
  paddleY = height - paddleHeight;// Height of the paddle at the start, starts at the bottom of the screen. 
  paddleVX = 0;
}

void setupPaddleTwo() {
  paddleXTwo = width/2;
  paddleYTwo = height/2 - paddleHeightTwo;
  paddleVXTwo = 0;
}

void setupBallTwo() {
  ballXTwo = width/4;
  ballYTwo = height;
  ballVXTwo = ballSpeedTwo;
  ballVYTwo = ballSpeedTwo;
}

//Balls' initial starting location, along with its variables such as speed
void setupBall() {
  //The ball starts in the middle of the screen 
  ballX = width/2;
  ballY = height/2;
  ballVX = ballSpeed;
  ballVY = ballSpeed;
}
//Variables listed so they can work in the screen. 
void draw() {
  background(backgroundColor);

  drawStatic();

  updatePaddle();
  updateBall();
  drawPaddle();
  drawBall();



  updatePaddleTwo();
  updateBallTwo();

  drawPaddleTwo();
  drawBallTwo();
}
//the command for the static in the background, controls the location, set to random. 
void drawStatic() {
  //if I is less then the number of static, then I increases by one. 
  for (int i = 0; i < numStatic; i++) {
    float x = random(0, width);
    float y = random(0, height);
    float staticSize = random(staticSizeMin, staticSizeMax);
    fill(r, g, b);
    rect(x, y, staticSize, staticSize);
  }
}


//constrains the paddle to the screen
void updatePaddle() {
  paddleX += paddleVX;  
  paddleX = constrain(paddleX, 0+paddleWidth/2, width-paddleWidth/2);
}

void updatePaddleTwo() {
  paddleXTwo += paddleVXTwo;  
  paddleXTwo = constrain(paddleXTwo, 0+paddleWidthTwo/2, width-paddleWidthTwo/2);
}
//Includes more variables, sets the ball's movement.
void updateBall() {
  ballX += ballVX;
  ballY += ballVY;

  handleBallHitPaddle();
  handleBallHitWall();
  handleBallOffBottom();
}

void updateBallTwo() {
  ballXTwo += ballVXTwo;
  ballYTwo += ballVYTwo;

  handleBallTwoHitPaddleTwo();
  handleBallHitWallTwo();
  handleBallOffBottomTwo();
}

//draws the paddle onto the screen 
void drawPaddle() {
  rectMode(CENTER);
  noStroke();
  fill(r, g, b);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
}

void drawPaddleTwo() {
  rectMode(CENTER);
  noStroke();
  fill(r, g, b);
  rect(paddleXTwo, paddleYTwo, paddleWidthTwo, paddleHeightTwo);
}

//draws the ball onto the screen,  
void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(#ff0000);
  rect(ballX, ballY, ballSize, ballSize);
}

void drawBallTwo() {
  rectMode(CENTER);
  noStroke();
  fill(r, b, g);
  rect(ballXTwo, ballYTwo, ballSizeTwo, ballSizeTwo);
}
//If the ball hits the paddle, then it changes its direction to opposite of where it was heading. 
void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;
  }
  if (ballOverlapsPaddleTwo()) {
    ballY = paddleYTwo - paddleHeightTwo/2 - ballSize/2;
    ballVY = -ballVY;
  }
}



void handleBallTwoHitPaddleTwo() {
  if (ballTwoOverlapsPaddleTwo()) {
    ballYTwo = paddleYTwo - paddleHeightTwo - ballSizeTwo/2;
    ballVYTwo = -ballVYTwo;
  }
}
//Registers that the ball hits the paddle and when it does it changes direction. 
boolean ballOverlapsPaddle() {
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
    if (ballY > paddleY - paddleHeight/2) {
      return true;
    }
  }
  return false;
}
// if 
boolean ballOverlapsPaddleTwo() {
  if (ballX - ballSize/2 > paddleXTwo - paddleWidthTwo/2 && ballX + ballSize/2 < paddleXTwo + paddleWidthTwo/2) {
    if (ballY > paddleYTwo - paddleHeightTwo/2 && ballY < paddleYTwo + paddleHeightTwo/2) {
      return true;
    }
  }
  return false;
}
//Registers the top paddle so that it can react with the bottom ball. 
boolean ballTwoOverlapsPaddleTwo() {
  if (ballXTwo - ballSizeTwo/2 > paddleXTwo - paddleWidthTwo/2 && ballXTwo + ballSizeTwo/2 < paddleXTwo + paddleWidthTwo/2) {
    if (ballYTwo > paddleYTwo - paddleHeightTwo/2 && ballYTwo < paddleYTwo + paddleHeightTwo/2) {
      return true;
    }
  }
  return false;
}
//Resets the ball if it falls off the screen. 
void handleBallOffBottom() {
  if (ballOffBottom()) {
    ballX = width/2;
    ballY = height/2;
  }
}

void handleBallOffBottomTwo() {
  if (ballOffBottomTwo()) {
    ballXTwo = width/2;
    ballYTwo = height/4;
  }
}
//If the ball goes off the screen, then the boolean returns the ball to its original location 
boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
}

boolean ballOffBottomTwo() {
  return (ballYTwo - ballSizeTwo/2 > height/2);
}

//Controls what the ball does when it hits the wall on the Y-axis. 
void handleBallHitWall() {
  if (ballX - ballSize/2 < 0) {
    ballX = 0 + ballSize/2;
    ballVX = -ballVX;
  } else if (ballX + ballSize/2 > width) {
    ballX = width - ballSize/2;
    ballVX = -ballVX;
  }

  if (ballY - ballSize/2 < 0) {
    ballY = 0 + ballSize/2;
    ballVY = -ballVY;
  }
}

void handleBallHitWallTwo() {
  if (ballXTwo - ballSizeTwo/2 < 0) {
    ballXTwo = 0 + ballSizeTwo/2;
    ballVXTwo = -ballVXTwo;
  } else if (ballXTwo + ballSizeTwo/2 > width) {
    ballXTwo = width - ballSizeTwo/2;
    ballVXTwo = -ballVXTwo;
  }

  if (ballYTwo - ballSizeTwo/2 < 0) {
    ballYTwo = 0 + ballSizeTwo/2;
    ballVYTwo = -ballVYTwo;
  }
}

//when the left or right keys are pressed, this piece of code moves the paddle. 
//New paddle moves with A and D now. 
void keyPressed() {
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
    fill(r, g, b);
    r=random(255);
    g=random(255);
    b=random(255);
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
    fill(r, g, b);
    r=random(255);
    g=random(255);
    b=random(255);
  }
  if (key == 'a') {
    paddleVXTwo = -paddleSpeedTwo;
  } else if (key == 'd') {
    paddleVXTwo = paddleSpeedTwo;
  }
}


//stops the paddle from moving after the key is released 
void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  }
  if (key == 'a' && paddleVXTwo < 0) {
    paddleVXTwo = 0;
  } else if (key == 'd' && paddleVXTwo > 0) {
    paddleVXTwo = 0;
  }
}