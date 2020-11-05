PVector mouse, pos; //vector - coordenadas mouse, tirador y memoria mouse
float x,y,dx,dy;
boolean disparo;
float modMouse;
 
void setup(){
  size(640,480);
  mouse = new PVector(); //vector - coordenadas mouse
  pos = new PVector();
  disparo = false;
}
void draw(){
  background(200);
   
  //redibujado de ejes
  line(width/2-20, height-10, width/2+20, height-10); //eje X
  line(width/2, height-25 , width/2, height+5); //eje Y
 
  mouse.x = mouseX; //actualiza el x del vector según la posición del mouse respecto al origen del tablero
  mouse.y = mouseY; //actualiza el y del vector según la posición del mouse respecto al origen del tablero
  
  mouse.sub(width/2,height-10); //posición del mouse respecto al tirador (y distancia según su ejes)
  modMouse = sqrt((mouse.x*mouse.x)+(mouse.y*mouse.y)); //distancia del tirador al mouse
  //mouse.normalize();
  mouse.x /= modMouse; //mouse.x toma el valor del cos(ángulo_del_tirador)
  mouse.y /= modMouse; //mouse.y toma el valor del -sen(ángulo_del_tirador)
  mouse.mult(50); //multiplica el seno y el cos por 50
  
  
  translate(width/2,height-10); //translada el origen al centro
  line(0,0,mouse.x,mouse.y); //trasa la linea al seno*50
  fill(255,0,0); //traza la linea al cos*50
   
  if(mousePressed){ //cuando se presione el mouse
    disparo = true; //se habilita disparo ¿?
    dx=0.0; //coordenada x de la burbuja en el tirador
    dy=0.0; //coordenada y de la burbuja en el tirador
    pos.x = (mouse.x/8); //determina la velocidad en x de la burbuja
    pos.y = (mouse.y/8); //determina la velocidad en y de la burbuja
  }
   
   
  if(disparo==true){ //durante el disparo
    fill(255, 0, 0); //color de la burbuja
    rectMode(CENTER); //centrar la burbuja al origen
    rect(dx, dy, 30, 30, 5); //dibujar la burbuja
    dx += pos.x; //actualiza la posición x de la burbuja
    dy += pos.y; //actualiza la posición y de la burbuja
    if(dx > width || dy > height){ //cuando se salga de ciertas coordenadas
      disparo=false; //inhabilita el disparo
    }
  }
}
