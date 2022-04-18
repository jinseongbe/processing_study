ArrayList<Particle> particles;
int particleLimit = 13000; // 13000이 800, 800 사이즈 기준 딱

PShape mfield;
float[][][] mArray;
int[][] pixelArray;

boolean flag;

float mCorX = 9.4;
float mCorY = 8.4;

void setup() {
  frameRate(60);
  size(800, 800);
  particles = new ArrayList<Particle>(); 
  
  mfield = createShape(ELLIPSE, 9, 9, 8, 8);
  //mfield.setFill(color(0, 0, 0));
  mfield.setStroke(color(0));
  mArray = new float[64][64][2];
  for (int i = 0; i < 64; i++) {
    for (int j = 0; j < 64; j++) {
      mArray[i][j][0] = 9.4 + 12.4*i;
      mArray[i][j][1] = 9.4 + 12.4*j;
    }
  }
   
  pixelArray = new int[100][2];
  for (int i = 0; i < 100; i++) {
    pixelArray[i][0] = (int)random(8, 56);
    pixelArray[i][1] = (int)random(8, 56);
  }
}

void draw() {
  for (int i = 0; i < 100; i++) {
    particles.add(new Particle());  
  }
  
  background(255);
  //for (int j = 0; j < 64; j++) {
  //  for (int i = 0; i < 64; i++) {
  //    shape(mfield, i*12.4, j*12.4);
  //  }
  //}

  //for (Particle p : particles) {
  //  flag = false;
    
  //  for (int k = 0; k<pixelArray.length; k++) {
  //    flag = magnetOn(p.x, p.y, pixelArray[k][0], pixelArray[k][1]);
  //  }
    
  //  if (flag) {
  //    p.stickyGravity();
  //    p.display();
  //  } else {
  //    p.run();
  //    p.gravity();
  //    p.display();
  //  }
  //}

  for (Particle p : particles) {
    for (int j =50; j < 60; j++) {
      if (magnetOn(p.x, p.y, j, 6)) {
        p.stickyGravity();
        p.display();
        break;
      } else {
        p.run();
        p.gravity();
        p.display();
        break;
      }
    }
  }

  while (true) {
    particles.remove(0);
    if (particles.size() < particleLimit) {
      break;
    }
  }
  
  //saveFrame("frame/scene-#####.png");
}


class Particle{
  float x, y, xspeed, yspeed;

  Particle(){
    x = random(0, 800);
    y = random(-3, 0);
    xspeed = random(-0.5, 0.5);
    yspeed = random(-0.1, 0.1);
  }

  void run(){
    x = x + xspeed;
    y = y + yspeed;
  }
  
  void gravity(){
    yspeed += 0.1; 
  }
  
  void stickyGravity() {
    y = y + 0.1;
  }

  void display(){
    stroke(0);
    fill(0);
    ellipse(x, y, 1,1);
  }
}

boolean magnetOn(float x, float y, int c, int r) {
  boolean result = false;
  
  if (Math.pow(x - mArray[c][r][0], 2) < random(15.7, 16.3) && Math.pow(y - mArray[c][r][1], 2) < random(15.7, 16.3)) {
    result = true;
  } 
  
  return result;
}
