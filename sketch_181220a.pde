void setup(){
  size(720,1080);
  smooth(100);
  frameRate(60);
 }
 int rad=200 ,move=0,X,Y,knife=10,level=1,i=0,j,k=0,time=0;
 float angle=0.01,R_angle=0.01;
 float[] knifeAngle=new float[knife],hit;
 void draw(){
   background(255);
   fill(255);
   //knife----------------------------------
   if(angle!=360)angle+=0.01;
   else angle=0;
   fill(0);
   X=width/2;
   Y=height-100-move;
   //knife----------------------------------
   if(knife==0){
    //game end,next level
    println("Level UP!");
    knife=level*10-level*2;
    time=0;
   }
   drawKNIFE(knife);
   fill(0);
   if(move!=0)move+=15;
   if(Y>height/3+rad/2)
     rect(X,Y,30,150);
   else if (Y==height/3+rad/2){
     knifeAngle[i]=angle;
     i++;
     Y=height-100-move;
   } 
   fill(255); 
   ellipse(width/2,height/3,rad*2,rad*2);
 }
 void mouseClicked(){
   move=15;
   knife--;
   println(time+1);
   time++;
 }
 void drawKNIFE(int knife){
   fill(255);
   for(int i=0;i!=knife;i++){
     rect(width/2,height-100,30,150);
   }
 }
