import de.voidplus.leapmotion.*;
import netP5.*;
import oscP5.*;


// constants
String HOST = "127.0.0.1";
int PORT = 5555;


// vars
LeapMotion leap;
OscP5 oscP5;
NetAddress remote;


// processing
void setup(){
  size(640, 360);
  background(0);
  initLeapMotion();
  initOSC();
}

void draw(){
  background(0);
}


// leap motion
void initLeapMotion() {
  // set leap to detect only swipe gestures
  leap = new LeapMotion(this).allowGestures("swipe");
}

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
    case 1: // start
      break;

    case 2: // update
      break;

    case 3: // stop
      String vDirection;
      String hDirection;

      // up/down
      if (direction.y > 0) {
        vDirection = "up";
      } else {
        vDirection = "down";
      }

      // left/right
      if (direction.z > 0) {
        hDirection = "right";
      } else {
        hDirection = "left";
      }

      sendSwipe(hDirection, vDirection, speed, duration);
      break;
  }
}


// osc
void initOSC() {
  // open osc server
  oscP5 = new OscP5(this, PORT);

  // create remote target
  remote = new NetAddress("127.0.0.1", PORT);
}

void sendSwipe(String hDirection, String vDirection, float speed, long duration) {
  // create osc message and label it
  OscMessage m = new OscMessage("swipe");

  m.add(hDirection);
  m.add(vDirection);
  m.add(speed);
  m.add(duration);

  // send data to remote target
  oscP5.send(m, remote);
}