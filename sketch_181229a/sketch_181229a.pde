class KNIFE{                          //class knife---------------------------------------
  int lv,amount,hit=0;
  float Angle=PI;
  KNIFE(int n){
    lv=n;
    amount=8+(level-1)*2+5;
  }
  float x[],y[],angle[],move[];
  void setVar(){                      //set Variables
    x=new float[amount];
    y=new float[amount];
    angle=new float[amount];
    move=new float[amount];
    Angle=0.01*level;
    for(int i=0;i!=amount;i++)  {
      x[i]=width/2;
      y[i]=height;
      move[i]=0;
    }
  }
  void drawKnife(){                   //draw knife
    for(int i=0;i!=amount;i++){
      if(move[i]!=0)  y[i]-=move[i];
      rectMode(CENTER);
      fill(0,0,0);
      if(y[i]>height/2)
        rect(x[i],y[i],40,200);
      if(y[i]==height/2) {
        angle[i]=Angle;
        for(int j=0;j!=i;j++){        //check
           if((Angle-angle[j])<=PI/30&&(Angle-angle[j])>=PI/-30){
           // Knifebreak();
           angle[i]=0;
           status=2;
           break;  
          }
        }
        hit++;
        if(RestKnife==0&&status==0){  //level UP
          LevelSET(level+1); 
        }
      }
    }
  }
  void hitlog(){                      //knife on the log
    noStroke();
    for(int i=0;i!=hit;i++){
      if(angle[i]!=0){
        pushMatrix();
        //translate(width/2,height/2);
        rotate(-(angle[i])-PI/2);
        rectMode(CORNER);
        rect(0,-20,-300,40);
        popMatrix();
      }
    }
  }
}                                      //class knife---------------------------------------
PFont title,start,failed,restart;
PImage mark;
void setup(){                          //set
  size(720,1080);
  frameRate(60);
  LevelSET(1);
  title=createFont("Another_.ttf",200);
  start=createFont("ampersand.ttf",100);
  restart=createFont("SMLFATMARKER.ttf",100);
  failed=createFont("PermanentMarker.ttf",100);
  mark=loadImage("pic/start.png");
}
int level,count=0,RestKnife=8+(level-1)*2,status=4,time=0,i;
float moveX=5,moveY=0,Xpos=0,Ypos=0,rotate=-PI/120;
float red=0,blue=216,green=432,yellow=648,orange=864,speed=0;
KNIFE k;
void draw(){  //draw
  background(233, 234, 236);
  if(status==1){                      
    if(i!=60){
      LevelUP(i%5==0);
      i++;
    }else{
      status=0;
      i=0;    
    }
  }else if(status==3){
    Restart(); 
  }else if(status==4){
    START();
  }else if(status==5){
    skipPage();
  }else{
    if(status==2){
      pushMatrix();
      translate(width/2,height/2+10);
      rotate(rotate);
      colorMode(RGB);
      fill(255,0,0);
      rect(Ypos,Xpos,40,200);
      popMatrix();
      if(Ypos<=-1*height){
        Ypos=0;Xpos=0;
        rotate=-PI/120;
        moveX=5;moveY=0;
        status=3;
      }else{
        Xpos+=moveX;  Ypos+=moveY;
        moveX++;      moveY--;
        if(moveX==-1)      moveX=0.01;
        if(rotate==PI/-2)  rotate=PI/2;
        if(moveY==-9)       moveY=-9;
        else rotate-=PI/120;
      }
    }
    rectMode(CENTER);
    textFont(start);
    fill(227, 178, 99);
    textSize(40);
    text("Level",56,60);
    text(level,126,60);
    //draw knife
    k.drawKnife();
    //draw log
    pushMatrix();
    translate(width/2,250);
    rotate(k.Angle);
    drawLog();
    k.hitlog();
    stroke(255);
    strokeWeight(4);
    line(0,0,0,200);
    popMatrix();
    fill(255);
    textSize(243);
    if(RestKnife>=10)
      text(RestKnife,width/2-0,344);
    else
      text(RestKnife,width/2-0,344);
    k.Angle+=PI/(100/level+50);
    if(k.Angle>=TWO_PI)  k.Angle=0;
  }
}
void START(){
  background(233, 234, 236);
  image(mark,458,58,511/2,512/2);
  textAlign(RIGHT);
  fill(6,5,5);
  textFont(title);
  text("Hit",253,192);
  text("Game!",428,317);
  textSize(35);
  text("win and get Pornhub Premium Access !!!",478,369);
  if(i%21<=8)
    fill(233,234,236);
  else
    fill(250,170,20);
  textFont(start);
  textAlign(CENTER);
  text("TAP To Start",356,717);
  i++;
}
void LevelSET(int i){  
  rectMode(CORNER);
  if(i!=1)  status=1;
  if(i-level!=0)  time=0;
  level=i;
  count=0;
  RestKnife=8+(level-1)*2+5;
  k=new KNIFE(level);
  k.setVar();
  speed=i*1.2;
}
void LevelUP(boolean b){
  background(0);
  if(b)
    fill(0);
  else
    fill(243,212,6);
  textSize(128);
  text("Level UP!!!",353,540);
}
void Restart(){
  background(219,132-i,47);
  fill(254);
  textFont(failed);
  textSize(196);
  text("Failed",365,420);
  i++;
  if(i>=180){ 
    rectMode(CORNER);
    strokeWeight(8);
    stroke(255);
    noFill();
    rect(83,600,555,238,10);
    fill(255);
    textFont(restart);
    textSize(99);
    text("RESTART",360,764);  
    if(time>=2){
      textSize(33);
      stroke(255);
      rectMode(CORNER);
      noFill();
      text("Skip?",570,1032);
    }  
  } 
}
void skipPage(){
  background(233, 234, 236);
  fill(0);
  textFont(failed);
  textSize(160);
  text("No Way!",width/2,height/3);
  textSize(40);
  text("Tap to restart",width/2,height/4*3);
}
void mouseClicked(){                  //mouseClicked
  if(status==0){
    if(RestKnife>0){
      k.move[count]=60;
      count++;
      RestKnife--;
    }
  }else if(status==3&i>=180){
    if(mouseX>=80&&mouseX<=640&&mouseY>=600&&mouseY<=840){
      LevelSET(level);
      status=0;
      i=0;
      time++;
    }else if(mouseX>=510&&mouseX<=620&&mouseY>=985&&mouseY<=1055){
      skipPage();
      status=5;
    }
  }else if(status==4){
    status=0;
    i=0;
  }
  else if(status==5){
    status=0;
    i=0;
    time++;
  }
}
void drawLog(){           //draw log
  fill(0,0,0);
  ellipse(0,0,400,400);
  }
