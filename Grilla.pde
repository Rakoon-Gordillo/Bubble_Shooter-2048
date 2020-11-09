class Grillas {
  float grilla[][];
  int size;
  float borderW, borderH, nWidth, nHeight;

  Grillas() {
    borderW = width * 0.1f;
    borderH = height * 0.1f;
    nWidth = width * 0.8f;
    nHeight = height * 0.8f;
    
    size = 5;
    grilla = new float[size][size]; 
    
    int rand1 = (int)random(4);
    int rand2 = (int)random(4);
    grilla[rand1][rand2] = 2;
     
    rand1 = (int)random(4);
    rand2 = (int)random(4);
    do{
      rand1 = (int)random(4);
      rand2 = (int)random(4);
      grilla[rand1][rand2] = 2.0f;
    }while(grilla[rand1][rand2] != 2);
  }

  void drawNumbers() {
    int i, j;
    float halfX, halfY, tempX, tempY;
    tempX = (nWidth/size*2);
    tempY = (nHeight/size);
    halfX = (nWidth/size)/2; 
    halfY = (nHeight/size)/2;

    for (i=0; i<size; i++) {
      tempY = (nHeight/size)*(i+1);
      for (j=0; j<size; j++) {
        tempX = (nWidth/size) * (j+1);
        if(grilla[i][j] != 0)
          text((int) grilla[i][j], tempX-halfX + borderW, tempY-halfY + borderH);
      }
    }
  }
  
  void drawGrid(){
    int i;
    float posX, posY;
    
    for (i=0; i<=size; i++) {
      posX = (nWidth/size)*(i);
      posY = (nHeight/size)*(i);
      line(posX + borderW, borderH, posX + borderW, height - borderH);
      line(borderW, posY + borderH, width - borderW, posY + borderH);
    } 
  }
  
  void addNewNumber(){
    boolean placed = false;
    boolean full = true;
    int i = (int) random(size), j = (int) random(size);
    
    for(int a = 0; a < size; a++){
      for(int b = 0; b < size; b++){
        if(grilla[a][b] == 0){
          full = false; 
        }
      }
    }
      
    do{
      if(grilla[i][j] == 0){
        grilla[i][j] = 2; 
        placed = true;
      }else{
        i = (int) random(size);
        j = (int) random(size);
      }
    }while(placed != true && full != true);
  }
  
  
}
