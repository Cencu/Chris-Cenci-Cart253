
class Score {
//Timer on the screen, 60 seconds
  String time = "05";
  int t;
  int interval = 05; 
  int x;
  int y;
  int point = 0;
  Score(int _x, int _y) {
    x = _x;
    y = _y;
  }    


  void display(Moles moles) {
    //Subtracts the time integer, which is 60, by milliseconds, which are 1000, 1000 milliseconds are 1 second.
    t = interval-int(millis()/1000);
    //Number of numbers displayed, just two.
    time = nf(t, 2);
    //If the timer gets to zero, the game ends, it prints in game over and all the moles "disappear"
    if (t == 0) {
      println("GAME OVER");
      moles.moleSize = 0;
      t = constrain(t, 0,0);
    }
    fill(0,0,255);
    text(time, width/2, 50);
  }
}