//CHANGES added a "splitscreen version" where two people can play at the same time, one on the bottom and one at the top.

color backgroundColor = color(0);

int numStatic = 10;//number of static particles on the screen
int staticSizeMin = 1;//static sizes in the background
int staticSizeMax = 9;
color staticColor = color(200);

float r;//Color variables
float g;
float b;

int paddleX;
int paddleY;
int paddleVX;
int paddleSpeed = 10;//speed of the paddle 
int paddleWidth = 128;//size of the paddle
int paddleHeight = 16;
color paddleColor = color(200);


int ballX;
int ballY;
int ballVX;
int ballVY;
int ballSpeed = 5;
int ballSize = 16;
color ballColor = color(255);



//All the code with "two" at the end of it signifies the second game of pong.
color backgroundColorTwo = color(0);


int numStaticTwo = 1000;
int staticSizeMinTwo = 1;
int staticSizeMaxTwo = 3;
color staticColorTwo = color(200);

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
  paddleX = width/2;//paddle location at start;
  paddleY = height - paddleHeight;//CHANGE?
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
  ballX = width/2;
  ballY = height/2;
  ballVX = ballSpeed;
  ballVY = ballSpeed;
}
//Variableslisted 
void draw() {
  background(backgroundColor);

  drawStatic();

  updatePaddle();
  updateBall();
  drawPaddle();
  drawBall();
  
   drawStaticTwo();

  updatePaddleTwo();
  updateBallTwo();

  drawPaddleTwo();
  drawBallTwo();
}
//the command for the static in the background, controls the location, set to random. 
//
//CHANGED to the static being different colors
void drawStatic() {
  for (int i = 0; i < numStatic; i++) {
   float x = random(0,width);
   float y = random(0,height);
   float staticSize = random(staticSizeMin,staticSizeMax);
  fill(r,g,b);
   rect(x,y,staticSize,staticSize);
  }
}

void drawStaticTwo() {
  for (int i = 0; i < numStaticTwo; i++) {
   float x = random(0,width);
   float y = random(0,height);
   float staticSizeTwo = random(staticSizeMinTwo,staticSizeMaxTwo);
   fill(r,g,b);
   rect(x,y,staticSizeTwo,staticSizeTwo);
  }
}

//constrains the paddle to the screen
void updatePaddle() {
  paddleX += paddleVX;  
  paddleX = constrain(paddleX,0+paddleWidth/2,width-paddleWidth/2);
}

void updatePaddleTwo() {
  paddleXTwo += paddleVXTwo;  
  paddleXTwo = constrain(paddleXTwo,0+paddleWidthTwo/2,width-paddleWidthTwo/2);
}
//Includes more variables, sets the ball's movement.
//
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
  
  handleBallHitPaddleTwo();
  handleBallHitWallTwo();
  handleBallOffBottomTwo();
}

//draws the paddle onto the screen 
void drawPaddle() {
  rectMode(CENTER);
  noStroke();
   fill(r,g,b);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
  
}

void drawPaddleTwo() {
  rectMode(CENTER);
  noStroke();
  fill(r,g,b);
  rect(paddleXTwo, paddleYTwo, paddleWidthTwo, paddleHeightTwo);
}

//draws the ball onto the screen, CHANGE 
void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(#ff0000);
  rect(ballX, ballY, ballSize, ballSize);  
}

void drawBallTwo() {
  rectMode(CENTER);
  noStroke();
  fill(r,b,g);
  rect(ballXTwo, ballYTwo, ballSizeTwo, ballSizeTwo);
  
}
//If the ball hits the paddle, 
void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;
  }
  
}

void handleBallHitPaddleTwo() {
  if (ballOverlapsPaddleTwo()) {
    ballYTwo = paddleYTwo - paddleHeightTwo - ballSizeTwo/2;
    ballVYTwo = -ballVYTwo;
  }
}

boolean ballOverlapsPaddle() {
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
    if (ballY > paddleY - paddleHeight/2) {
      return true;
    }
  }
  return false;
}

boolean ballOverlapsPaddleTwo() {
  if (ballXTwo - ballSizeTwo/2 > paddleXTwo - paddleWidthTwo/2 && ballXTwo + ballSizeTwo/2 < paddleXTwo + paddleWidthTwo/2) {
    if (ballYTwo > paddleYTwo - paddleHeightTwo/2) {
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

boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
}

boolean ballOffBottomTwo() {
  return (ballYTwo - ballSizeTwo/2 > height/2);
}

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
//Controls the ball so that it doesnt go off the screen of the Y axis, bounces in a diagonal direction. 
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
     fill(r,g,b);
    r=random(255);
    g=random(255);
    b=random(255);

  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
     fill(r,g,b);
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