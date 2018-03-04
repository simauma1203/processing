void setup(){
  size(1000,1000);
  
  for(z=0;z<=99;z++){
    for(x=0;x<=99;x++){
      y[x][z]=5*sin(x*0.5)+5*sin(z*0.5);
    }
  }
}

float[][] y=new float[100][100];

int x,z;
int keisu=100;
float cx=50,cy,cz=-10;//camera
float rx,ry,rz;
float v=0.5;
float vx,vy;//view xy

void draw(){
  background(255);
  translate(width/2,height/2);
  
  for(z=99;z>0;z--){
    for(x=99;x>0;x--){
      vx=(x-cx)*keisu/(z-cz);
      vy=(y[x][z]-cy)*keisu/(z-cz);
      if(vx<0 || width<vx || vy<0 || height<vy){
        //continue;
      }
      //stroke(y[x][z],y[x][z]);
      ellipse(vx,vy,4,4);
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