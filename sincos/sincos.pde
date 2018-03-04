float px=100;
float py=100;
float angle=0;
int s;
int m;
int h;


void setup(){
  size(800,800);
  smooth();
  noStroke();
}

void draw(){
  s=second();
  m=minute();
  h=hour();
  print(h+":"+m+":"+h);
}