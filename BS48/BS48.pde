ArrayList<Bubble> tablero = new ArrayList<Bubble>(); //arreglo dinámico para las burbujas presentes en el tablero 
ArrayList<Bubble> shoots = new ArrayList<Bubble>(); //arreglo dinámico para las burbujas lanzadas y preparadas para lanzamiento
boolean pressed = false; //determina si está presionado alguna tecla del mouse
int _mouseButton = 0;
float fps = 20;
color nextBubble = colorBubble(); //color de la siguiente burbuja
int paleta = 5; //cantidad de colores de burbujas en juego (puede variar entre 3 y 8, default = 5)
float bajamiento = 0; //cuanto bajan las burbujas en el tablero
float interfaz = 0; //variable de pantalla que se muestra
PFont letterFont, numberFont; PImage bubblesBackground, leftPanel, rightPanel; //variables para texto, fondos y paneles
Button play; Button instrucciones; Button con; //botones (Jugar, instrucciones y configuración respectivamente)
Cannon mainCannon; //cañones de burbujas (sin y con 2^n respectivamente)
void setup () {
  size(640, 480); //resolución mínima de pantalla
  background(#EF913E); //Dinamo
  frameRate(fps);
  letterFont = createFont("Bubblegum Sans Regular", 32); numberFont = createFont("Dosis Regular", 32); //fuente de letra y número
  bubblesBackground = loadImage("background.png"); leftPanel = loadImage("leftPanel.png"); rightPanel = loadImage("rightPanel.png"); //fondo y paneles
  play = new Button(220, 400, "JUGAR"); //genera botón "JUGAR"
  mainCannon = new Cannon(); //Genera el cañon
  shoots.add(new Bubble(int(random(1,3)))); //genera burbuja del cañón
  for(int i = 0; i<24; i++){ tablero.add(new Bubble(0, false, new PVector(((i%12)*30)+155, int(i/12)*30-15))); (tablero.get(i)).fijar(); } //crea 2 filas iniciales del tablero
}
