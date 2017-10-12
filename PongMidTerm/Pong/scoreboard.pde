
class Score {

 int p1Score=0;
 int p2Score=0;
 int gameWin=10;
 boolean keypress = false;
  boolean endgame = false;
 
 void display(Ball ball) {
   
   
if(ball.x >= width-20) {
    p1Score = p1Score + 1;
}
    
    if(ball.x <= 20) {
    p2Score = p2Score + 1;

  }

 
     textSize(100);
  fill(255,0,0);
  text(p1Score,220,70);
  text(p2Score,350,70);
 }
 void whoWins() {  //display on screen who wins and who loses.
  if (p1Score >= gameWin || p2Score >= gameWin) {
    textSize(30);

    if (p1Score > p2Score) {
      fill(0, 255, 0, 180);
      text("Player 1 Wins", width/4-80, 50); 
     
    } 
    
  }
}
  
}