void draw () {
  if (interfaz == 0) { //Menú principal
    background(#FF8000); //Naranja
    fill(0); //color letra
    textAlign(RIGHT); textFont(letterFont, 30); text("BS", width/2, 40); //alineación del texto para título BS
    textAlign(LEFT); textFont(numberFont, 30); text("48", width/2, 40); //alineación del texto para título 48
    play.display(); //muestra el botón de play
  } else if(interfaz == 1){
    background(#8080FF); //interior del tablero
    bubbleBlank.display(); bubbleNumber.display();
    for (int i=0; i < shoots.size(); i++){ //for(int i=0; i<shoots.size(); i++){
      (shoots.get(i)).display();
      if((shoots.get(i)).mover()){
        tablero.add(shoots.get(i));
        shoots.remove(i);
      }
    }
    for (Bubble burbuja : tablero){
      burbuja.display();
    }
    fill(#FF8000);
    noStroke();
    rectMode(CORNER);
    rect(0, 0, 140, height);
    rect(width-140, 0, width, height);
    strokeWeight(3);
    stroke(255);
    line(140, 0, 140, height);
    line(140, 0, width-140, 0);
    line(140, height, width-140, height);
    line(width-140, 0, width-140, height);
  }
}
