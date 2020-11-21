ArrayList<Bubble> tablero = new ArrayList<Bubble>(); //arreglo dinámico para las burbujas presentes en el tablero 
ArrayList<Bubble> shoots = new ArrayList<Bubble>(); //arreglo dinámico para las burbujas lanzadas y preparadas para lanzamiento
boolean pressed = false; //determina si está presionado alguna tecla del mouse
color nextBubble = colorBubble(); //color de la siguiente burbuja
int paleta = 5; //cantidad de colores de burbujas en juego (puede variar entre 3 y 8, default = 5)
float bajamiento = 0; //cuanto bajan las burbujas en el tablero
float interfaz = 0; //variable de pantalla que se muestra
PFont letterFont, numberFont; //variables para texto
Button play; Button instrucciones; Button con; //botones (Jugar, instrucciones y configuración respectivamente)
Cannon bubbleBlank; Cannon bubbleNumber; //cañones de burbujas (sin y con 2^n respectivamente)
void setup () {
  size(640, 480); //resolución mínima de pantalla
  letterFont = createFont("Bubblegum Sans Regular", 32); numberFont = createFont("Dosis Regular", 32); //fuente de letra y número
  play = new Button(220, 400, "JUGAR"); //genera botón "JUGAR"
  bubbleBlank = new Cannon(false); bubbleNumber = new Cannon(true); //Genera los 2 cañones
  bubbleBlank.setActivo(bubbleNumber.activar()); //activa el cañón de burbujas vacías como el principal y el de números como secundario
  shoots.add(new Bubble()); //genera burbuja del cañón
  for(int i = 0; i<24; i++){ tablero.add(new Bubble(0, false, new PVector(((i%12)*30)+155, int(i/12)*30-15))); (tablero.get(i)).fijar(); } //crea 2 filas iniciales del tablero
}
