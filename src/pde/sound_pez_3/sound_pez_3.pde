import de.voidplus.leapmotion.*;


// vars
int BG_COLOR = 20;

LeapMotion leap;


// processing
void setup(){
  size(640, 360);
  background(BG_COLOR);

  // set leap to detect only swipe gestures
  leap = new LeapMotion(this).allowGestures("swipe");
}

void draw(){
  background(BG_COLOR);
}


// leap motion swipe handler
void leapOnSwipeGesture(SwipeGesture g, int state){
  int     id               = g.getId();
  Finger  finger           = g.getFinger();
  PVector position         = g.getPosition();
  PVector positionStart    = g.getStartPosition();
  PVector direction        = g.getDirection();
  float   speed            = g.getSpeed();
  long    duration         = g.getDuration();
  float   durationSeconds  = g.getDurationInSeconds();

  switch(state){
    case 1: // Start
      break;
    case 2: // Update
      break;
    case 3: // Stop
      println("--- SwipeGesture ---");
      // println("direction.x: " + direction.x);
      println("direction.y: " + direction.y);
      println("direction.z: " + direction.z);
      println("speed: " + speed);
      println("duration: " + duration);

      // up/down
      if (direction.y > 0) {
        println("going up");
      } else {
        println("going down");
      }

      // left/right
      if (direction.z > 0) {
        println("going right");
      } else {
        println("going left");
      }

      // 

      break;
  }
}