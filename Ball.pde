/* Ball Class by Ana de Mesquita
 *  Implements a ball suitable for Pong
 */
class Ball {
  // Attributes, Class variables/Instance variables 
  float xLoc;  //x location (coordinate) for the center of logo
  float yLoc;  //y location for the center of the logo
  float diam;  // diameter of the logo
  float rad; //Radius is half the diameter
  float xVel; // Velocity of the logo in the X dimension
  float yVel; //Velocity of the logo in the Y dimension
  float accel;//Acceleration of the ball
  float oHue; //Hue value of the outer cirle of the logo
  float iHue; //Hue value of the inner circle of the logo

  //Constructor for the Ball Class
  //Parameters xV and yV initialize xVel and yVel
  Ball(float xV, float yV, float dia) {
    xLoc = width/2;  //Start logo at the center of the window
    yLoc = height/2;
    xVel = xV;  // Start moving to the right
    yVel = yV; // Start moving up a little faster
    accel = 1.001;
    diam = dia;  //Set logo's diameter
    rad = diam/2;
    oHue = random(0,255);  //Hue values of the outter
    iHue = random(0,255);  //Hue values of the inner
  }
  
  //Methods for the Ball class
  //code to move the logo each frame of the animation
  //Parameter is the paddle object, needed for collision detection
  //Returns true if is not over (play on), false if game is over
  boolean move(Paddle pad) {
    xVel = xVel * accel;
    xLoc = xLoc + xVel;         //Move in x dimension
    if (xLoc + rad > width) {   //Bounce off of right wall
      xVel = xVel * -1;         //Change direction
    } else if(pad.collide(this)){
      xVel = xVel * -1;
    }else if (xLoc - rad < 0) {
      return false;
    }

    yLoc = yLoc + yVel;
    if (yLoc + rad > height) {  //Bounce off of floor
      yVel = yVel * - 1;
    } else if (yLoc - rad< 0) {  //Bounde off of ceiling
      yVel = yVel * -1;
    }
    return true;                 //If the game is not over returns true
  }
  //Display loo at xoc, yLoc
  void display() {

    strokeWeight(5);
    stroke(0);
    oHue++;
    if (oHue > 255) {
      oHue = 0;
    }
    fill(oHue, 255, 255);
    ellipse(xLoc, yLoc, diam, diam);       //Draw big green circle
    line(xLoc-rad, yLoc, xLoc+rad, yLoc);  //Draw the crossers
    line(xLoc, yLoc-rad, xLoc, yLoc+rad);

    iHue--;
    if (iHue < 0) {
      iHue=255;
    }
    fill(iHue, 255, 255);
    ellipse(xLoc, yLoc, rad, rad);          //Draw the sall purple circle
  }
}