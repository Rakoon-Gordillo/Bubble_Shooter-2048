byte interfaz = 0; //variable de pantalla que se muetra
PFont letra, number; //variables para texto
PVector mouse, pos, d; //posición respecto al mouse, psoición de la burbuja y velocidad de la burbuja
boolean disparo; //true de haber un disparo activo, false de lo contrario 
Button play; Button instrucciones; Button con; //botón de Jugar, instrucciones, como se juega y configuración
Cannon bubbleBlank; Cannon bubbleNumber; //cañones de burbujas y de 2^n
void setup () {
  size(640, 480); //resolución mínima de pantalla
  letra = createFont("Bubblegum Sans Regular", 32); number = createFont("Dosis Regular", 10); //fuente de letra y número
  play = new Button(220, 400, "JUGAR");
  mouse = new PVector(); pos = new PVector(); d = new PVector(); //inicializa vectores de la posición del mouse, la velocidad, y la coordenada de la burbuja 
  disparo = false;
}
void draw () {
  if (interfaz == 0) { //Menú principal
    background(#FF8000); //Naranja
    fill(0); //color letra
    textAlign(RIGHT); //alineación del texto para título
    textFont(letra, 30);
    text("BS", width/2, 40);
    textAlign(LEFT); //alineación del texto para título
    textFont(number, 30);
    text("48", width/2, 40);
    play.mostrar();
  } else if(interfaz == 1){
    background(#8080FF);
    strokeWeight(1);
    stroke(0);
    //pushStyle();
    //directamente de huevos
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
    //fin de huevos
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
void mouseClicked(){
  play.isPressed();
}
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
  void mostrar(){
    pushStyle();
    stroke(255);
    fill(100);
    rect(xPos, yPos, xSize, ySize, 5);
    fill(255);
    textAlign(CENTER, TOP);
    textFont(letra);
    text(texto, xPos+100, yPos);
    popStyle();
  }
  void presionar(){
    interfaz=1;
  }
}
abstract class Vectoriables{
}
class Cannon extends Vectoriables{
  Cannon(){
  }
}
class Bubble extends Vectoriables{
}
