void setup(){
  fill(0);
  stroke(0);
  strokeWeight(10);
  textSize(20);
  mainFrame = new Controller();
}
public void settings() {
  size(600, 600);
}

Controller mainFrame;

void draw(){
  background(100,100,100);
  mainFrame.colourPicker();
  mainFrame.drawNumbers();
  mainFrame.drawGrid();
  mainFrame.drawScore();
}

void keyPressed(){
  mainFrame.move(key);
}
