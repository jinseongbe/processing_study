import java.util.Arrays;

ArrayList<Particle> particles;
int particleLimit = 130000; // 13000이 800, 800 사이즈 기준 딱

PShape mfield;
float[][][] mArray;
int[][] pixelArray;
int[][] randCorArray;

boolean flag = true;

float mCorX = 9.4;
float mCorY = 8.4;
int frame = 0;

int arrayIdx = 0;
int arrayIdxStart = 0;


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
  
  randCorArray = new int[20][2];
  
  for (int i = 0; i < randCorArray.length; i++) {
    randCorArray[i][0] = (int)random(8, 56);
    randCorArray[i][1] = (int)random(8, 56);
  }
   
  pixelArray = new int[600][2];
  for (int i = 0; i < pixelArray.length; i++) {
    //pixelArray[i][0] = (int)random(8, 56);
    //pixelArray[i][1] = (int)random(8, 56);
    if (i < 35){
      pixelArray[i][0] = (int)random(randCorArray[0][0], randCorArray[0][0]+6);
      pixelArray[i][1] = (int)random(randCorArray[0][1], randCorArray[0][1]+6);
      continue;
    } else if (i < 70){
      pixelArray[i][0] = (int)random(randCorArray[1][0], randCorArray[1][0]+6);
      pixelArray[i][1] = (int)random(randCorArray[1][0], randCorArray[1][0]+6);
      continue;      
    } else if (i < 105){
      pixelArray[i][0] = (int)random(randCorArray[2][0], randCorArray[2][0]+6);
      pixelArray[i][1] = (int)random(randCorArray[2][0], randCorArray[2][0]+6);
      continue;      
    } else if (i < 140){
      pixelArray[i][0] = (int)random(randCorArray[3][0], randCorArray[3][0]+6);
      pixelArray[i][1] = (int)random(randCorArray[3][0], randCorArray[3][0]+6);
      continue;      
    } else if (i < 175){
      pixelArray[i][0] = (int)random(randCorArray[4][0], randCorArray[4][0]+6);
      pixelArray[i][1] = (int)random(randCorArray[4][0], randCorArray[4][0]+6);
      continue;      
    } else if (i < 210){
      pixelArray[i][0] = (int)random(randCorArray[5][0], randCorArray[5][0]+6);
      pixelArray[i][1] = (int)random(randCorArray[5][0], randCorArray[5][0]+6);
      continue;      
    } else if (i < 245){
      pixelArray[i][0] = (int)random(randCorArray[6][0], randCorArray[6][0]+6);
      pixelArray[i][1] = (int)random(randCorArray[6][0], randCorArray[6][0]+6);
      continue;      
    } else if (i < 270){
      pixelArray[i][0] = (int)random(randCorArray[7][0], randCorArray[7][0]+6);
      pixelArray[i][1] = (int)random(randCorArray[7][0], randCorArray[7][0]+6);
      continue;      
    } else if (i < 305){
      pixelArray[i][0] = (int)random(randCorArray[8][0], randCorArray[8][0]+6);
      pixelArray[i][1] = (int)random(randCorArray[8][0], randCorArray[8][0]+6);
      continue;      
    } else if (i < 340){
      pixelArray[i][0] = (int)random(randCorArray[9][0], randCorArray[9][0]+6);
      pixelArray[i][1] = (int)random(randCorArray[9][0], randCorArray[9][0]+6);
      continue;      
    } else if (i < 375){
      pixelArray[i][0] = (int)random(randCorArray[10][0], randCorArray[10][0]+6);
      pixelArray[i][1] = (int)random(randCorArray[10][0], randCorArray[10][0]+6);
      continue;      
    } else if (i < 410){
      pixelArray[i][0] = (int)random(randCorArray[11][0], randCorArray[11][0]+6);
      pixelArray[i][1] = (int)random(randCorArray[11][0], randCorArray[11][0]+6);
      continue;      
    } else if (i < 445){
      pixelArray[i][0] = (int)random(randCorArray[12][0], randCorArray[12][0]+6);
      pixelArray[i][1] = (int)random(randCorArray[12][0], randCorArray[12][0]+6);
      continue;      
    } else if (i < 470){
      pixelArray[i][0] = (int)random(randCorArray[13][0], randCorArray[13][0]+6);
      pixelArray[i][1] = (int)random(randCorArray[13][0], randCorArray[13][0]+6);
      continue;      
    } else if (i < 510){
      pixelArray[i][0] = (int)random(randCorArray[14][0], randCorArray[14][0]+6);
      pixelArray[i][1] = (int)random(randCorArray[14][0], randCorArray[14][0]+6);
      continue;      
    } else if (i < 545){
      pixelArray[i][0] = (int)random(randCorArray[15][0], randCorArray[15][0]+6);
      pixelArray[i][1] = (int)random(randCorArray[15][0], randCorArray[15][0]+6);
      continue;      
    } else if (i < 580){
      pixelArray[i][0] = (int)random(randCorArray[16][0], randCorArray[16][0]+6);
      pixelArray[i][1] = (int)random(randCorArray[16][0], randCorArray[16][0]+6);
      continue;      
    } else {
      pixelArray[i][0] = (int)random(randCorArray[17][0], randCorArray[17][0]+6);
      pixelArray[i][1] = (int)random(randCorArray[17][0], randCorArray[17][0]+6);      
    }
  }
}

void draw() {
  frame++;
  println(frame/60, "sec ", particles.size());
  for (int i = 0; i < 1000; i++) {
    particles.add(new Particle());    
  }
  
  background(255);
  
  //for (int j = 0; j < 64; j++) {
  //  for (int i = 0; i < 64; i++) {
  //    shape(mfield, i*12.4, j*12.4);
  //  }
  //}

  for (Particle p : particles) {
    for (int k = arrayIdxStart; k < arrayIdx-1 ; k++) {
      if (magnetOn(p.x, p.y, pixelArray[k][0], pixelArray[k][1])) {
        p.stickyGravity();
        p.display();
        flag = false;
        break;
      }
    }
    if (flag) {
      p.gravity();
      p.run();
      p.display();
    }
    flag = true;
  }
  if (arrayIdx < pixelArray.length & frame%2 == 0 & frame > 120) {
    println(arrayIdx);
    arrayIdx = arrayIdx+1;
    println(" ", arrayIdx);
    if (arrayIdx - arrayIdxStart > 175) {
      arrayIdxStart++;
    }
  }
  
  saveFrame("frame/scene-#####.png");
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
    y = y + random(0, 0.2);
  }

  void display(){
    stroke(0);
    fill(0);
    ellipse(x, y, 0.1, 0.1);
  }
}




boolean magnetOn(float x, float y, int c, int r) {
  boolean result = false;
  
  if (Math.pow(x - mArray[c][r][0], 2) < random(15.7, 16.3) && Math.pow(y - mArray[c][r][1], 2) < random(15.7, 16.3)) {
    result = true;
  } 
  
  return result;
}
