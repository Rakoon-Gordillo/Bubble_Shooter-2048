class Puntaje{
  int puntuacion;
  
  Puntaje(){
    puntuacion = 0;
  }
  
  void drawScore(){
    textAlign(LEFT,TOP);
    text("Puntaje: " + puntuacion,width * 0.1f, height * 0.05f);
    textAlign(CENTER,CENTER);
  }
}
