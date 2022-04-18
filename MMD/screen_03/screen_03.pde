import java.math.BigInteger;
import java.security.MessageDigest;

String inputValue = "this is an example";

String[] words = { "도태","사랑","절망","젊음","희망","고통","통곡","배신","신뢰","믿음","거짓","잘못","용서","기분","죽음","삶","위로","아픔" };
String sha512 = getSHA512( inputValue );
float x = 4.5;
int y = 0;
int idx = 0;

void setup() {
  size(800, 800);
  background(0);
  frameRate(30);
  
  for (int k = 0; k < words.length; k++) {
    words[k] = getSHA512(words[k]);  
  }
  
  for (int i = 0; i < words.length; i++) {
    for (int j = 0; j < 5; j++) {
      words[i] = words[i] + words[i];
    }
  }
}


void draw() {
  background(0);
  fill(255);
  textAlign(LEFT, TOP);
  textSize(18);
  
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
