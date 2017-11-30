class Menu {
State selection = State.NONE;
  Menu() {
  }
  void update() {
   display(); 
  }
  
  void display() {
   background(0);
    textAlign(CENTER, CENTER);
    textSize(32);
    text("TRAFFIC", width/2, 50);
    text("HATER", width/2, 100); 
    textAlign(CENTER,CENTER);
    text("(R)egular Mode", width/2,height/2);
    text("(W)ebcam Mode", width/2,height/3);
  }
  void keyPressed() {
   if (key == 'r' || key == 'R') {
     selection = State.REGULAR_TRAFFIC; 
  } else if (key == 'w" || key == 'W') {
   selection = State.WEBCOME_TRAFFIC 
  }
}