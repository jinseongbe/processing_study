import java.math.BigInteger;
import java.security.MessageDigest;

String inputValue = "this is an example";

String[] words = { "도태","사랑","절망","젊음","희망","고통","통곡","배신","신뢰","믿음","거짓","잘못","용서","기분","죽음","삶","위로","아픔" };
String sha512 = getSHA512( inputValue );
float x = 4.5;
int y = 0;
int idx = 0;

// line box 
float baseWidth = 800;
float base = 20/4;
float base_2 = baseWidth - base;
float strokeW = 44/4;
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
float fRate = 1;
float frame = 0;

float time = 2;
float spd = (baseWidth-base*2)/(fRate*time);

void setup() {
  size(800, 800);
  background(0);
  frameRate(fRate);
  
  for (int k = 0; k < words.length; k++) {
    words[k] = getSHA512(words[k]);  
  }
  
  for (int i = 0; i < words.length; i++) {
    for (int j = 0; j < 20; j++) {
      words[i] = words[i] + getSHA512(words[i]);
    }
  }
}


void draw() {
  frame++;
  background(0);
  fill(255);
  textAlign(LEFT, TOP);
  textSize(18);
  
  // hashed txt
 
  char[] hashedArr = stringToArray(words[idx]);
  for (int i = 1; i < hashedArr.length; i++ ){
    fill(255);
    text(hashedArr[i], x, y);
    x = x + 12;
    if (i%66 == 0) {
      y = y + 20;
      x = 4.5;
    }  
  }
  if (idx < words.length-1) {
    idx++;
  } else {
    idx = 0;
  }
  x = 4.5;
  y = 0;

  
  
  
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
