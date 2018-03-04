int n=16;//n bunkatu
float rot=(PI*2)/n;
float x,y,l,at,pl,pat;
void setup(){
  size(1000,1000);
  smooth();
  background(255,255,255);
  stroke(230,230,230);
  ellipse(500,500,800,800);
  for(int i=0;i<=n;i++){
     line(500,500,500+cos(rot*i)*400,500+sin(rot*i)*400);
  }
  noStroke();
  fill(0,0,0);
}
void draw(){
  if(mousePressed==true){
    x=mouseX;
    y=mouseY;
    l=sqrt(sq(x-500)+sq(y-500));
    at=rot-atan2(x-500,y-500)%rot;
    //line(pmouseX,pmouseY,mouseX,mouseY);
    for(int i=0;i<=n;i++){
      ellipse(500+cos(at+rot*i)*l,500+sin(at+rot*i)*l,10,10);
      //line(500+cos(pat+rot*i)*pl,500+sin(pat+rot*i)*pl,500+cos(at+rot*i)*l,500+sin(at+rot*i)*l);
    }
    pl=l;
    pat=at;
  }
  if(keyPressed==true){
    if(key=='n'){
      fill(0,0,0);
    }
    if(key=='r'){
      fill(255,0,0);
    }
    if(key=='g'){
      fill(0,255,0);
    }
    if(key=='b'){
      fill(0,0,255);
    }
    if(key=='y'){
      fill(255,255,0);
    }
    if(key=='1'){
      //n=n/2;
      //rot=(PI*2)/n;
    }
    if(key=='2'){
      //n=n*2;
      //rot=(PI*2)/n;
    }
  }
}