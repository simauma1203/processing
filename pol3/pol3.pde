void setup() {
  size(500, 500);
  PFont font=loadFont("AppleBraille-16.vlw");
  textFont(font);
  smooth();
}
float[] XRot(float p[], float r) {
  float y=p[1];
  float z=p[2];
  p[1]=y*cos(r)-z*sin(r);
  p[2]=y*sin(r)+z*cos(r);
  return p;
}
float[][] CubeArray(float l) {//local
  l=l/2;
  float [][]p={{-l, l, -l}, {l, l, -l}, {l, -l, -l}, {-l, -l, -l}, 
    {-l, l, l}, {l, l, l}, {l, -l, l}, {-l, -l, l}};
  return p;//p[Pnum][XorYorZ]
}
void CubeDrawWF(float x, float y, float z, float l, float ry, float rz,float cx,float cy,float cz) {
  float [][]p=CubeArray(l);
  float w[][]=new float[8][3];
  //gyoretu
  for (int i=0; i<8; i++) {
    for(int j=0;j<3;j++){
      w[i][j]=p[i][j];
    }
    p[i][0]+=x-cx;
    p[i][1]+=y-cy;
    p[i][2]+=z-cz;
    
    //w[i][1]=cos(ry)*p[i][1]+sin(ry)*p[i][2];
    //w[i][2]=-sin(ry)*p[i][1]+cos(ry)*p[i][2];

    w[i][0]=cos(ry)*p[i][0]-sin(ry)*w[i][2];
    w[i][2]=sin(ry)*p[i][0]+cos(ry)*w[i][2];
    
    w[i][0]=(w[i][0]/w[i][2])*100;
    w[i][1]=(w[i][1]/w[i][2])*100;
    
  }
  //byousya
  for (int i=0; i<4; i++) {
    line(w[i][0], w[i][1], w[(i+1)%4][0], w[(i+1)%4][1]);
  }
  for (int i=4; i<8; i++) {
    line(w[i][0], w[i][1], w[((i+1)%4)+4][0], w[((i+1)%4)+4][1]);
  }
  for (int i=0; i<4; i++) {
    line(w[i][0], w[i][1], w[i+4][0], w[i+4][1]);
  }
}
float w2,h2;
float ry, rz;
float mx,my;//mouse
float px=0,py=0,pz=0;

void draw() {
  w2=width/2; h2=height/2;
  mx=mouseX-250;my=mouseY-250;
  translate(w2, h2);
  background(255);
  ry=(radians(mx*2));
  rz=radians(my*2);
  
  
  //CubeDrawWF(0, 0, 0, 20, rx, ry,0,30,30);
  if(keyPressed==true){
    if(key==CODED && keyCode==SHIFT)py++;
    if(key==' ')py--;
    if(key=='w'){
      px+=sin(ry);
      pz+=cos(ry);
    }
    if(key=='s'){
      px-=sin(ry);
      pz-=cos(ry);
    }
  }
  
  stroke(0,0,0);
  CubeDrawWF(0,0,0,10,ry,rz,px,py,pz);
  stroke(225,0,0);
  CubeDrawWF(10,0,0,10,ry,rz,px,py,pz);
  stroke(0,255,0);
  CubeDrawWF(0,-10,0,10,ry,rz,px,py,pz);
  stroke(0,0,255);
  CubeDrawWF(0,0,10,10,ry,rz,px,py,pz);
  
  fill(0);
  text("ry"+ry+"mx"+mx,-240,-210);
  text("player("+int(px/10)+","+int(-py/10)+","+int(pz/10)+")",-240,-235);
}