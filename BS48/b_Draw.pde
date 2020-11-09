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
    //pushStyle();
    /*directamente de huevos
    line(width/2-20, height-10, width/2+20, height-10); line(width/2, height-25 , width/2, height+5); //ejes del cañón
    mouse.set(mouseX-(width/2),mouseY-height+10); //posición del mouse respecto al tirador (y distancia según su ejes)
    mouse.normalize(); //vector a distancia 1, hace lo mismo que mouse.mult(50/(sqrt(pow(mouse.x,2)+pow(mouse.y,2)))); el cual fija x=50cos y y=-50sen
    line(width/2,height-10,50*mouse.x+(width/2),50*mouse.y+(height-10)); //trasa la linea al seno*50
    if(mousePressed){ //cuando se presione el mouse
      disparo = true; //se habilita disparo
      d.set(width/2,height-10); //coordenada de la burbuja en el cañón
      pos.set(6.25*mouse.x,6.25*mouse.y); //determina la velocidad de la burbuja
    }
    if(disparo==true){ //durante el disparo
      fill(255, 0, 0); //color de la burbuja
      rectMode(CENTER); //centrar la burbuja al origen
      rect(d.x, d.y, 30, 30, 5); //dibujar la burbuja
      d.add(pos.x, pos.y); //actualiza la posición de la burbuja
      if(d.x > width || d.y > height){ //cuando se salga de ciertas coordenadas
        disparo=false; //inhabilita el disparo
      }
    }
    //popStyle();
    //fin de huevos*/
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
