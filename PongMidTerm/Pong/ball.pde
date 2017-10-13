

class Ball {
//Registers the game ending at 10 points.
  int gameWin=10;
//image for the ball
  PImage imgb;
  //speeds up throughout the game
 float incV=.2;

  int SPEED = 10;
  int SIZE = 16;
  //Player scores
  int p1Score=0;
  int p2Score=0;

  int x;
  int y;

 
  float vx;
  float vy;


  color ballColor = color(255);

  Ball(int _x,int  _y) {
    x = _x;
    y = _y;
    vx = SPEED;
    vy = SPEED;
   
  }

/*if (keyPressed) {
      if (key=='s') {
    ball.x += ball.vx+ball.incXY;
    ball.y += ball.vy+ball.incXY;
      }

      
    }*/

  void update() {

    x += vx;
    y += vy;
    



    if (y - SIZE/2 < 0 || y + SIZE/2 > height) {
       vy = -vy;
    } 
    if (x - SIZE/2 < 15 || x + SIZE/2 > width-15 ) {
    
      vx = -vx;
    }
  }

  void collide(Paddle paddle) {
 //registers what happens when the ball collides with either side of the paddle. 
 //Changed so that the ball can register which paddle it hits, not either or. 
 //For example, if it hits the left paddle, the ball will reset
    boolean insideLeft = (x + SIZE/2 > leftPaddle.x - paddle.WIDTH/2);
    boolean insideRight = (x - SIZE/2 < leftPaddle.x + paddle.WIDTH/2);
    boolean insideTop = (y + SIZE/2 > leftPaddle.y - paddle.HEIGHT/2);
    boolean insideBottom = (y - SIZE/2 < leftPaddle.y + paddle.HEIGHT/2);
    boolean insideLeftR = (x + SIZE/2 > rightPaddle.x - paddle.WIDTH/2);
    boolean insideRightR = (x - SIZE/2 < rightPaddle.x + paddle.WIDTH/2);
    boolean insideTopR = (y + SIZE/2 > rightPaddle.y - paddle.HEIGHT/2);
    boolean insideBottomR = (y - SIZE/2 < rightPaddle.y + paddle.HEIGHT/2);

    if (insideLeft && insideRight && insideTop && insideBottom) {

      if (vx < 0) {
        x = paddle.x + paddle.WIDTH/2 + SIZE/2;
      } else if (vx > 0) {
        x = paddle.x - paddle.WIDTH/2 - SIZE/2;
      }
      x = width/2;
      y = height/2;
    }
    if (insideLeftR && insideRightR && insideTopR && insideBottomR) {
      if (vx < 0) {
        x = paddle.x + paddle.WIDTH/2 + SIZE/2;
      } else if (vx > 0) {
        x = paddle.x - paddle.WIDTH/2 - SIZE/2;
      }
      x = width/2;
      y = height/2;
    }
    if (insideLeft && insideRight && insideTop && insideBottom) {
      p1Score = p1Score + 1;
    }
    if (insideLeftR && insideRightR && insideTopR && insideBottomR) {
      p2Score = p2Score + 1;
    }
  }

  void reset() {
    
    x = width/2;
    y = height/2;
  }


  void whoWins() {  
    if (p1Score >= gameWin || p2Score >= gameWin) {
      textSize(30);

      if (p1Score > p2Score) {
        fill(0, 255, 0, 180);
        text("Player 1 Wins", 120, 110); 
        vx=0;
        vy=0;
      }
      if (p2Score > p1Score) {
        fill(0, 255, 0, 180);
        text("Player 2 Wins", 320, 110); 
        vx=0;
        vy=0;
      }
    }
  } 
  void display() {
    noStroke();
    fill(0);
    rectMode(CENTER);


    textSize(100);
    fill(255, 0, 0);
    text(p1Score, 180, 80);
    text(p2Score, 400, 80);

    ellipse(x, y, SIZE, SIZE);
  }
}