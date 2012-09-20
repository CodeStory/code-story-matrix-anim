String[] rawTexts= {
  "All your base are belong to us.", 
  "For great Justice !", 
  "You set up us the bomb", 
  "code story FTW", 
  "I can digest more slides", 
  "Show me some code", 
  "Am I in the Matrix ?", 
  "You don't write test, you die", 
  "You aren't going to need it", 
  "Live Coding is just plain HARD", 
  "Enjoy DEVOXX", 
  "Jean-Laurent", 
  "David", 
  "Eric", 
  "Sebasti[a|e]n", 
  "JigSaw will never be out", 
  "Scala will die", 
  "CoffeeScript is missing some ;", 
  "You just don't need c#", 
  "I could use a dictionary now !"
};

String fontName = "Monaco";
int fontSize = 20;
PFont font;
float x;  
float y;
int frame;
Phrase[] phrases;

class Phrase {
  String letters;
  int[] opacity;
  float xPos;
  float yPos;
  int position;
  
  Phrase(float XX, float YY, String someLetters) {
    letters = someLetters;
    xPos = XX;
    yPos = YY;
    position = -1;
    opacity = new int[letters.length()];
    for(int i=0;i<letters.length();i++) {
      opacity[i] = int(random(130))+126;
    }
  }
  
  void display() {
    for(int i=0;i<position;i++) {
      fill(0, 255, 0, opacity[i]);
      text(letters.charAt(i), xPos, yPos+ i*17);
    }
    fill(255, 255, 255, 255);
    text("#", xPos, yPos + (position + 1)*17);
    if (position < letters.length()) {
      position++;
    } 
  }
  
}

void setup() {
  x = 20;
  y = 20;
  phrases = new Phrase[rawTexts.length];
  for (int i=0; i< rawTexts.length; i++) {
     phrases[i] = new Phrase(x + i*40, y + int(random(100)), rawTexts[i]);
  }
  size(800, 600);
  font = createFont(fontName, fontSize, true);
  textFont(font, 20);
  textAlign(CENTER);
}

void draw() {
  background(0);
  for (int i=0; i< phrases.length; i++) {
    phrases[i].display();
  }
  //filter(BLUR, 1);
  frame++;
}

