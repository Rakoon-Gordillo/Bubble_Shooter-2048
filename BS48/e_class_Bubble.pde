class Bubble extends Vectoriables{ //todo acerca de la burbuja
  boolean activa = true; //determina si una burbuja existe
  PVector p, v, d; //posición de la burbuja, velocidad de la burbuja y distancia entre burbujas
  color bubbleColor; //color de la burbuja
  int n, //grado de 2^n para el número en la burbuja
  s, //índice de sombra de burbujas contiguas
  booleans = 0; //+1 si la dirección de la burbuja está invertida, +2 si la burbuja está en lanzamiento, +4 si es descartable, +8 si debe estar en el tablero
  Bubble(int _n, boolean _state, color _bubbleColor, PVector _p){ //constructor principal (argumentos: int, bool, color, vector)
    activa = true; //da como activa una burbuja
    bubbleColor = _bubbleColor; setDirection(); //asigna color y dirección de la burbuja
    v = new PVector(375*mouse.x/fps, 375*mouse.y/fps); p = _p; //inicializa vectores de velocidad y coordenada de la burbuja respectivamente
    n = _n; //de ser una burbuja con número, es de grado 1, de lo contrario 0
    booleans = (_state)? booleans|2 : booleans&13; //confirma si la burbuja está en lanzamiento o está estática
  } //inicializa las variables iniciales
  Bubble(int _n, boolean _state, color _bubbleColor){ this(_n, _state, _bubbleColor, new PVector(width/2, height-15)); } //constructor con argumentos bool, bool, color
  Bubble(int _n, boolean _state, PVector _p){ this(_n, _state, colorBubble(), _p); } //constructor con argumentos int, bool, vector
  Bubble(int _n){ this(_n, false, colorBubble(), new PVector(width/2, height-15)); } //constructor con argumento int
  Bubble(PVector _p){ activa = false; p = _p; booleans = 8; } //constructor para burbujas abstractas
  color getBubbleColor(){ return bubbleColor; } //conseguir el color de la burbuja
  int getN(){ return n; } //conseguir el grado del número de la burbuja
  PVector getPos(boolean inactiva, boolean displayedPos){
    if(displayedPos){ if (activa || inactiva){ return new PVector(p.x, p.y+bajamiento); } else { return new PVector(0, 0); }
    } else { if (activa || inactiva){ return p; } else { return new PVector(0, 0); }
    }
  } //devuelve la posición de la burbuja
  boolean mover(){ return (booleans & 10) == 8; } //verifica si se puede fijar una burbuja
  void fijar(){ booleans = (booleans & 12) | 8; } //fuerza fijado al tablero
  void fijar(int _i){
    fijar();
  }
  void bajar(){ p.y+=30; } //baja una fila cada burbuja y da perdida en caso de salir de la matriz
  void bajar(int _i){ if(activa){ interfaz = 2; } } //baja una fila cada burbuja y da perdida en caso de salir de la matriz
  void reset(int _mouseButton){ bubbleColor = nextBubble; nextBubble = colorBubble(); n = (resortear || (_mouseButton == LEFT))? nextBubbleN : n; nextBubbleN = (resortear || (_mouseButton == LEFT))? int(random(1,3)):nextBubbleN; booleans = 0; } //resetea la burbuja (exclusiva de la ubicada en el cañón)
  void buscar(color _bubbleColor, int _s){
    boolean presente = false;
    if((_bubbleColor == bubbleColor) && activa && (n == 0)){
      for(int i : encadenadas){ if(i == _s){presente = true;} }
      if(!presente){
        encadenadas.append(_s);
        (tablero.get(_s-12)).buscar(bubbleColor, _s);
        (tablero.get(_s+12)).buscar(bubbleColor, _s);
        (tablero.get(_s-1)).buscar(bubbleColor, _s);
        (tablero.get(_s+1)).buscar(bubbleColor, _s);
      }
    }
  }
  void display(int _i){
    strokeWeight(1); stroke(0); fill(bubbleColor); rectMode(CENTER); //centrar la burbuja al origen
    p.set(((_i%12)*30)+155, int(_i/12)*30-15);
    if (activa){
      rect(p.x, p.y+bajamiento, 30, 30, 5); //dibujar la burbuja
      fill(0);
      if(0<n){textAlign(CENTER, CENTER); textSize(14); text(int(pow(2,n)), p.x, p.y+bajamiento);}
    }
  }
  void sumarN(){ n+=1; }
  void display(){ //mostrar, rebotar y fijar burbujas
    strokeWeight(1); stroke(0); fill(bubbleColor); rectMode(CENTER); //centrar la burbuja al origen
    if ((booleans & 2) == 2){ //para burbujas en lanzamiento
      rect(p.x, p.y, 30, 30, 5); //muestra las burbujas en lanzamiento
      fill(0);
      if(0<n){textAlign(CENTER, CENTER); textSize(14); text(int(pow(2,n)), p.x, p.y);}
      p.add(v); //actualiza la posición de la burbuja
      if(p.x > width-155 || p.x < 155){ v.x = -v.x; booleans = ((booleans & 1) == 0)? booleans | 1 : booleans & 14; } //rebota la burbuja
      if (p.y<-14){ //cuando toca el límite del tablero
        booleans = (booleans & 12) | 8; //fija la burbuja (shoots a tablero)
        p.set((((p.x - 155) % 30) < 15)? int(p.x - ((p.x - 155) % 30)) : int(p.x + 30 - ((p.x - 155) % 30)), -15); //establece la ubicación de la burbuja
      } //impide a la burbuja atravesar el límite superior del tablero
      s = round(12*(p.y-((p.y+15)%30)+15+((((p.y+15)%30)<15)? 0:30))/30+(p.x-((p.x-155)%30)-155+((((p.x-155)%30)<15)? 0:30))/30);
      for(int i = 0; i<6; i++){
        if((-1<(s+(i%3)-1+(int(i/3)-1)*12))&&((((s+(i%3)-1+(int(i/3)-1)*12))<156)||((s<168)&&(i<3)))&&(((i!=0)&&(i!=3))||((s%12)!=0))&&(((i!=2)&&(i!=5))||((s%12)!=11))&&((11<s)||(2<i))){
          d = new PVector (p.x - ((tablero.get(s+(i%3)-1+(int(i/3)-1)*12)).getPos(false, false)).x, p.y - ((tablero.get(s+(i%3)-1+(int(i/3)-1)*12)).getPos(false, true)).y); //determina la distancia de la burbuja disparada a la del tablero
          if (d.mag() < 30){ //si detecta impacto
            if (n == 0){ encadenadas.append(s);
              (tablero.get(s-12)).buscar(bubbleColor, s); (tablero.get(s+12)).buscar(bubbleColor, s); (tablero.get(s-1)).buscar(bubbleColor, s); (tablero.get(s+1)).buscar(bubbleColor, s);
              if (encadenadas.size()>2){ eliminar(); }
            }
            if ((abs(p.y - ((tablero.get(s+(i%3)-1+(int(i/3)-1)*12)).getPos(false, false)).y) > abs(p.x - ((tablero.get(s+(i%3)-1+(int(i/3)-1)*12)).getPos(false, false)).x))&&(((tablero.get(s+(i%3)-1+(int(i/3)-1)*12)).getPos(false, false)).y < p.y)){ //o si golpea por debajo
              p.x = ((tablero.get(s+(i%3)-1+(int(i/3)-1)*12)).getPos(false, false)).x; p.y = ((tablero.get(s+(i%3)-1+(int(i/3)-1)*12)).getPos(false, false)).y+30; //mueve justo debajo
              if(p.y == height - 105){ interfaz = 2; } else {
                if((n == tablero.get(s-12).getN())&&(bubbleColor == tablero.get(s-12).getBubbleColor())){
                  tablero.get(round(12*(p.y-((p.y+15)%30)+15+((((p.y+15)%30)<15)? 0:30))/30+(p.x-((p.x-155)%30)-155+((((p.x-155)%30)<15)? 0:30))/30)-12).sumarN();
                }
                fijar();
                autodestruccion(s);
              } //fija (shoots a tablero)
            } else if ((abs(p.y - ((tablero.get(s+(i%3)-1+(int(i/3)-1)*12)).getPos(false, false)).y) < abs(p.x - ((tablero.get(s+(i%3)-1+(int(i/3)-1)*12)).getPos(false, false)).x)) && (((tablero.get(s+(i%3)-1+(int(i/3)-1)*12)).getPos(false, false)).x < p.x)){ //si golpea por derecha
              p.y = ((tablero.get(s+(i%3)-1+(int(i/3)-1)*12)).getPos(false, false)).y; p.x = ((tablero.get(s+(i%3)-1+(int(i/3)-1)*12)).getPos(false, false)).x+30; //mueve justo a la derecha
              fijar(); //fija (shoots a tablero)
            } else if ((abs(p.y - ((tablero.get(s+(i%3)-1+(int(i/3)-1)*12)).getPos(false, false)).y) < abs(p.x - ((tablero.get(s+(i%3)-1+(int(i/3)-1)*12)).getPos(false, false)).x)) && (((tablero.get(s+(i%3)-1+(int(i/3)-1)*12)).getPos(false, false)).x > p.x)){ // si golpea por izquierda
              p.y = ((tablero.get(s+(i%3)-1+(int(i/3)-1)*12)).getPos(false, false)).y; p.x = ((tablero.get(s+(i%3)-1+(int(i/3)-1)*12)).getPos(false, false)).x-30; //mueve justo a la izquierda
              fijar(); //fija (shoots a tablero)
            } //selecciona la posición en la cual se fijará respecto a la burbuja a la cual impactó
          } //impide que atraviese las burbujas en el tablero
        }
      }
    } else if (((booleans & 8) == 8) && activa){
      rect(p.x, p.y+bajamiento, 30, 30, 5); //dibujar la burbuja
      fill(0);
      if(0<n){textAlign(CENTER, CENTER); textSize(14); text(int(pow(2,n)), p.x, p.y+bajamiento);}
    } else if ((booleans & 14) == 0){ rect(p.x, p.y, 30, 30, 5);
      fill(0);
      if(0<n){textAlign(CENTER, CENTER); textSize(14); text(int(pow(2,n)), p.x, p.y);}
    } //muestra burbuja del cañón
  }
}
