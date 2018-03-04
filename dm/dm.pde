//rad=doukei
//int wo hikisuu ni site float wo kaesunara .0 de devide
int cnt=0;
int callidx;

float mx=500,my=750;

int dm_am=10000;
int[] dm_used=new int[dm_am];
float[] dm_spd=new float[dm_am];
float[] dm_x=new float[dm_am];
float[] dm_y=new float[dm_am];
float[] dm_z=new float[dm_am];
float[] dm_vx=new float[dm_am];
float[] dm_vy=new float[dm_am];
color[] dm_color=new color[dm_am];

color c_red=color(255,0,0),c_blue=color(0,32,255),c_green=color(0,192,0);
color c_yellow=color(255,224,32),c_orange=color(255,160,32),c_brown=color(160,128,96);
color c_cyan=color(80,208,255),c_purple=color(160,32,255),c_rgreen=color(96,255,128);
color c_pink=color(255,96,208);
color c_black=color(0,0,0),c_white=color(255,255,255),c_gray=color(128,128,128);


void setup() {
  size(1000, 1000);
  //stroke();
}

//main
void draw() {
  background(255);
  translate(width/2,height/2);
  
  if (cnt%8==0) {
    //dm_shot_rot(500,500,cnt/20.0,5);
    dm_shot_zenhoui(500,250,16,cnt/2.0,3,c_red);
  }
  if ((cnt+2)%12==0) {
    dm_shot_zenhoui(500,250,12,-(cnt/4.0),3,c_pink);
  }
  if((cnt%160)>80){
    dm_shot_zenhoui(500,250,8,(cnt*0.04),7,c_purple);
  }
  if((cnt%160)>80){
    dm_shot_zenhoui(500,250,8,-(cnt*0.04),7,c_purple);
  }
  
  
  dm_call();
  cnt+=1;
}

int dm_make() {
  for (int i=0; i<=dm_am-1; i++) {
    if (dm_used[i]==0){
      dm_used[i]=1;
      return i;
    }
  }
  return -1;
}

void dm_ofs(int num, int x, int y) {
  dm_x[num]=x;
  dm_y[num]=y;
}

void dm_vset(int num, float vx, float vy) {
  dm_vx[num]=vx;
  dm_vy[num]=vy;
}

void dm_allclr() {
  for (int i=0; i<=dm_am-1; i++) {
    dm_clr(i);
  }
}

void dm_clr(int num) {
  dm_used[num]=0;
}

void dm_call() {
  for (int i=0; i<=dm_am-1; i++) {
    if (dm_used[i]==0)continue;
    //move
    dm_x[i]=dm_x[i]+dm_vx[i];
    dm_y[i]=dm_y[i]+dm_vy[i];
    //clear
    if (1000<dm_x[i] || dm_x[i]<-1000)dm_clr(i);
    if (1000<dm_y[i] || dm_y[i]<-1000)dm_clr(i);
    //draw
    noFill();
    stroke(dm_color[i]);
    ellipse(dm_x[i]-500,dm_y[i]-500, 10, 10);
  }
}

void dm_shot(int x, int y, float vx, float vy,color c) {
  callidx=dm_make();
  dm_ofs(callidx, x, y);
  dm_vset(callidx, vx, vy);
  dm_color[callidx]=c;
}

void dm_shot_rot(int x,int y,float rad,float v,color c){
  dm_shot(x,y,cos(rad)*v,sin(rad)*v,c);
}

void dm_shot_zenhoui(int x,int y,int n,float rot,float v,color c){
  float r=6.28/n;
  for(int i=0;i<=n-1;i++){
    //dm_shot_rot(x,y,cnt/20,v);
    dm_shot_rot(x,y,r*i+rot,v,c);
  }
  
}