void setup(){
  size(1000,1000);
  frameRate(30);
  for(z=0;z<=99;z++){
    for(x=0;x<=99;x++){
      //y[x][z]=100/(sin(x*0.1)+0.1)-100;
      //y[x][z]=sin((x-50)*0.1)*cos((z-50)*0.1)*10;
      //y[x][z]=-(x-50)*(x-50)*0.03+20;
      //y[x][z]=5*sin(x*0.1)+5*sin(z*0.1);
      //y[x][z]=5*tan(x*0.1)+5*sin(z*0.1);
      y[x][z]=5*cos((x+50)*0.3)*(1-abs(x-50)*0.02);//+5*cos((z+50)*0.3)*(1-abs(z-50)*0.02);
    }
  }
}

float[][] y=new float[100][100];

int x,z;
int keisu=300;
float cx=50,cy=-20,cz=-10;//camera xyz
float rx,ry,rz;//camera rotate
float v=1;//moving verocity
float vx,vy,vz;//view xy
float dotSize;//dotsize
float e=2.71;
float distance;//far camera to xyz
float fog;
void draw(){
  background(255);
  translate(width/2,height/2);
  
  for(z=99;z>0;z--){
    for(x=99;x>0;x--){
      //vx=x*100;
      //vx=y[x][z]*100;
      vx=x-cx;
      vy=y[x][z]-cy;
      vz=z-cz;
      vx=vx*keisu/vz;
      vy=vy*keisu/vz;
      if(vx<0 || width<vx || vy<0 || height<vy){
        //continue;
      }
      distance=dis(cx,cy,cz,x,y[x][z],z);
      //stroke(255-y[x][z]*60,0,0);
      fog=255;
      fog=255-distance*2;//fog coment out
      stroke(255-y[x][z]*60,0,0,fog);
      //fill(255,255,255);
      dotSize=30-distance*0.3;
      ellipse(vx,vy,dotSize,dotSize);
    }
  }
}

void keyPressed(){
  if(key=='w'){
    cz=cz+v;
  }
  if(key=='s'){
    cz=cz-v;
  }
  if(key=='a'){
    cx=cx-v;
  }
  if(key=='d'){
    cx=cx+v;
  }
  if(key==' '){
    cy=cy-v;
  }
  if(keyCode==SHIFT){
    cy=cy+v+v+v;
  }
}

float dis(float x1,float y1,float z1,float x2,float y2,float z2){
  return sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)+(z1-z2)*(z1-z2));
}