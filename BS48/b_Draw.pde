void draw () {
  if (interfaz == 0) { //Menú principal
    background(#FF8000); //Naranja
    fill(0); //color letra
    textAlign(RIGHT); textFont(letterFont, 30); text("BS", width/2, 40); //alineación del texto para título BS
    textAlign(LEFT); textFont(numberFont, 30); text("48", width/2, 40); //alineación del texto para título 48
    play.display(); //muestra el botón de play
  } else if(interfaz == 1){ //juego
    background(#8080FF); //interior del tablero
    for (int i=1; i < shoots.size(); i++){ //recorre todos los disparos
      (shoots.get(i)).display(); //muestra todos los disparos
      if((shoots.get(i)).mover()){ //si impactan
        tablero.add(shoots.get(i)); //mueve de disparos a tablero
        shoots.remove(i); //elimina disparo
      }
    }
    bubbleBlank.display(); bubbleNumber.display(); //muestra cañones
    (shoots.get(0)).display(); //muestra burbuja del cañón
    for (int i = tablero.size()-1; i>-1; i--){
      (tablero.get(i)).display(); //muestra las burbujas del tablero
      if (bajamiento >= 30){ (tablero.get(i)).bajar(); } //baja una linea las burbujas para poder insertar otra fila
    }
    bajamiento = (bajamiento>=30)? 0:bajamiento; //verifica si se pude reiniciar el bajamiento para agregar otra fila de burbujas
    fill(#FF8000); noStroke(); rectMode(CORNER); rect(0, 0, 140, height); rect(width-140, 0, width, height); //paneles laterales
    strokeWeight(3); stroke(255); //decorado bordes
    line(140, 0, 140, height); line(140, 0, width-140, 0); line(140, height, width-140, height); line(width-140, 0, width-140, height); //bordes de tablero
    bajamiento+=0.025; //baja gradualmente las burbujas
  }
}
