void setup(){
  size(500,500);
  PFont font=loadFont("AppleBraille-48.vlw");
  textFont(font);
  smooth();
}

float []x={-10,10,10,-10,-10,10,10,-10};//world
float []y={-10,-10,10,10,-10,-10,10,10};//world
float []z={-10,-10,-10,-10,10,10,10,10};//world
float px[]=new float[10];//transform
float py[]=new float[10];//transform
float pz[]=new float[10];//transform
float gx,gy;//view
float rx,ry,rz;//around angle
float cy;
float cameraA=radians(45);
int i,i2;
void draw(){
  background(255);
  translate(250,250);
  fill(255);
  rx=radians(mouseY);
  ry=radians(mouseX);
  for(i=0;i<8;i++){
    px[i]=x[i];
    py[i]=y[i];
    pz[i]=z[i];
    //rotation
    py[i]=cos(rx)*y[i]+sin(rx)*z[i];
    pz[i]=-sin(rx)*y[i]+cos(rx)*z[i];
    
    px[i]=cos(ry)*x[i]-sin(ry)*pz[i];
    pz[i]=sin(ry)*x[i]+cos(ry)*pz[i];
    
    //px[i]=cos(rz)
    
    px[i]=(px[i]/(pz[i]/2+20))*80;
    py[i]=(py[i]/(pz[i]/2+20))*80;
    //pz[i]=pz[i]*50/(pz[i]+20);
    //ellipse(px[i]*100/(pz[i]+10),py[i]*100/(pz[i]+10),10,10);
  }
  
  for(i=0;i<4;i++){
    line(px[i],py[i],px[(i+1)%4],py[(i+1)%4]);
  }
  for(i=4;i<8;i++){
    line(px[i],py[i],px[((i+1)%4)+4],py[((i+1)%4)+4]);
  }
  for(i=0;i<4;i++){
    line(px[i],py[i],px[i+4],py[i+4]);
  }
  
  fill(0);
  //text("fps:60",-230,-200);
}