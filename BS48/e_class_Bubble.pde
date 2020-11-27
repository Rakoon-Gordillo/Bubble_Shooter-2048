class Bubble extends Vectoriables{ //todo acerca de la burbuja
  PVector p, v, d; //posición de la burbuja, velocidad de la burbuja y distancia entre burbujas
  color bubbleColor = colorBubble(); //color de la burbuja
  int n; //grado de 2^n para el número en la burbuja
  int booleans = 0; //+1 si la dirección de la burbuja está invertida, +2 si la burbuja está en lanzamiento, +4 si es descartable, +8 si debe estar en el tablero
  Bubble(int _n, boolean _state, color _bubbleColor, PVector _p){ //constructor principal (argumentos: int, bool, color, vector)
    bubbleColor = _bubbleColor; setDirection(); //asigna color y dirección de la burbuja
    v = new PVector(6.25*mouse.x, 6.25*mouse.y); p = _p; //inicializa vectores de velocidad y coordenada de la burbuja respectivamente
    n = _n; //de ser una burbuja con número, es de grado 1, de lo contrario 0
    booleans = (_state)? booleans|2 : booleans&13; //confirma si la burbuja está en lanzamiento o está estática
  } //inicializa las variables iniciales
  Bubble(int _n, boolean _state, color _bubbleColor){ this(_n, _state, _bubbleColor, new PVector(width/2, height-15)); } //constructor con argumentos bool, bool, color
  Bubble(int _n, boolean _state, PVector _p){ this(_n, _state, colorBubble(), _p); } //constructor con argumentos int, bool, vector
  Bubble(int _n, boolean _state){ this(_n, _state, colorBubble(), new PVector(width/2, height-15)); } //constructor con argumentos int, bool
  Bubble(int _n, color _bubbleColor, PVector _p){ this(_n, false, _bubbleColor, _p); } //constructor con argumentos int, color, vector
  Bubble(int _n, color _bubbleColor){ this(_n, false, _bubbleColor, new PVector(width/2, height-15)); } //constructor con argumentos int, color
  Bubble(boolean _state, color _bubbleColor, PVector _p){ this(0, _state, _bubbleColor, _p); } //constructor con argumentos boolean, color, vector
  Bubble(boolean _state, color _bubbleColor){ this(0, _state, _bubbleColor, new PVector(width/2, height-15)); } //constructor con argumentos boolean, color
  Bubble(int _n, PVector _p){ this(_n, false, colorBubble(), _p); } //constructor con argumento int, vector
  Bubble(int _n){ this(_n, false, colorBubble(), new PVector(width/2, height-15)); } //constructor con argumento int
  Bubble(PVector _p){ this(0, false, colorBubble(), _p); } //constructor con argumento vector
  Bubble(){ this(0, false, colorBubble(), new PVector(width/2, height-15)); } //constructor automático
  color getBubbleColor(){ return bubbleColor; } //conseguir el color de la burbuja
  int getN(){ return n; } //conseguir el grado del número de la burbuja
  void display(){ //mostrar, rebotar y fijar burbujas
    strokeWeight(1); stroke(0); fill(bubbleColor); //estilo de la burbuja
    rectMode(CENTER); //centrar la burbuja al origen
    if ((booleans & 2) == 2){ //para burbujas en lanzamiento
      rect(p.x, p.y, 30, 30, 5); //muestra las burbujas en lanzamiento
      p.add(v); //actualiza la posición de la burbuja
      if(p.x > width-155 || p.x < 155){ v.x = -v.x; booleans = ((booleans & 1) == 0)? booleans | 1 : booleans & 14; } //rebota la burbuja
      if (p.y<16){ //cuando toca el límite del tablero
        booleans = (booleans & 12) | 8; //fija la burbuja (shoots a tablero)
        p.set((((p.x - 155) % 30) < 15)? int(p.x - ((p.x - 155) % 30)) : int(p.x + 30 - ((p.x - 155) % 30)), 15); //establece la ubicación de la burbuja
      } //impide a la burbuja atravesar el límite superior del tablero
      for (Bubble bubbles : tablero){ //for(int i=0; i<shoots.size(); i++){ //recorre burbujas del tablero
        d = new PVector (p.x - (bubbles.getPos()).x, p.y - (bubbles.getPos()).y); //determina la distancia de la burbuja disparada a la del tablero
        if (d.mag() < 30){ //si detecta impacto
          if ((abs(p.y - (bubbles.getPos()).y) < abs(p.x - (bubbles.getPos()).x)) && ((bubbles.getPos()).x < p.x)){ //si golpea por derecha
            p.y = (bubbles.getPos()).y; p.x = (bubbles.getPos()).x+30; //mueve justo a la derecha
            fijar(); //fija (shoots a tablero)
          } else if ((abs(p.y - (bubbles.getPos()).y) < abs(p.x - (bubbles.getPos()).x)) && ((bubbles.getPos()).x > p.x)){ // si golpea por izquierda
            p.y = (bubbles.getPos()).y; p.x = (bubbles.getPos()).x-30; //mueve justo a la izquierda
            fijar(); //fija (shoots a tablero)
          } else { //o si golpea por debajo
            p.x = (bubbles.getPos()).x; p.y = (bubbles.getPos()).y+30; //mueve justo debajo
            fijar(); //fija (shoots a tablero)
          } //selecciona la posición en la cual se fijará respecto a la burbuja a la cual impactó
        } //impide que atraviese las burbujas en el tablero
      } //busca en todas las burbujas del tablero si hay una contra la cual esté impactando
    } else if ((booleans & 8) == 8){ rect(p.x, p.y+bajamiento, 30, 30, 5); //dibujar la burbuja
    } else if ((booleans & 14) == 0){ rect(p.x, p.y, 30, 30, 5); } //muestra burbuja del cañón
  }
  boolean mover(){ return (booleans & 10) == 8; } //verifica si se puede fijar una burbuja
  void reset(){ bubbleColor = colorBubble(); n = 1; booleans = 0; } //resetea la burbuja (exclusiva de la ubicada en el cañón)
  PVector getPos(){ return p; } //devuelve la posición de la burbuja
  void bajar(){ p.add(0, 30); } //baja la burbuja de cierta para poder agregar una nueva
  void fijar(){ booleans = (booleans & 12) | 8; } //fuerza fijado al tablero
}
