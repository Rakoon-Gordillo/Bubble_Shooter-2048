class Cannon extends Vectoriables{
  boolean numbers; //responde a "¿el cañon actual es de números?"
  PVector eje; //posición del eje del cañon según actividad
  int cannonSize; //tamaño del cañon según actividad
  boolean activo; //actividad del cañon
  Cannon(boolean _numbers){
    numbers = _numbers;
    eje = new PVector(); //inicia vectores del eje
  }
  void display(){
    strokeWeight(1);
    stroke(0);
    line(eje.x-cannonSize, eje.y, eje.x+cannonSize, eje.y); line(eje.x, eje.y-15 , eje.x, eje.y+15); //ejes del cañón (x y y respectivamente)
    setDirection(eje.x, eje.y);
    line(eje.x, eje.y, 50*mouse.x+eje.x,50*mouse.y+eje.y); //traza la línea-cañón al seno*50
  }
  boolean activar(){
    return setActivo(true);
  }
  boolean getActivo(){
    return activo;
  }
  boolean setActivo(boolean _activo){
    activo = _activo;
    if (_activo){
      eje.set(width/2, height-15);
      cannonSize = 25;
    } else {
      eje.set(100+width/2, height-5);
      cannonSize = 15;
    }
    return !activo;
  }
}
