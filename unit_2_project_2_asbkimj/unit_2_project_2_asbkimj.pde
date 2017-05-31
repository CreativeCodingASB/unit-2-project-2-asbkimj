import de.voidplus.leapmotion.*;

float grabPower; 
float pinchPower;
float indexX; 
float indexY; 
PVector fingerPosition = new PVector();
boolean something; 
boolean otherThing;

LeapMotion leap;

void setup() {
  size(800, 500);
  leap = new LeapMotion(this);
  background(255);
}

void draw()
{

  for (Hand h : leap.getHands())
  {
    grabPower = h.getGrabStrength(); 
    if (grabPower == 1)
    {
      PVector hPosition  = h.getPosition();
     rect(hPosition.x, hPosition.y, 60,60);
    }
  }
  Hand left = leap.getLeftHand(); 
  if ( leap.getLeftHand() != null)
  {
    noStroke();
    Finger fingerIndex = left.getIndexFinger();
    PVector lastPos = fingerPosition;
    fingerPosition = fingerIndex.getPositionOfJointTip();
    //fill(0);
    fingerPosition.x = lerp(lastPos.x, fingerPosition.x, .01);
    fingerPosition.y = lerp(lastPos.y, fingerPosition.y, .01);
    ellipse(fingerPosition.x, fingerPosition.y, 8, 8);
    colourChange(fingerIndex);
    println(fingerPosition.x + ", " + fingerPosition.y);
  }

  Hand right = leap.getRightHand(); 
  if (leap.getRightHand() != null)
  {
    //Finger fingerThumb = right.getThumb(); 
    //Finger fingerIndex = right.getIndexFinger(); 
    pinchPower = right.getPinchStrength(); 

    if (pinchPower == 1 && something == true)
    {
      background(random(0, 255), (random(0, 255)), (random(0, 255)));
      something = false;
    }

    if (pinchPower == 0)
    {
      something = true;
    }
  }
}

void colourChange( Finger f)
{

  if (!f.isExtended())
  {
    fill(random(100, 200), random(100, 200), random(100, 200));
  }
}

void dissolve()
{
}