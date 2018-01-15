/* Pong game by Ana de Mesquita
 * Implements a single-player pong-like game
 * Uses a paddle class and a ball class.
 * background image by freepik avaliable at "https://www.freepik.com/free-vector/video-game-scene-with-a-dragon_950615.htm"
 */
Ball b;              //Ball object
Paddle pad;          //Paddle object
boolean playOn;      //value is true if still playing and false if game is over
int score;           //Score display at the end of game
PImage bg;           //Holds background image
PFont fnt;           //Holds font

void setup() {
  size(500, 500);               //Make the window 5000 x 500
  colorMode(HSB);               //Use Hue/Saturation/Brightness color mode
  //background(255);            // White background
  bg = loadImage("fundo.jpg");  //Loads background image
  playOn = true;
  score = 0;
  fnt = createFont("Arial Black", 18);

  b = new Ball (2, -3, 50);
  pad = new Paddle();
}

void draw() {
  //background(255);
  background(bg);

  if (playOn) {
    if (b.move(pad)) {
      pad.move();
      pad.display();
      b.display();
    } else {
      playOn = false;
      score = frameCount;
    }
  } else {
    fill(0, 0, 255);
    textFont(fnt);
    textSize(32);

    text("Game Over!\nScore = " + score, 140, 200);
  }
}