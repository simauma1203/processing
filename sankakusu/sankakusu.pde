void setup(){
  int i,j,n,m,t=0,flag;
  
  for(i=10000;i<30000;i++){
    
    n=i*i;
    flag=0;
    for(j=1;j<=n+1;j++){
      
      if(n==(j*j+j)/2){
        flag=1;
        t=j;
      }
      
    }
    
    if(flag==1){
      println(i+"^2=("+t+"^2+"+t+")/2="+n);
    }
  }
}