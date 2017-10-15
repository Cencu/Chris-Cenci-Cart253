

class Ball {
  //Registers the game ending at 0 points.
  //The game works on a system of "lives" 
  int gameWin=0;
  //image for the ball
  PImage imgb;
  //speeds up throughout the game
  int incV=1/2;
  float SPEED = 5.0;
  int SIZE = 16;
  //Player lives, each team starts with 10. 
  int p1Score=10;
  int p2Score=10;

  int x;
  int y;


  float vx;
  float vy;

  boolean start = false;


  color ballColor = color(255);

  Ball(int _x, int  _y) {
    x = _x;
    y = _y;
    vx = SPEED;
    vy = SPEED;
  }


  void update() {


    if (y - SIZE < 0 || y + SIZE > height) {

    float  vy= float -vy;
    } 
    if (x - SIZE < 15 || x + SIZE > width-15 ) {
      vx= -vx;
     
    }
    if (SIZE <=50) {
     constrain(SIZE,50,50); 
    }
   
  }
  
 

  void collide(Paddle paddle) {
    //registers what happens when the ball collides with either side of the paddle. 
    //Changed so that the ball can register which paddle it hits, not either or. 
    //When it was just paddle as the code, the score would count for both teams, now the opposite team gets the point. 
    boolean insideLeft = (x + SIZE/2 > leftPaddle.x - paddle.WIDTH/2);
    boolean insideRight = (x - SIZE/2 < leftPaddle.x + paddle.WIDTH/2);
    boolean insideTop = (y + SIZE/2 > leftPaddle.y - paddle.HEIGHT/2);
    boolean insideBottom = (y - SIZE/2 < leftPaddle.y + paddle.HEIGHT/2);
    boolean insideLeftR = (x + SIZE/2 > rightPaddle.x - paddle.WIDTH/2);
    boolean insideRightR = (x - SIZE/2 < rightPaddle.x + paddle.WIDTH/2);
    boolean insideTopR = (y + SIZE/2 > rightPaddle.y - paddle.HEIGHT/2);
    boolean insideBottomR = (y - SIZE/2 < rightPaddle.y + paddle.HEIGHT/2);
    //Resets the ball if paddle is touched. 
    if (insideLeft && insideRight && insideTop && insideBottom) {

      if (vx < 0) {
        x = paddle.x + paddle.WIDTH/2 + SIZE/2;
      } else if (vx > 0) {
        x = paddle.x - paddle.WIDTH/2 - SIZE/2;
      }
      x = width/2;
      y = height/2;
      SIZE=SIZE+2;
    }
    if (insideLeftR && insideRightR && insideTopR && insideBottomR) {
      if (vx < 0) {
        x = paddle.x + paddle.WIDTH/2 + SIZE/2;
      } else if (vx > 0) {
        x = paddle.x - paddle.WIDTH/2 - SIZE/2;
      }
      x = width/2;
      y = height/2;
      SIZE=SIZE+2;

    }
    //Adds a point to the team if the paddle is hit. 
    if (insideLeft && insideRight && insideTop && insideBottom) {
      p1Score = p1Score - 1;

    }
    if (insideLeftR && insideRightR && insideTopR && insideBottomR) {
      p2Score = p2Score - 1;


    }
  }

  void reset() {

    x = width/2;
    y = height/2;

  }

  //Displays who wins if team has no more lives
  void whoWins() {  
    if (p1Score <= gameWin || p2Score <= gameWin) {
      textSize(30);
      //Ball stops moving when a team reaches 0. 
      if (p1Score < p2Score) {
        fill(0, 255, 0, 180);
        text("Player 2 Wins", 120, 110); 
        vx=0;
        vy=0;
      }
      if (p2Score < p1Score) {
        fill(0, 255, 0, 180);
        text("Player 1 Wins", 320, 110); 
        vx=0;
        vy=0;
      }
    }
  } 
  void display() {
    noStroke();
    fill(0);
    ellipseMode(CENTER);

    //Text size, color and location
    textSize(100);
    fill(255, 0, 0);
    text(p1Score, 180, 80);
    text(p2Score, 400, 80);
imgb = loadImage("ball.png");
    ellipse(x, y, SIZE, SIZE);


   
  }

}