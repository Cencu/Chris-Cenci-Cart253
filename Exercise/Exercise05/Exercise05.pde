//Whack a mole
//The objective of the game is to whack the moles that move on the screen
//Each mole is worth 1 point
int point;
int moleSize = 25;
//image of the moles
PImage img, img2;
int x = 0;
int y = 0; 
//Class to display the timer
Score score = new Score(width/2, height-20);
//MAYBE gold mole, worth 3 points
float goldMole = random(0, 1);
color  specialColor = color(252, 136, 12);
//Array of moles, 20 are displayed on the screen
Moles[] moles = new Moles[20];
void setup () {
  size(1020, 600); 
  point = 0;
  //Checks all the moles, increments them
  for (int i = 0; i < moles.length; i++) {
    //Makes the moles spawn onto the screen in a random location, instead of lumped together 
    int x = floor(random(0, height));
    int y = floor(random(0, width));
    //displays the moles onto the screen
    moles[i] = new Moles(x*moleSize, y*moleSize, moleSize);
  }
}

void draw() {
  background(0); 

  for (int i = 0; i < moles.length; i++) {
    moles[i].whacked();
    moles[i].update();
    moles[i].display();
    moles[i].whacked();
    score.display(moles[i]);
  }
}