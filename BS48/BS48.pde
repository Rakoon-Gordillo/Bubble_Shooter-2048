ArrayList<Bubble> tablero = new ArrayList<Bubble>(); //Burbujas presentes en el tablero 
ArrayList<Bubble> shoots = new ArrayList<Bubble>(); //Burbujas lanzadas y preparadas para lanzamiento
IntList encadenadas = new IntList(); //Posiciones de las burbujas vacías que serán explotadas
boolean pressed = false, //determina si está presionado alguna tecla del mouse
resortear = false; //determina si al disparar una burbuja se sortea el 2^n presente en el cañón
int _mouseButton = 0, //boton del mouse presionado (itera entre LEFT, CENTER Y RIGHT)
nextBubbleN, //color de la siguiente burbuja
paleta = 5, //cantidad de colores de burbujas en juego (puede variar entre 3 y 8, default = 5)
topN = 2, puntaje = 0; //n más grande y puntaje acumulados
float fps = 20, //cuadros por segundo
bajamiento = 0, //cuanto bajan las burbujas en el tablero
interfaz = 0; //variable de pantalla que se muestra
color nextBubble; //color de la siguiente burbuja
PFont letterFont, numberFont; PImage bubblesBackground, leftPanel, rightPanel; //variables para texto, fondo y paneles
Button play; Button instrucciones; Button con; Button replay; //botones (Jugar, instrucciones y configuración respectivamente)
Cannon mainCannon; //cañones de burbujas (sin y con 2^n respectivamente)
void setup () {
  nextBubble = colorBubble(); nextBubbleN = int(random(1,3)); //sortear siguiente color y n
  size(640, 480); frameRate(fps); background(#EF913E); //resolución mínima de pantalla, cuadros por segundo y color fondo dínamo
  letterFont = createFont("Bubblegum Sans Regular", 32); numberFont = createFont("Dosis Regular", 32); //fuente de letra y número
  bubblesBackground = loadImage("background.png"); leftPanel = loadImage("leftPanel.png"); rightPanel = loadImage("rightPanel.png"); //fondo y paneles
  play = new Button(220, 400, "JUGAR", 0); replay = new Button(220, 300, "Volver a Jugar", 1); //genera botón "JUGAR"
  mainCannon = new Cannon(); //Genera el cañon
  shoots.add(new Bubble(int(random(1,3)))); //genera burbuja del cañón
  for(int i = 0; i<24; i++){ tablero.add(new Bubble((int(random(0,2)) == 1)? int(random(1,3)):0, false, new PVector(((i%12)*30)+155, int(i/12)*30-15))); (tablero.get(i)).fijar(); } //crea 2 filas iniciales del tablero
  for(int i = 24; i<156; i++){ tablero.add(new Bubble(new PVector(((i%12)*30)+155, int(i/12)*30-15))); } //crear burbujas abstractas
}
void eliminar(){
  for(int j = encadenadas.size()-1; j>-1; j--){
    tablero.set(encadenadas.get(j), new Bubble(new PVector(((encadenadas.get(j)%12)*30)+155, int(encadenadas.get(j)/12)*30-15)));
  }
  encadenadas.clear();
}
void autodestruccion(int s){tablero.set(s, new Bubble(new PVector(((s%12)*30)+155, int(s/12)*30-15)));}
