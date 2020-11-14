ArrayList<Bubble> tablero = new ArrayList<Bubble>(); //arreglo dinámico para las burbujas presentes en el tablero 
ArrayList<Bubble> shoots = new ArrayList<Bubble>(); //arreglo dinámico para las burbujas lanzadas y preparadas para lanzamiento
color nextBubble = color(#FF0000); //color de la siguiente burbuja
int paleta = 8;
float interfaz = 0; //variable de pantalla que se muestra
PFont letterFont, numberFont; //variables para texto
Button play; Button instrucciones; Button con; //botones (Jugar, instrucciones y configuración respectivamente)
Cannon bubbleBlank; Cannon bubbleNumber; //cañones de burbujas (sin y con 2^n respectivamente)
void setup () {
  size(640, 480); //resolución mínima de pantalla
  letterFont = createFont("Bubblegum Sans Regular", 32); numberFont = createFont("Dosis Regular", 32); //fuente de letra y número
  play = new Button(220, 400, "JUGAR"); //genera botón "JUGAR"
  bubbleBlank = new Cannon(false); bubbleNumber = new Cannon(true); //Genera los 2 cañones
  bubbleBlank.setActivo(bubbleNumber.activar());
  shoots.add(new Bubble());
}
