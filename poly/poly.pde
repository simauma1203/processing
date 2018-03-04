void setup(){
  size(500,500);
  PFont font=loadFont("SansSerif-48.vlw");
  textFont(font);
}

float x=50,y=50,z=50;
float rx=0,ry=0,rz=0;
float x2,y2,z2;
float px,py;

void draw(){
  translate(250,250);
  background(255);
  rx=radians(mouseX);
  ry=radians(mouseY);
  x2=x;
  y2=cos(rx)*y-sin(rx)*y;
  z2=sin(rx)*z+cos(rx)*z;
  
  
  fill(255);
  
  fill(100);
  text(int(x2)+","+int(y2)+","+int(z2),-230,230);
  
}