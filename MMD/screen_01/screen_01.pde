import geomerative.*;
import java.util.ArrayList;
import java.util.List;

RFont f;
RShape grp;
boolean flag = true;
RPoint[] point;
float speed = 0;
List<Object> pointx = new ArrayList<Object>();
List<Object> pointy = new ArrayList<Object>();
float tempx;
float tempy;
int frameIdx = 0;


// line box
float baseWidth = 800;
float strokeW = 44;
float base = 20;
float base_2 = baseWidth - base;

float x_a1 = base;
float x_b1 = base;
float y_a1 = base;
float y_b1 = base;

float x_a2 = base;
float x_b2 = base;
float y_a2 = base;
float y_b2 = base;

float x_a3 = base;
float x_b3 = base;
float y_a3 = base_2;
float y_b3 = base_2;

float x_a4 = base_2;
float x_b4 = base_2;
float y_a4 = base;
float y_b4 = base;
float fRate = 60;
float frame = 0;

float time = 1;
float spd = (baseWidth-base*2)/(fRate*time);


void setup() {
  size(800, 800);
  RG.init(this);
  //textAlign(CENTER);
  grp = RG.getText("비난", "AppleSDGothicNeoM.ttf", 400, CENTER);
  //RG.setPolygonizer(RG.UNIFORMSTEP);
  
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(1);
  frameRate(fRate);
  point = grp.getPoints();
  
  for (int i=0; i<point.length; i++) {
    point[i].x = point[i].x + -25 + 400;
    point[i].y = point[i].y + 120 + 400; 
  }
}

void draw() {
  frame++;
  background(0);
  noStroke();
  fill(255);
  
  if (frameIdx < 400) {
    for (int i=0; i<point.length; i++) {
      tempx = point[i].x + random(-speed, speed);
      tempy = point[i].y + random(-speed, speed);
      pointx.add(tempx);
      pointy.add(tempy);
      point[i].x = tempx;
      point[i].y = tempy;
      ellipse(point[i].x, point[i].y, 2.5, 2.5); 
    }
    frameIdx++;
  } else if (frameIdx >= 400 & frameIdx < 500) {
    for (int i=pointx.size()-1; i>0; i--) {
      //ellipse((float)pointx.get(i), (float)pointy.get(i), 2.5, 2.5); 
    }
    frameIdx++;
  } else {
    frameIdx = 0;
    pointx.clear();
    pointy.clear();
  }
  
  
  if (flag) {
    speed = 0;
  } else {
    speed = speed + 0.1;
  }

   //line box
  stroke(255);
  strokeWeight(strokeW);  
  strokeCap(PROJECT);
  if (frame < fRate*1*time) {
    line(x_a1, y_a1, x_b1, y_b1);
    println(x_a1, y_a1, x_b1, y_b1);
    line(x_a2, y_a2, x_b2, y_b2);
    x_b1 = x_b1 + spd;
    y_b2 = y_b2 + spd;
  } else if (frame < fRate*2*time){
    line(x_a1, y_a1, x_b1, y_b1);
    line(x_a2, y_a2, x_b2, y_b2);
    line(x_a3, y_a3, x_b3, y_b3);
    line(x_a4, y_a4, x_b4, y_b4);    
    x_b3 = x_b3 + spd;
    y_b4 = y_b4 + spd;    
  } else if (frame < fRate*3*time){
    line(x_a1, y_a1, x_b1, y_b1);
    line(x_a2, y_a2, x_b2, y_b2);    
    line(x_a3, y_a3, x_b3, y_b3);
    line(x_a4, y_a4, x_b4, y_b4);    
  } else if (frame < fRate*5*time){
    line(x_a1, y_a1, x_b1, y_b1);
    line(x_a2, y_a2, x_b2, y_b2);
    line(x_a3, y_a3, x_b3, y_b3);
    line(x_a4, y_a4, x_b4, y_b4);    
  } else if (frame < fRate*6*time){
    line(x_a1, y_a1, x_b1, y_b1);
    line(x_a2, y_a2, x_b2, y_b2);
    x_a1 = x_a1 + spd;
    y_a2 = y_a2 + spd; 
    line(x_a3, y_a3, x_b3, y_b3);
    line(x_a4, y_a4, x_b4, y_b4);    
  } else if (frame < fRate*7*time){
    line(x_a3, y_a3, x_b3, y_b3);
    line(x_a4, y_a4, x_b4, y_b4);
    x_a3 = x_a3 + spd;
    y_a4 = y_a4 + spd;    
  }
  println(frameIdx);
  
}



void mouseClicked() {
  if (flag) {
    flag = false;
  } else {
    flag = true;
  }
}
