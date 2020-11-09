class Button {
  float xPos; float yPos; String texto; float xSize; float ySize; //declaración de variables para botones
  Button(float _XPos, float _YPos, String _texto, float _XSize, float _YSize){ //constructor principal
    xPos = _XPos; yPos = _YPos; texto = _texto; xSize = _XSize; ySize = _YSize; //inicializar variables
  }
  Button(float _XPos, float _YPos){
    this(_XPos, _YPos, "");
  }
  Button(float _XPos, float _YPos, String _texto){
    this(_XPos, _YPos, _texto, 200, 50);
  }
  void isPressed(){
    if ((mouseButton == LEFT) && interfaz == 0 && (mouseX<xPos+211) && (xPos-11<mouseX) && (mouseY<yPos+61) && (yPos-11<mouseY)){ //cuando se presione el botón
      interfaz = 1;
    }
  }
  void display(){
    pushStyle();
    stroke(255);
    fill(100);
    rect(xPos, yPos, xSize, ySize, 5);
    fill(255);
    textAlign(CENTER, TOP);
    textFont(letterFont);
    text(texto, xPos+100, yPos);
    popStyle();
  }
}
