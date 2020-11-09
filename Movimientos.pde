class Maths {
  int i, a, j, len, row, col, temp;

  Maths(Grillas grillas) {
    len = grillas.grilla.length;
  }

  //All left movements and maths
  void combineLeft(Grillas grillas, Puntaje puntuaciones) {
    for (i=0; i<len; i++) {
      for (j=0; j<len-1; j++) {
        if (grillas.grilla[i][j+1] == grillas.grilla[i][j]) {
          grillas.grilla[i][j] += grillas.grilla[i][j+1];
          grillas.grilla[i][j+1] = 0;
          puntuaciones.puntuacion += grillas.grilla[i][j];
        }
      }//end for j
    }//end for i
  }//end combineLeft

  void moveLeft(Grillas grillas) {
    for (i=0; i<len; i++) {
      for (j=1; j<len; j++) {
        if (grillas.grilla[i][j-1] == 0) {
          grillas.grilla[i][j-1] = grillas.grilla[i][j];
          grillas.grilla[i][j] = 0;
        }
      }//end for j
    }//end for i
  }//end moveLeft


  //All right movements and maths
  void combineRight(Grillas grillas, Puntaje puntuaciones ) {
    for (i=len-1; i>=0; i--) {
      for (j=len-1; j>0; j--) {
        if (grillas.grilla[i][j-1] == grillas.grilla[i][j]) {
          grillas.grilla[i][j] += grillas.grilla[i][j-1];
          grillas.grilla[i][j-1] = 0;
          puntuaciones.puntuacion += grillas.grilla[i][j];
        }
      }//end for j
    }//end for i
  }//end combineRight

  void moveRight(Grillas grillas) {
    for (i=0; i<len; i++) {
      for (j=0; j<len-1; j++) {
        if (grillas.grilla[i][j+1] == 0) {
          grillas.grilla[i][j+1] = grillas.grilla[i][j];
          grillas.grilla[i][j] = 0;
        }
      }//end for j
    }//end for i
  }//end moveRight


  //All down movements & maths
  void combineDown(Grillas grillas, Puntaje puntuaciones) {
    for (i=len-1; i>0; i--) {
      for (j=len-1; j>=0; j--) {
        if (grillas.grilla[i-1][j] == grillas.grilla[i][j]) {
          grillas.grilla[i][j] += grillas.grilla[i-1][j];
          grillas.grilla[i-1][j] = 0;
          puntuaciones.puntuacion += grillas.grilla[i][j];
        }
      }//end for j
    }//end for i
  }//end combineDown

  void moveDown(Grillas grillas) {
    for (i=0; i<len-1; i++) {
      for (j=0; j<len; j++) {
        if (grillas.grilla[i+1][j] == 0) {
          grillas.grilla[i+1][j] = grillas.grilla[i][j];
          grillas.grilla[i][j] = 0;
        }
      }//end for j
    }//end for i
  }//end moveDown


  //All up movements & maths
  void combineUP(Grillas grillas, Puntaje puntuaciones) {
    for (i=0; i<len-1; i++) {
      for (j=0; j<len; j++) {
        if (grillas.grilla[i+1][j] == grillas.grilla[i][j]) {
          grillas.grilla[i][j] += grillas.grilla[i+1][j];
          grillas.grilla[i+1][j] = 0;
          puntuaciones.puntuacion += grillas.grilla[i][j];
        }
      }//end for j
    }//end for i
  }//end combineUP

  void moveUP(Grillas grillas) {
    for (i=1; i<len; i++) {
      for (j=0; j<len; j++) {
        if (grillas.grilla[i-1][j] == 0) {
          grillas.grilla[i-1][j] = grillas.grilla[i][j];
          grillas.grilla[i][j] = 0;
        }
      }//end for j
    }//end for i
  }//end moveUP
}
