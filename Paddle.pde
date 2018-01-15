/* Paddle Class by Ana de Mesquita
 *  Implements a paddle suitable for Pong
 */
class Paddle {
  //Attributes
  float xLoc;        //X and Y locations
  float yLoc;
    float halfLeng;  //Half the length of the paddle

  //Constructor
  Paddle() {
    xLoc = 10;       //Always 10 pixels right of left
    yLoc = height/2;
    halfLeng = 30;   //Total length of paddle is 60 (30 * 2)
  }

  //Methods
  void move() {
    yLoc = mouseY;
  }

  boolean collide(Ball b) {  
    if (b.xLoc < this.xLoc + b.rad &&  //Ball close enought ot padle
    b.yLoc > this.yLoc - halfLeng &&   //Ball bellow the upper end of paddle
    b.yLoc < this.yLoc + halfLeng) {   //Ball bellow the lower enf of paddle
      return true;
    } else {
      return false;
    }
  }

  void display() {
    strokeWeight(10);
    stroke(150,255,175);
    line(xLoc, yLoc-halfLeng, xLoc, yLoc+halfLeng);
  }
}