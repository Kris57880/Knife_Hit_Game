 int i=0,radius=100;
 float angle=0.06;
 void setup(){
  size(500,500);
  smooth(100);
  frameRate(60);
 }
 
 void draw(){
   background(255);
   if (i==360)  i=0;
     pushMatrix();
     translate(width/2,height/2);
     rotate(i);
     rectMode(CENTER);
     noFill();
     stroke(0);
     ellipse(0,0,radius*2,radius*2);
     line(0,0,radius,0);
    popMatrix();
   i+=angle;
 }
