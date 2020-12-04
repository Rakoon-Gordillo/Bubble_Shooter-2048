void draw () {
  if (interfaz == 0) { //Menú principal
    image(bubblesBackground, 0, 0); //fondo
    fill(255); //color letra
    textAlign(RIGHT); textFont(letterFont, 30); text("BS", width/2, 40); //alineación del texto para título BS
    textAlign(LEFT); textFont(numberFont, 30); text("48", width/2, 40); //alineación del texto para título 48
    play.display(); //muestra el botón de play
  } else if(interfaz == 1){ //juego
    background(#8080FF); //interior del tablero
    for (int i = 0; i < height; i++){ stroke(int(255 - (i*6/height)), 238 - (i*64/height), 86 - (i*27/height)); line(140, i, width - 140, i); } //Transición fondo durazno - naranja
    for (int i=1; i < shoots.size(); i++){ //recorre todos los disparos
      (shoots.get(i)).display(); //muestra todos los disparos
      if((shoots.get(i)).mover()){ //si impactan
        tablero.add(shoots.get(i)); //mueve de disparos a tablero
        shoots.remove(i); //elimina disparo
      } //mueve una burbuja de shoots al tablero cuando hay impacto
    } //busca burbujas que hayan impactado
    mainCannon.display(); //muestra cañones
    (shoots.get(0)).display(); //muestra burbuja del cañón
    for (int i = tablero.size()-1; i>-1; i--){
      (tablero.get(i)).display(); //muestra las burbujas del tablero
      if (bajamiento >= 30){ (tablero.get(i)).bajar(); } //baja una linea las burbujas para poder insertar otra fila
    } //baja una fila
    if (bajamiento >= 30){ for (int i = 0; i<12; i++){ //repite 12 veces la siguiente operación al cumplirse el tiempo establecido
      tablero.add(new Bubble(0, false, new PVector((i*30)+155, -15))); (tablero.get(tablero.size()-1)).fijar(); // crea una nueva burbuja en al parte superior del tablero y la fija
    }} //genera una nueva fila en el tablero
    bajamiento = (bajamiento>=30)? 0:bajamiento; //verifica si se pude reiniciar el bajamiento para agregar otra fila de burbujas
    line(0, height-90, width, height-90);
    fill(#FF8000); noStroke(); image(leftPanel, 0, 0); image(rightPanel, width-140, 0);//rectMode(CORNER); rect(0, 0, 140, height); rect(width-140, 0, width, height); //paneles laterales
    strokeWeight(3); stroke(255); //decorado bordes
    line(140, 0, 140, height); line(140, 0, width-140, 0); line(140, height, width-140, height); line(width-140, 0, width-140, height); //bordes de tablero
    bajamiento+=(3.0/(2.0*fps)); //baja gradualmente las burbujas
  }
}
