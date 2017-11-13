import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import processing.sound.*;

SoundFile tone;
SoundFile tone2;
SoundFile tone3;
SoundFile tone4;
SoundFile tone5;
SoundFile tone6;

Bouncer[] bouncers = new Bouncer[10];

void setup() {
  size(800,800);
  
  //Load a sound by creating a new SoundFile and giving it the path to the file
  tone  = new SoundFile(this, "tone01.wav");
  tone2 = new SoundFile(this, "tone02.wav");
  tone3 = new SoundFile(this, "tone03.wav");
  tone4 = new SoundFile(this, "tone04.wav");
  tone5 = new SoundFile(this, "tone05.wav");
  tone6 = new SoundFile(this, "kick.wav");
   for (int i = 0; i < bouncers.length; i++) {
    // Each Bouncer just starts with random values 
    bouncers[i] = new Bouncer(random(0,width-5),random(0,height-5),random(-10,10),random(-10,10),random(20,50));
 }
}
void draw() {
    background(0);
   for (int i = 0; i < bouncers.length; i++) {
   bouncers[i].update();
   bouncers[i].display();
   bouncers[i].jingle();
  }
}


  