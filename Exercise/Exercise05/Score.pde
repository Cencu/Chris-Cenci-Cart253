
class Score {

  String time = "120";
  int t;
  int interval = 120; 
  int x;
  int y;
  
  Score(int _x, int _y) {
   x = _x;
   y = _y;
  }    
  
  void display() {
    t = interval-int(millis()/1200);
    time = nf(t, 3);
    if (t == 0) {
      println("GAME OVER");
      interval+=120;
    }

    text(time, width/2, 20);
  }
}