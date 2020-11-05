byte interfaz = 0; //variable de pantalla que se muetra
PFont letra; PFont number; //variables para texto
Button play; Button instrucciones; Button con;
Cannon bubbleBlank; Cannon bubbleNumber;
void setup () {
  size(640, 480); //resolución mínima de pantalla
  letra = createFont("Bubblegum Sans Regular", 32); number = createFont("Dosis Regular", 10); //fuente de letra y número
  play = new Button(220, 400, "JUGAR");
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
    
    fill(#FF8000);
    noStroke();
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
class Cannon{
  
  Cannon(){
  }
}
