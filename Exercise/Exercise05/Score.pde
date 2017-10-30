
class Score {

  String time = "010";
  int t;
  int interval = 10; 
  void display() {
    t = interval-int(millis()/1000);
    time = nf(t, 3);
    if (t == 0) {
      println("GAME OVER");
      interval+=10;
    }

    text(time, width/2, height/2);
  }
}