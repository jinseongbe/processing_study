
//import java.util.ArrayList;
//import java.util.List;

boolean flag = false;

float base = 20;
float base_2 = 800 - base;

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

float time = 2;
float spd = (800-base*2)/(fRate*time);

void setup() {
  size(800, 800);
  frameRate(60);
}

void draw() {
  frame++;
  background(0);
  fill(255);
  stroke(255);
  strokeWeight(20);  
  if (frame < fRate*1*time) {
    line(x_a1, y_a1, x_b1, y_b1);
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
  
}





void mouseClicked() {
  if (flag) {
    flag = false;
  } else {
    flag = true;
  }
}
