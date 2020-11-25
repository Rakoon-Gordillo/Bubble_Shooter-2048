class Cannon extends Vectoriables{ //relacionado a cañones
  boolean numbers; //si dispara números = true, si es vacío = false
  PVector eje; //posición del eje del cañon según actividad
  int cannonSize; //tamaño del cañon según actividad
  boolean activo; //actividad del cañon
  Cannon(boolean _numbers){ numbers = _numbers; eje = new PVector(); } //constructor único que inicializa booleano de números y vectores del eje
  void display(){ //muestra el cañón
    setDirection(eje.x, eje.y); //fija dirección del cañón (50sen)
    fill(100); stroke(0); strokeWeight(1); //estilo del disparador
    quad(eje.x+(mouse.y*cannonSize*4/5), eje.y-(mouse.x*cannonSize*4/5), //punto 1
    eje.x+(mouse.y*cannonSize*4/5)+(mouse.x*18*cannonSize/5), eje.y-(mouse.x*cannonSize*4/5)+(mouse.y*18*cannonSize/5), //punto 2
    eje.x-(mouse.y*cannonSize*4/5)+(mouse.x*18*cannonSize/5), eje.y+(mouse.x*cannonSize*4/5)+(mouse.y*18*cannonSize/5), //punto 3
    eje.x-(mouse.y*cannonSize*4/5), eje.y+(mouse.x*cannonSize*4/5)); //punto 4
    fill(255); //estilo de ejes
    if(numbers){ //para el cañón de números
      pushStyle(); stroke(#0090A6); strokeWeight(cannonSize*4/5); rectMode(CENTER); //estilo
      line(eje.x-6*cannonSize/5, eje.y-6*cannonSize/5, eje.x-6*cannonSize/5, height); line(eje.x+6*cannonSize/5, eje.y-6*cannonSize/5, eje.x+6*cannonSize/5, height);
      arc(eje.x, eje.y, 12*cannonSize/5, 12*cannonSize/5, PI, TWO_PI); //contorno del cargador del cañón
      noStroke(); //estilo
      square(eje.x, eje.y+4*cannonSize/5, cannonSize*8/5); //interior del cargador
      popStyle(); //recobrar memoria de estilo
    } else { //para el cañón vacío
      circle(eje.x, eje.y, cannonSize*3); //contorno del cañón
      fill(#80FFFF); //estilo interior del cargador
      circle(eje.x, eje.y, cannonSize*2); //espacio cargador
    } //renderiza el cañón vacío
  }
  boolean activar(){ return setActivo(true); } //activa el cañón y devuelve falso para parámetro del otro cañón 
  boolean getActivo(){ return activo; } //retorna el estado del cañón (true = principal)
  boolean setActivo(boolean _activo){ //modifica el estado del cañón
    activo = _activo; //importa el estado
    if (_activo){ //de ser principal
      eje.set(width/2, height-15); //modifica ubicación
      cannonSize = 25; //tamaño normal
    } else { //de ser secundario
      eje.set(100+width/2, height-5); //modifica ubicación
      cannonSize = 15; //miniatura
    } //fija el tamaño y la posición de los cañones
    return !activo; //retorna el estado contrario para el otro cañón
  }
}
