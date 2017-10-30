//Whack a mole

int moleSize = 25;
PImage img;
int x = 0;
int y = 0; 
 Score score = new Score(width/2,height-20);

float goldMole = random(0,1);
  color  specialColor = color(252, 136, 12);

Moles[] moles = new Moles[20];
void setup () {
  size(1020, 600); 
img = loadImage("mole.jpg");
  for (int i = 0; i < moles.length; i++) {
    int x = floor(random(0, width/moleSize));
    int y = floor(random(0,height/moleSize));

    moles[i] = new Moles(x*moleSize, y*moleSize, moleSize);
    

  }
}

void draw() {
  background(0); 
  
  for (int i = 0; i < moles.length; i++) {

 moles[i].display();
 moles[i].update();
 moles[i].whacked();
 score.display();
// score.points(moles);
  }
  
}