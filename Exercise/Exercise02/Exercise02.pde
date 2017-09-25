color backgroundColor = color(0);

float r;//Color variables
float g;
float b;
int numStatic = 10;//number of static particles on the screen
int staticSizeMin = 1;//static sizes in the background
int staticSizeMax = 9;
color staticColor = color(r,g,b);



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

void setup() {
  size(640, 480);
  
  setupPaddle();
  setupBall();
}
//Paddles initial starting location
void setupPaddle() {
  paddleX = width/2;//paddle location at start;
  paddleY = height - paddleHeight;//CHANGE?
  paddleVX = 0;
 
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
}
//the command for the static in the background 
//CHANGED to the static being different colors
void drawStatic() {
  for (int i = 0; i < numStatic; i++) {
   float x = random(0,width);
   float y = random(0,height);
   float staticSize = random(staticSizeMin,staticSizeMax);
   fill(r,g,b);
   r=random(200);
   g=random(200);
   b=random(200);
   rect(x,y,staticSize,staticSize);
  }
}
//constrains the paddle to the screen
void updatePaddle() {
  paddleX += paddleVX;  
  paddleX = constrain(paddleX,0+paddleWidth/2,width-paddleWidth/2);
}

void updateBall() {
  ballX += ballVX;
  ballY += ballVY;
  
  handleBallHitPaddle();
  handleBallHitWall();
  handleBallOffBottom();
}

void drawPaddle() {
  rectMode(CENTER);
  noStroke();
 
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
  
}

void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  rect(ballX, ballY, ballSize, ballSize);
}

void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;
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

void handleBallOffBottom() {
  if (ballOffBottom()) {
    ballX = width/2;
    ballY = height/2;
  }
}

boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
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
//when the left or right keys are pressed, this piece of code moves the paddle.
void keyPressed() {
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
  }
}
//stops the paddle from moving after the key is released 
void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  }
}