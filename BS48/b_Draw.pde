void draw () {
  if (interfaz == 0) { //Menú principal
    image(bubblesBackground, 0, 0); //fondo
    fill(255); //color letra
    textAlign(RIGHT); textFont(letterFont, 30); text("BS", width/2, 40); //alineación del texto para título BS
    textAlign(LEFT); textFont(numberFont, 30); text("48", width/2, 40); //alineación del texto para título 48
    play.display(); //muestra el botón de play
  } else { //juego
    background(#8080FF); //interior del tablero
    for (int i = 0; i < height; i++){ stroke(int(255 - (i*6/height)), 238 - (i*64/height), 86 - (i*27/height)); line(140, i, width - 140, i); } //Fondo gradiante durazno - naranja
    pushStyle(); fill(255, 0, 0, 100); noStroke(); rectMode(CORNERS); rect(140, height-90, width-140, height); //límite de pérdida
    popStyle(); //límite del tablero
    for (int i=1; i < shoots.size(); i++){ //recorre todos los disparos
      (shoots.get(i)).display(); //muestra todos los disparos
      if((shoots.get(i)).mover() && interfaz == 1){ //si impactan
        tablero.set(int(((((shoots.get(i)).getPos(true, false)).x-155)/30)+(12*(((shoots.get(i)).getPos(true, false)).y+15)/30)),  shoots.get(i)); //mueve de disparos a tablero
        shoots.remove(i); //elimina disparo
      } //mueve una burbuja de shoots al tablero cuando hay impacto
    } //busca burbujas que hayan impactado
    mainCannon.display(); //muestra cañones
    (shoots.get(0)).display(); //muestra burbuja del cañón
    for (int i = tablero.size()-1; i>-1; i--){
      (tablero.get(i)).display(); //muestra las burbujas del tablero
      if (((bajamiento>0.98) && ((((tablero.get(i)).getPos(true, false)).x) == height-135)) || ((((tablero.get(i)).getPos(true, false)).y) > height-135)){
        interfaz = 2;
      }
      if ((bajamiento >= 30) && (interfaz == 1) && (i<144)){ (tablero.get(i)).bajar(); tablero.set(i+12, tablero.get(i)); } //baja una linea las burbujas para poder insertar otra fila
    } //baja una fila
    if ((bajamiento >= 30) && (interfaz == 1)){ bajamiento = 0; //reinicia bajamiento para agregar otra fila de burbujas 
      for (int i = 0; i<12; i++){ //repite 12 veces la siguiente operación al cumplirse el tiempo establecido
        tablero.set(i, new Bubble((int(random(0,2)) == 1)? int(random(1,3)):0, false, new PVector((i*30)+155, -15))); (tablero.get(i)).fijar(); // crea una nueva burbuja en al parte superior del tablero y la fija
      }
    } //genera una nueva fila en el tablero
    bajamiento += (interfaz == 1)? (1.5/fps):0; //baja gradualmente las burbujas
    image(leftPanel, 0, 0); image(rightPanel, width-140, 0); strokeWeight(3); stroke(255); //paneles y decorado de bordes
    line(140, 0, 140, height); line(140, 0, width-140, 0); line(140, height, width-140, height); line(width-140, 0, width-140, height); //bordes de tablero
    if (interfaz == 2){
      pushStyle(); fill(0, 100); rectMode(CORNERS); noStroke(); rect(-10, -10, width, height); //oscurecimiento de pérdida
      fill(#BED565); rect(150, 10, width-150, height-100, 25); //menú de pérdida
      textFont(letterFont, 30); replay.display(); //muestra botón de "volver a jugar"
      if(10 < topN){ fill(#0090A6); text("Ganaste", width/2, 100); } else { fill(#FF0000); text("Perdiste", width/2, 100); } //según lógica de 2048, gana o pierde
      popStyle();
    }
  }
}
