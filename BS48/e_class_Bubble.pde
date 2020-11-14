class Bubble extends Vectoriables{
  PVector p, v, d; //posición de la burbuja, velocidad de la burbuja y distancia entre burbujas
  color bubbleColor = color(#FF0000); //color de la burbuja
  int n; //grado de 2^n para el número en la burbuja
  int booleans = 0; //+1 si la dirección de la burbuja está invertida, +2 si la burbuja está en lanzamiento, +4 si es descartable, +8 si debe estar en el tablero
  Bubble(int _n, boolean _state, color _bubbleColor){
    bubbleColor = _bubbleColor;
    setDirection(width/2, height-15);
    v = new PVector(6.25*mouse.x, 6.25*mouse.y); p = new PVector(width/2, height-15); //inicializa vectores de velocidad y coordenada de la burbuja respectivamente
    n = _n; //de ser una burbuja con número, es de grado 1, de lo contrario 0
    booleans = (_state)? booleans|2 : booleans&13;
  }
  Bubble(boolean number, boolean _state, color _bubbleColor){
    this((number)?1:0, _state, _bubbleColor);
  }
  Bubble(int _n, boolean _state){
    this(_n, _state, color(#FF0000));
  }
  Bubble(boolean number, boolean _state){
    this((number)?1:0, _state, color(#FF0000));
  }
  Bubble(int _n){
    this(_n, false, color(#FF0000));
  }
  Bubble(boolean number){
    this((number)?1:0, false, color(#FF0000));
  }
  Bubble(){
    this(0, false, color(#FF0000));
  }
  color getBubbleColor(){ return bubbleColor; }
  int getN(){ return n; }
  void display(){
    fill(bubbleColor); //color de la burbuja
    rectMode(CENTER); //centrar la burbuja al origen
    rect(p.x, p.y, 30, 30, 5); //dibujar la burbuja
    if ((booleans & 2) == 2){
      p.add(v.x, v.y); //actualiza la posición de la burbuja
      if(p.x > width-155 || p.x < 155){ //cuando se salga de ciertas coordenadas
        v.x = -v.x; //invierte la dirección de la burbuja
        booleans = ((booleans & 1) == 0)? booleans|1 : booleans&14;
      }
    }
    if (p.y<16){
      booleans = (booleans & 12) | 8;
      p.set((((p.x - 155) % 30) < 15)? int(p.x - ((p.x - 155) % 30)) : int(p.x + 30 - ((p.x - 155) % 30)), 15);
    }
    if((booleans & 10) == 2){
      for (Bubble bubbles : tablero){ //for(int i=0; i<shoots.size(); i++){
        d = new PVector (p.x - (bubbles.getPos()).x, p.y - (bubbles.getPos()).y);
        if (d.mag() < 30){
          //println((new PVector (p.x - (bubbles.getPos()).x, p.y - (bubbles.getPos()).y)).mag());
          if ((abs(p.y - (bubbles.getPos()).y) < abs(p.x - (bubbles.getPos()).x)) && ((bubbles.getPos()).x < p.x)){
            p.y = (bubbles.getPos()).y;
            p.x = (bubbles.getPos()).x+30;
            booleans = (booleans & 12) | 8;
          } else if ((abs(p.y - (bubbles.getPos()).y) < abs(p.x - (bubbles.getPos()).x)) && ((bubbles.getPos()).x > p.x)){
            p.y = (bubbles.getPos()).y;
            p.x = (bubbles.getPos()).x-30;
            booleans = (booleans & 12) | 8;
          } else {
            p.x = (bubbles.getPos()).x;
            p.y = (bubbles.getPos()).y+30;
            booleans = (booleans & 12) | 8;
          }
        }
      } 
    }
  }
  boolean mover(){
    return (booleans & 10) == 8;
  }
  void reset(){
    bubbleColor = colorBubble(); n = (bubbleNumber.getActivo())?1:0; booleans = 0;
  }
  PVector getPos(){
    return p;
  }
}
