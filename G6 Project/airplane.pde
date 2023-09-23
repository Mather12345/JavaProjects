PImage airplane,airplane2;

class airPlane {
  int y;
  int i;
  int a;
  int b;
  void setup()
  {
    airplane=loadImage("airplane.png");
    airplane2=loadImage("airplane.png");
    frameRate(120);
    y=75;
    i=75;
    a=75;
    b=75;
  }

  void draw()
  {
    image(airplane,i,50);
    image(airplane2,y,50);
    if (i++>=149) i=-50;
    if (y++>=199) y=i;
  }
}
