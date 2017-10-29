//Whack a mole

int moleSize = 25;

int x = 0;
int y = 0; 

Moles[] moles = new Moles[20];


void setup () {
  size(1020, 600); 

  for (int i = 0; i < moles.length; i++) {
    int x = floor(random(0, width/moleSize));
    int y = floor(random(0,height/moleSize));
    
    moles[i] = new Moles(x * moleSize, y * moleSize, moleSize);
  }
}

void draw() {
  background(0); 
  
  for (int i = 0; i < moles.length; i++) {
  
 moles[i].display();
 moles[i].update();
  }
}