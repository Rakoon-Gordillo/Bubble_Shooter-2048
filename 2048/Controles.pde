class Controller {
  Grillas grillas;
  Maths maths;
  colores Colores;
  Puntaje puntaje;
  int w, a, s, d;
  
  Controller() {
    grillas = new Grillas();
    maths = new Maths(grillas);
    Colores = new colores();
    puntaje = new Puntaje();
    
    w = 0;
    a = 0;
    s = 0;
    d = 0;
    
    grillas.drawNumbers();
  }

  void drawNumbers() {
    grillas.drawNumbers();
  }

  void drawGrid(){
    grillas.drawGrid();  
  }
  
  void colourPicker(){
    Colores.escoger(grillas);
  }
  
  void drawScore(){
    puntaje.drawScore();
  }
  
  void move(char choice) {
    //Upwards movement
    if(choice == 'w'){
      w ++;
      a = 0;
      s = 0;
      d = 0;
      
      for (int i=0; i<grillas.size; i++)
        maths.moveUP(grillas);
        
      maths.combineUP(grillas, puntaje);
      
      for (int i=0; i<grillas.size; i++)
        maths.moveUP(grillas);
    }
    
    //Left Movement
    else if(choice == 'a'){
      w = 0;
      a ++;
      s = 0;
      d = 0;
      
      for (int i=0; i<grillas.size; i++)
        maths.moveLeft(grillas);
        
      maths.combineLeft(grillas, puntaje);
      
      for (int i=0; i<grillas.size; i++)
        maths.moveLeft(grillas);
    }
    
    //Downward Movement
    else if(choice == 's'){
      w = 0;
      a = 0;
      s ++;
      d = 0;
      
      for (int i=0; i<grillas.size; i++)
        maths.moveDown(grillas);
        
      maths.combineDown(grillas, puntaje);
      
      for (int i=0; i<grillas.size; i++)
        maths.moveDown(grillas);
    }
    
    //Right Movement
    else if(choice == 'd'){
      w = 0;
      a = 0;
      s = 0;
      d ++;
      
      for (int i=0; i<grillas.size; i++)
        maths.moveRight(grillas);
        
      maths.combineRight(grillas, puntaje);
      
      for (int i=0; i<grillas.size; i++)
        maths.moveRight(grillas);
    }
    
    if((choice == 'w' || choice == 'a' || choice == 's' || choice == 'd') && (w < 4 && a < 4 && s < 4 && d < 4))
      grillas.addNewNumber();
  }
}
