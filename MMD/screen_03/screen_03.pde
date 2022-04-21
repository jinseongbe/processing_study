import geomerative.*;
import java.math.BigInteger;
import java.security.MessageDigest;

RFont f;
RShape grp;
RPoint[] point;

String[] words = { "도태","사랑","절망","젊음","희망","고통","통곡","배신","신뢰","믿음","거짓","잘못","용서","기분","죽음","삶","위로","아픔" };
float x = 4.5;
int y = 0;
int idx = 0;

char[][] hangleArray  = new char[words.length][64];
String[][] hanStrArray = new String[words.length][64];
String temp;

int wordIdx = 0;
int charIdx = 0;

float tempPosX;
float tempPosY;


// line box
float baseWidth = 800;
float strokeW = 44/4/2;
float base = 20/4/2;
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

float time = 2;
float spd = (baseWidth-base*2)/(fRate*time);


void setup() {
  RG.init(this);
  size(800, 800);
  background(0);
  frameRate(fRate);
  
  for (int k = 0; k < words.length; k++) {
    words[k] = getSHA512(words[k]);  
  }
  
  for (int j = 0; j < words.length; j++) {
    for (int i = 0; i < words[j].length()/2 ; i++) {
      //println(words[0].substring(i*2,i*2+2), Integer.decode("0x" + words[0].substring(i,i+2)));
      //println((char) (Integer.decode("0xac00") + Integer.parseInt(words[0].substring(i*2,i*2+2), 16)));
      //print(i, "result", " ");
      temp = Integer.toString(Integer.parseInt(words[j].substring(i*2,i*2+2), 16)) + Integer.toString((Integer.parseInt(words[j].substring(i*2,i*2+2), 16)));
      //print(temp, " ");
      if (temp.length() > 5) {
        temp = temp.substring(0, 4);
      } 
      //println(temp , Integer.decode("0xac00"));    
      //println(Integer.toString(Integer.parseInt(words[0].substring(i*2,i*2+2), 16)) + Integer.toString((Integer.parseInt(words[0].substring(i*2,i*2+2), 16))));
      //println(Integer.decode("0xac00") + Integer.parseInt(temp, 16));
      hangleArray[j][i] = ((char)(Integer.decode("0xac00") + Integer.parseInt(temp)));
    }
    //hanStrArray[j] = String.valueOf(hangleArray[j]);
   
  }
  println(words[0]);
  println(hangleArray[0]);
  //println(Integer.decode("0xac00"));
  //println(Integer.decode("0xd7a3"));
  
}



void draw() {
  frame++;
  //background(0);
  fill(255);
  textAlign(LEFT);
  textSize(20);
  
  tempPosX = random(width-700, width-100);
  tempPosY = random(width-700, width-100);
  translate(tempPosX, tempPosY);
  if (charIdx < hangleArray[wordIdx].length){
    //grp = RG.getText(Character.toString(hangleArray[wordIdx][charIdx]), "NEXONLv2Gothic Light.ttf", 80, CENTER);
    grp = RG.getText("ABD", "NEXONLv2Gothic Light.ttf", 40, CENTER);
    RG.setPolygonizer(RG.UNIFORMLENGTH);
    grp.draw();

    charIdx++;
  }
  
  translate(-tempPosX, -tempPosY);
  

   //line box
  stroke(255);
  strokeWeight(strokeW);  
  strokeCap(PROJECT);
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

String getSHA512(String input){
  String toReturn = null;
  try {
      MessageDigest digest = MessageDigest.getInstance("SHA-512");
      digest.reset();
      digest.update(input.getBytes("utf8"));
      toReturn = String.format("%0128x", new BigInteger(1, digest.digest()));
  } catch (Exception e) {
      e.printStackTrace();
  }
  
  return toReturn;
}

char[] stringToArray(String str) {
  char[] arr = new char[str.length()];
  
  for (int i = 0; i < str.length(); i++) {
    arr[i] = str.charAt(i);
  }
  
  return arr;
}
