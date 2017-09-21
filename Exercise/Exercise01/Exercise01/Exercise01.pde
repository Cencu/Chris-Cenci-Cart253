//CHANGES: Changed the circle speed, now cirlces appear slower. Changed the background so that with every click it changes color. Changed the cirlce size when mouse is clicked. Changed the 
//color of the circles when the mouse hovers over then, set to random. Changed the circle colors every time the mouse is clicked. 

final int CIRCLE_SPEED = 4;//a type of variable which sets the amount of cirlces that will appear on the screen per frame, lowering the number will result in a lot more cirlces on the screen, but at a slower pace, a higher 
//number will place cirles at a faster rate, but spread out. CHANGED to 4 instead of 7
final color NO_CLICK_FILL_COLOR = color(250, 100, 100);//The type of variable which sets the color of the cirlce when the mouse is not pressed
final color CLICK_FILL_COLOR = color(100, 0, 250);//the color of the cirlce when the mouse is hovered over it 
final color BACKGROUND_COLOR = color(0, 150, 150);//the background color 
final color STROKE_COLOR = color(250, 150, 0);//The color of the line around the circle
 int CIRCLE_SIZE = 50;//size of the cirlce
float r; //labeled so that the colors randomize
float g; //These were set to float since r=random(255); does not work with int. 
float b;

int circleX;//variable name
int circleY;//variable name
int circleVX;//variable name
int circleVY;//variable name

void setup() {
  size(640, 480);
  circleX = width/2;//starting location of the X axis of the circle. The starting location of the X axis is 320px. Without /2, the ellipse would not move.
  circleY = height/2;//starting location of theY axis of the circle, which is 240px. 
  circleVX = CIRCLE_SPEED;//if the variable circleVY is placed anywhere, it whill have the value of the cirlce speed. 
  circleVY = CIRCLE_SPEED;
  stroke(STROKE_COLOR); //the line color around the circle,which is pink. 
  fill(NO_CLICK_FILL_COLOR);//the color of the cirlces regularily, whent the mouse is pressed they change to the background color.
  background(BACKGROUND_COLOR);//defines the color of the background
}

void draw() {
    if (dist(pmouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) { //if the distance of the mouse on the X and Y axis and of the ellipse based on the X and Y axis are less than half the circle size, then the ellipse changes color.
   fill(r,g,b);
      r=random(255); //selects a random color for the background. 
    g=random(255);
    b=random(255);
  }
  else {
    fill(r,g,b);//fills the circle when the mouse hovers over it with random colors
    
  }
  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE);//defines int circleX and circleY, the ellipses variables are that it starts at the center of the screen with a size of 50px*50px
  circleX += circleVX;//since circleVX is equal to circle speed, then the equation will equal to; half the width plus 3, so every circle will reappear at half the original PX location on the X axis. 
  circleY += circleVY;//since circleVX is equal to circle speed, then the equation will equal to; half the width plus 3, so every circle will reappear at half the original PX location on the Yaxis.
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) {//if circleX + half the ellipse size is greater than the width which is 640, or less than 640, then the ellipse will change direction 
  //on the X axis so it doesnt go off the screen. 
    circleVX = -circleVX;
    
  }
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) {//if circleY + half the ellipse size is greater than the height which is 480, or less than 480, then the ellipse will change direction 
  //on the Y axis so it doesnt go off the screen. 
    circleVY = -circleVY;
  }


}

void mousePressed() {//when the mouse is clicked, this code changes the background to different colors and the circle size to 25px. Holding it will keep the cirlce size to 25px.
 
  r=random(255); //selects a random color for the background. 
g=random(255);
b=random(255);
background(b,r,g);//CHANGED when the mouse is pressed, the background changed color. Placed in this order so it wont conflict with the changing colors of the cirlces
CIRCLE_SIZE =25;

}
void mouseReleased() {//when the mouse is released, the circle goes back to its original size
  CIRCLE_SIZE =50;
}