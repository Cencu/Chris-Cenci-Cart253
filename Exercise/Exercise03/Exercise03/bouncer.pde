class Bouncer {
  
 int x;
 int y;
 int vx;
 int vy;
 int size;
 color fillColor;
 color defaultColor;
 color hoverColor;
 int r;
 int b;
 int g;

 
 Bouncer(int tempX, int tempY, int tempVX, int tempVY, int tempSize, color tempDefaultColor, color tempHoverColor) {
   x = tempX;
   y = tempY;
   vx = tempVX;
   vy = tempVY;
   size = tempSize;
   defaultColor = tempDefaultColor;
   hoverColor = tempHoverColor;
   fillColor = defaultColor;
   r=(255);
   b=(255);
   g=(255);
 }
 
 void update() {
   x += vx;
   y += vy;

   handleBounce();
   handleMouse();
 }
 
 void handleBounce() {
//Added, if the mouse is on the right side of the screen, then the cirlces grow, limited to 150px. If it is on the left side of the screen, then they shrink. 
   if (mouseX > width/2) {
     size=size+2;
   }
   if (size > 200) {
     size=size-5;
   }
   if (mouseX < width/2) {
     size=size-2;
   }
   if (size <10) {
     size=size+5;
   }
// Up to here is the code I added

//these codes change the velocity of the cirlces when they touch height and width, the cirlces velocities will go in opposite directions if the boolean is true. 
   if (x - size/2 < 0 || x + size/2 > width) {
    vx = -vx; 
   }
   
   if (y - size/2 < 0 || y + size/2 > height) {
     vy = -vy;
   }
//Constrains the cirlces to the screen so they dont go off.
   x = constrain(x,size/2,width-size/2);
   y = constrain(y,size/2,height-size/2);
  
 }
 //when the mouse hovers over the cirlce it changes color
 void handleMouse() {
   if (dist(mouseX,mouseY,x,y) < size/2) {
    fillColor = hoverColor; 
   }
   else {
     fillColor = defaultColor;
   }
 }
 
 void draw() {
   noStroke();
   fill(fillColor);
   ellipse(x,y,size,size);
 }
}