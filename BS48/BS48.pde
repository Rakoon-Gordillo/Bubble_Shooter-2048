ArrayList<Bubble> tablero = new ArrayList<Bubble>();
ArrayList<Bubble> shoots = new ArrayList<Bubble>(2);
boolean disparo = false; //indica si hay un disparo activo y si el objeto es de 2^n
boolean n = true; //cañon activo
byte interfaz = 0; //variable de pantalla que se muestra
PFont letra, number; //variables para texto
Button play; Button instrucciones; Button con; //botones (Jugar, instrucciones y configuración respectivamente)
Cannon bubbleBlank; Cannon bubbleNumber; //cañones de burbujas (sin y con 2^n respectivamente)
void setup () {
  size(640, 480); //resolución mínima de pantalla
  letra = createFont("Bubblegum Sans Regular", 32); number = createFont("Dosis Regular", 10); //fuente de letra y número
  play = new Button(220, 400, "JUGAR");
  bubbleBlank = new Cannon(false); bubbleNumber = new Cannon(true);
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
    background(#8080FF); //interior del tablero
    strokeWeight(1);
    stroke(0);
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
void mouseClicked(){
  if (interfaz == 1){
    for(int i=1; i<shoots.size(); i++){
      (shoots.get(i)).displayShoot();
    }
  }
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
  PVector mouse; //posición respecto al mouse
  void setDirection(float x, float y){
    mouse = new PVector(); //inicializa el objetivo a partir de la posición del mouse
    mouse.set(mouseX-x, mouseY-y); //posición del mouse respecto al tirador (y distancia según su ejes)
    mouse.normalize(); //vector a distancia 1, hace lo mismo que mouse.mult(50/(sqrt(pow(mouse.x,2)+pow(mouse.y,2)))); el cual fija x=50cos y y=-50sen
  }
}
class Cannon extends Vectoriables{
  boolean numbers; //responde a "¿el cañon actual es de números?"
  PVector eje; //posición del eje del cañon según actividad
  byte cannonSize; //tamaño del cañon según actividad
  boolean activo; //actividad del cañon
  Cannon(boolean _numbers){
    numbers = _numbers;
    eje = new PVector(); //inicia vectores del eje
  }
  void display(){
    line(eje.x-cannonSize, eje.y, eje.x+cannonSize, eje.y); line(eje.x, eje.y-15 , eje.x, eje.y+15); //ejes del cañón (x y y respectivamente)
    setDirection(eje.x, eje.y);
    line(eje.x, eje.y, 50*mouse.x+eje.x,50*mouse.y+eje.y); //traza la línea-cañón al seno*50
  }
  void setActivo(boolean _activo){
    activo = _activo;
    if (_activo){
      eje.set(width/2, height-10);
      cannonSize = 25;
    } else {
      eje.set(30+width/2, height-5);
      cannonSize = 15;
    }
  }
}
class Bubble extends Vectoriables{
  PVector pos, d; //posición de la burbuja y velocidad de la burbuja
  color bubbleColor; //color de la burbuja
  int n; //grado de 2^n para el número en la burbuja
  boolean state; //estado de la burbuja
  boolean invertido = false; //define si se ha invertido la dirección de la burbuja 
  Bubble(boolean number, boolean _state){
    setDirection(width/2, height-10);
    pos = new PVector(6.25*mouse.x, 6.25*mouse.y); d = new PVector(width/2, height-10); //inicializa vectores de velocidad y coordenada de la burbuja respectivamente
    n = (number)? 0:1; //de ser una burbuja vacía, es de grado 0, de lo contrario 1
    state = _state; //declara el estado de una burbuja
  }
  Bubble(boolean number){
    this(number, false);
  }
  Bubble(){
    this(false);
  }
  void displayShoot(){
    fill(255, 0, 0); //color de la burbuja
    rectMode(CENTER); //centrar la burbuja al origen
    rect(d.x, d.y, 30, 30, 5); //dibujar la burbuja
    if (state){
      d.add(pos.x, pos.y); //actualiza la posición de la burbuja
      if(d.x > width-155 || d.x < 155){ //cuando se salga de ciertas coordenadas
        pos.x = -pos.x; //invierte la dirección de la burbuja
        invertido = !invertido; //cambia entre true y false según sea invertida la burbuja
      }
      if (d.y<16){
      }
    }
  }
}
