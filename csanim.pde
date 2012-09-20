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
  "I could use a dictionary now !",
  "Do or do not, there is no try",
  "Tester c'est douter",
  "There is no spoon",
  "I’m sorry, Dave. I’m afraid I can’t do that.",
  "I find your lack of faith disturbing",
  "Craftsmanship over crap",
  "To iterate is human, to recurse divine.",
  "To err is human, but to really foul things up you need a computer.",
  "Good design adds value faster than it adds cost.",
  "Deleted code is debugged code.",
  "implicity is the ultimate sophistication."
};

String fontName = "Monaco";
int fontSize = 20;
PFont font;
float x;  
float y;
int frame;
Phrase[] phrases;
int phrasesShown = 23;

class Phrase {
  String letters;
  int[] opacity;
  float xPos;
  float yPos;
  int position;
  int birthDate;
  int deathDate;
  
  Phrase(float XX, float YY, String someLetters, int birth) {
    letters = someLetters;
    xPos = XX;
    yPos = YY;
    position = -1;
    birthDate = birth;
    deathDate = birth + int(random(500));
    opacity = new int[letters.length()];
    for(int i=0;i<letters.length();i++) {
      opacity[i] = int(random(130))+126;
    }
  }
    
  boolean isBorn(int time) {
    return birthDate < time;
  }
  
  boolean isDying(int time) {
    return deathDate - 10 < time;
  }
  
  boolean isDead(int time) {  
    return deathDate < time;
  }
  
  boolean isAlive(int time) {
    return isBorn(time) && !isDead(time);
  }
  
  void display(int time) {
    if (!isAlive(frame)) {
      return;
    }
    for(int i=0;i<position;i++) {
      int currentOpacity = opacity[i];
      if (isDying(time)) {
        opacity[i] /=2; // should have some function about time to dim slowly.
      }
      fill(0, 255, 0, currentOpacity);
      text(letters.charAt(i), xPos, yPos+ i*17);
    }
    if (position < letters.length()) {
      fill(255, 255, 255, 255);
      text("#", xPos, yPos + (position + 1)*17);
      position++;
    } 
  }
  
}

void setup() {
  x = 20;
  y = 20;
  float oldx = x;
  phrases = new Phrase[phrasesShown];
  for (int i=0; i< phrasesShown; i++) {
     phrases[i] = new Phrase(oldx, y + int(random(height/2)), rawTexts[int(random(rawTexts.length))],int(random(40)));
     oldx = oldx + 20 + int(random(30));
  }
  size(800, 600);
  font = createFont(fontName, fontSize, true);
  textFont(font, 20);
  textAlign(CENTER);
}

void draw() {
  background(0);
  //scale(frame/100.0);
  for (int i=0; i< phrases.length; i++) {
    phrases[i].display(frame); 
    if (phrases[i].isDead(frame)) {
      phrases[i] = new Phrase(phrases[i].xPos, y + int(random(height/2)), rawTexts[int(random(rawTexts.length))],int(random(frame+50)));
    }     
  }
  filter(BLUR, 1);
  displayFrame();
  frame++;
}

void displayFrame() {
  fill(255, 255, 255, 255);
  textFont(font, 30);
  text(frame, width - textWidth(""+frame), height-5);
  textFont(font, 20);
}

