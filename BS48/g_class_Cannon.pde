class Cannon extends Vectoriables{ //relacionado a cañones
  boolean numbers = true; //si dispara números = true, si es vacío = false
  boolean activo; //actividad del cañon
  Cannon(){} //constructor único
  void display(){ //muestra el cañón
    setDirection(); //fija dirección del cañón (50sen)
    fill(100); stroke(0); strokeWeight(1); //estilo del disparador
    quad(width/2+mouse.y*20, height-15-mouse.x*20, //punto 1
    width/2+mouse.y*20+mouse.x*90, height-15-mouse.x*20+mouse.y*90, //punto 2
    (width/2)-(mouse.y*20)+(mouse.x*90), height-15+(mouse.x*20)+(mouse.y*90), //punto 3
    (width/2)-(mouse.y*20), height-15+(mouse.x*20)); //punto 4
    fill(255); //estilo de ejes
    if(numbers){ //para el cañón de números
      pushStyle(); stroke(#0090A6); strokeWeight(20); rectMode(CENTER); //estilo
      line(width/2-30, height-45, width/2-30, height); line(width/2+30, height-45, width/2+30, height);
      arc(width/2, height-15, 60, 60, PI, TWO_PI); //contorno del cargador del cañón
      noStroke(); //estilo
      square(width/2, height+5, 40); //interior del cargador
      popStyle(); //recobrar memoria de estilo
    } else { //para el cañón vacío
      circle((width/2), height-15, 75); //contorno del cañón
      fill(#80FFFF); //estilo interior del cargador
      circle((width/2), height-15, 50); //espacio cargador
    } //renderiza el cañón vacío
  }
}
