class Cannon extends Vectoriables{ //relacionado a cañones
  boolean activo; //actividad del cañon
  Cannon(){} //constructor único
  void display(){ //muestra el cañón
    setDirection(); //fija dirección del cañón (50sen)
    fill(100); stroke(0); strokeWeight(1); //estilo del disparador
    quad(width/2+mouse.y*20, height-15-mouse.x*20, //punto 1
    width/2+mouse.y*20+mouse.x*90, height-15-mouse.x*20+mouse.y*90, //punto 2
    width/2-mouse.y*20+mouse.x*90, height-15+mouse.x*20+mouse.y*90, //punto 3
    width/2-mouse.y*20, height-15+mouse.x*20); //punto 4
    circle(40+width/2, height-5, 40); //próximo disparo
    fill(nextBubble); circle(40+width/2, height-5, 30); if(0 < nextBubbleN){ fill(0); textAlign(CENTER, CENTER); textSize(14); text(int(pow(2, nextBubbleN)), 45+width/2, height-10);} //siguiente burbuja
    fill(#0090A6); circle(width/2, height-15, 75); //cañón
    fill(255); circle(width/2, height-15, 50); //cargador
  }
}
