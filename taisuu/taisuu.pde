void setup(){
  size(1000,1000);
  
}
float r,deg;
float x,y;
float a=0.01,b=0.09;
float e=2.71828182845;
float bx,by;//draw before

void draw(){
  translate(500,500);
  
  for(deg=0;r<900;deg=deg+0.1){
    r=a*pow(e,deg*b);
    x=cos(deg)*r;
    y=-sin(deg)*r;
    line(x,y,bx,by);
    point(x,y);
    bx=x;
    by=y;
  }
  
  
}