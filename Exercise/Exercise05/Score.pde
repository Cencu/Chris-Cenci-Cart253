
class Score {

  String time = "12";
  int t;
  int interval = 12; 
  int x;
  int y;
  int point = 0;
  Score(int _x, int _y) {
   x = _x;
   y = _y;
  }    
  void points(Moles moles) {
    if(mouseX > moles.x-moles.moleSize && mouseX< moles.x +moles.moleSize && mouseY > moles.y - moles.moleSize
    && mouseY < moles.y + moles.moleSize && mousePressed) {
    point = point + 1;
    }
  }
    
  void display() {
    t = interval-int(millis()/1200);
    time = nf(t, 3);
    if (t == 0) {
      println("GAME OVER");
      return;
    }
    text(point, width/4, 20);
    text(time, width/2, 20);
  }
}