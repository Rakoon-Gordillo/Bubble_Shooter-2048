abstract class Vectoriables{ //clase encargada del vector que opera sobre la ubicación del mouse
  PVector mouse; //posición respecto al mouse
  void setDirection(float x, float y){ //definir vector=1 respecto a la posición del mouse
    mouse = new PVector(); //inicializa el objetivo a partir de la posición del mouse
    mouse.set(mouseX-x, mouseY-y); //posición del mouse respecto al tirador (y distancia según su ejes)
    mouse.normalize(); //vector a distancia 1, hace lo mismo que mouse.mult(50/(sqrt(pow(mouse.x,2)+pow(mouse.y,2)))); el cual fija x=50cos y y=-50sen
  } //proporciona el vector base del mouse a magnitud 1
}
