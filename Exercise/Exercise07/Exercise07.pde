import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import processing.sound.*;

SoundFile tone;
Bouncer[] bouncers = new Bouncer[10];

void setup() {
  // We load a sound by creating a new SoundFile and giving it the path to the file
  // Notice that sound file is in a subfolder called "sounds" - that's organised!
  tone = new SoundFile(this, "tone01.wav");
}
void draw() {
  // Nothin'
}
void mouseClicked() {
  // We play our sound with... play()
  tone.play();
}