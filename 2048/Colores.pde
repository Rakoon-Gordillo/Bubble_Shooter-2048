class colores{
  
  void escoger(Grillas grillas){
    float sizeX, sizeY;
    float x = 0, y = 0; 
    int largo = grillas.grilla.length;
    sizeX = grillas.nWidth/largo;
    sizeY = grillas.nHeight/largo;
     
    for(int i=0;i<largo;i++){
      for(int j=0;j<largo;j++){
        if(grillas.grilla[i][j] != 0){
          fill(255,0,0);
          rect(x+grillas.borderW,y+grillas.borderH,sizeX,sizeY);
        }
        x += sizeX;
      }
      x = 0;
      y+= sizeY;
    }
    fill(0);
  }
}
