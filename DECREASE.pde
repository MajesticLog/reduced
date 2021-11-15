/*

 Decreasing circle
 Zoe Caudron
 Using for loops to draw circles that decrease in radius and resolution
 No interaction or animation
 
 */


//--------------------------------------------------------- GLOBAL VARIABLES -----------------------------------------------------------------

float f=0.0;
float r=0;      // rotation angle
int res=360;    // resolution of the circles
float stp=1.0;  // step to decrease resolution
float mX, mY;   // positions of the shapes
int step;       // number of circles we want
int s;          // size of each circle

//--------------------------------------------------------------- SETUP ----------------------------------------------------------------------


void setup() {
  size(800, 800);
  background(0);
}

//---------------------------------------------------------------- DRAW ----------------------------------------------------------------------

void draw() {



  step=width/10; // how many circles we want
  s=step;        // size of the sides

  for (int x=s/2; x<=width-s/2; x+=step) {  // x=s/2 as we are drawing from the circle's center
    r++;  // increment rotation angle
    for (int y=step/2; y<=height; y+=step) {

      push();  
      noFill();
      stroke(255);
      translate(2*x, 2*y);                 // to have enough space in between shapes
      beginShape();                        // instead of using circle(), we're drawing them using vertices
      for (int i=0; i<res; i+=stp) {       // incrementing step decreases the circle's resolution
        mX=sin(radians(i))*s;
        mY=cos(radians(i))*s;
        vertex(mX, mY);                    // trigonometry! This draws each vertex around a circle
      }
      stp+=3.5;                            // arbitrary increase for maximum effect
      endShape(CLOSE);
      pop();
      s--;                                 // reduce size at each loop
    }
  }
}
