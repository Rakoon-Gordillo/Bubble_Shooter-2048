class Button { //botones
  float xPos; float yPos; String texto; float xSize; float ySize; //declaración de variables para botones
  Button(float _XPos, float _YPos, String _texto, float _XSize, float _YSize){ //constructor principal (posición en x y en y, texto del botón y tamaño)
    xPos = _XPos; yPos = _YPos; texto = _texto; xSize = _XSize; ySize = _YSize; //inicializar variables
  }
  Button(float _XPos, float _YPos, String _texto){ this(_XPos, _YPos, _texto, 200, 50); } //constructor de posición y texto
  Button(float _XPos, float _YPos){ this(_XPos, _YPos, "", 200, 50); } //constructor de solo posición
  void isPressed(){ //confirma si está siendo presionado
    if ((mouseButton == LEFT) && interfaz == 0 && (mouseX<xPos+xSize+11) && (xPos-11<mouseX) && (mouseY<yPos+ySize+11) && (yPos-11<mouseY)){ //y de ser el caso
      interfaz = 1; //inicia el juego
    } //verifica que el click se haya hecho en la posición del botón jugar
  }// verifica que el click se haya hecho en la posición de un botón
  void display(){ //muestra el botón
    pushStyle(); stroke(255); fill(#0090A6); //estilo
    rect(xPos, yPos, xSize, ySize, 5); //muestra el botón 
    fill(255); textAlign(CENTER, TOP); textFont(letterFont); //estilo de texto
    text(texto, xPos+100, yPos); //pone el texto en el botón
    popStyle(); //devuelve el estilo anterior
  } //muestra el recuadro y el texto del botón 
}
