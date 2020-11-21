class Cannon extends Vectoriables{ //relacionado a cañones
  boolean numbers; //responde a "¿el cañon actual es de números?"
  PVector eje; //posición del eje del cañon según actividad
  int cannonSize; //tamaño del cañon según actividad
  boolean activo; //actividad del cañon
  Cannon(boolean _numbers){ //constructor único
    numbers = _numbers; //inicializa booleano de números
    eje = new PVector(); //inicia vectores del eje
  }
  void display(){ //muestra el cañón
    fill(255); stroke(0); strokeWeight(1); //estilo de ejes
    line(eje.x-cannonSize, eje.y, eje.x+cannonSize, eje.y); line(eje.x, eje.y-15 , eje.x, eje.y+15); //ejes del cañón (x y y respectivamente)
    setDirection(eje.x, eje.y); //fija dirección del cañón (50sen)
    quad(eje.x+(20*mouse.y), eje.y-(20*mouse.x), //punto 1
    eje.x+(20*mouse.y)+(90*mouse.x), eje.y-(20*mouse.x)+(90*mouse.y), //punto 2
    eje.x-(20*mouse.y)+(90*mouse.x), eje.y+(20*mouse.x)+(90*mouse.y), //punto 3
    eje.x-(20*mouse.y), eje.y+(20*mouse.x)); //punto 4
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
    }
    return !activo; //retorna el estado contrario para el otro cañón
  }
}
