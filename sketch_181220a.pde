 void setup(){
  size(500,500);
  smooth(100);
  frameRate(60);
 }
 int rad=100 ,move=0,X,Y;
 float i=0,angle=0.01;
 void draw(){
   background(255);
   //circle------------------------------------
   noFill();
   stroke(0);
   ellipse(width/2,height/2,rad*2+1,rad*2+1);
   if (i==360)  i=0;
     pushMatrix();
     translate(width/2,height/2);
     rotate(i);
     rectMode(CENTER);
     noFill();
     noStroke();
     ellipse(0,0,rad*2,rad*2);
     line(0,0,rad,0);
    popMatrix();
   i+=angle;
    //knife----------------------------------
    fill(0);
    X=width/2;
    Y=height-move;
    if(move!=0)move+=10;
    rect(X,Y,10,30);
 }
 void mouseClicked(){
   move=10;
  
 }
 
