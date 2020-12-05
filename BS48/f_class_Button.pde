class Button { //botones
  float xPos, yPos, xSize, ySize; String texto; int id; //declaración de variables para botones
  Button(float _XPos, float _YPos, String _texto, float _XSize, float _YSize, int _id){ //constructor principal (posición en x y en y, texto del botón y tamaño)
    xPos = _XPos; yPos = _YPos; texto = _texto; xSize = _XSize; ySize = _YSize; id = _id ;//inicializar variables
  }
  Button(float _XPos, float _YPos, String _texto, int _id){ this(_XPos, _YPos, _texto, 200, 50, _id); } //constructor de posición y texto
  Button(float _XPos, float _YPos, int _id){ this(_XPos, _YPos, "", 200, 50, _id); } //constructor de solo posición
  void display(){ //muestra el botón
    pushStyle(); stroke(255); fill(#0090A6); rectMode(CORNER); //estilo
    rect(xPos, yPos, xSize, ySize, 5); //muestra el botón 
    fill(255); textAlign(CENTER, TOP); textFont(letterFont); //estilo de texto
    text(texto, xPos+100, yPos); //pone el texto en el botón
    popStyle(); //devuelve el estilo anterior
  } //muestra el recuadro y el texto del botón 
  void isPressed(){ //confirma si está siendo presionado
    if ((mouseButton == LEFT) && (mouseX<xPos+xSize+11) && (xPos-11<mouseX) && (mouseY<yPos+ySize+11) && (yPos-11<mouseY)){ //y de ser el caso
      switch (id){
        case 0:
          interfaz = 1; //inicia el juego
        break;
        case 1:
          while (shoots.size()>1){ shoots.remove(1); } //deja nomás el disparo del cañón presente
          while (tablero.size()>0){ tablero.remove(tablero.size()-1); } //borra todos los elementos de tablero
          (shoots.get(0)).reset(LEFT); //reinicia el disparo
          for(int i = 0; i<24; i++){ tablero.add(new Bubble((int(random(0,2)) == 1)? int(random(1,3)):0, false, new PVector(((i%12)*30)+155, int(i/12)*30-15))); (tablero.get(i)).fijar(); } //crea 2 filas iniciales del tablero
          topN = 2; puntaje = 0; bajamiento = 0; nextBubble = colorBubble(); nextBubbleN = int(random(1,3));
          interfaz = 1; //inicia el juego
        break;
      }
    }
  }// verifica que el click se haya hecho en la posición de un botón
}
