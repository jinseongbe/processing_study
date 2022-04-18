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


void setup() {
  size(800, 800);
  RG.init(this);
  //textAlign(CENTER);
  grp = RG.getText("비난", "AppleSDGothicNeoM.ttf", 400, CENTER);
  frameRate(30);
  point = grp.getPoints();
  
  for (int i=0; i<point.length; i++) {
    point[i].x = point[i].x + -25;
    point[i].y = point[i].y + 120; 
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(1);
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
  } else if (frameIdx >= 400 & frameIdx < 800) {
    for (int i=pointx.size()-1; i>0; i--) {
      ellipse((float)pointx.get(i), (float)pointy.get(i), 2.5, 2.5); 
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
  
  
  println(frameIdx);
  //grp.draw()
}



void mouseClicked() {
  if (flag) {
    flag = false;
  } else {
    flag = true;
  }
}
