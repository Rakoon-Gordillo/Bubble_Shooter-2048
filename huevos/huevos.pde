PVector mouse, pos, d; //vector - coordenadas mouse, tirador y memoria mouse
float x,y,dx,dy;
boolean disparo;
void setup(){
  size(640,480);
  mouse = new PVector(); pos = new PVector(); d = new PVector(); //inicializa vectores de la posición del mouse, la velocidad, y la coordenada de la burbuja 
  disparo = false;
}
void draw(){
  background(200);
  line(width/2-20, height-10, width/2+20, height-10); line(width/2, height-25 , width/2, height+5); //ejes del cañón
  
  mouse.set(mouseX-(width/2),mouseY-height+10); //posición del mouse respecto al tirador (y distancia según su ejes)
  //mouse.mult(50/(sqrt(pow(mouse.x,2)+pow(mouse.y,2))));// torna el valor de x=50cos y y=-50sen
  mouse.normalize(); //vector a distancia 1
  line(width/2,height-10,50*mouse.x+(width/2),50*mouse.y+(height-10)); //trasa la linea al seno*50
  
  if(mousePressed){ //cuando se presione el mouse
    disparo = true; //se habilita disparo ¿?
    d.set(width/2,height-10); //coordenada de la burbuja en el cañón
    pos.set(6.25*mouse.x,6.25*mouse.y); //determina la velocidad de la burbuja
  }
  
  if(disparo==true){ //durante el disparo
    fill(255, 0, 0); //color de la burbuja
    rectMode(CENTER); //centrar la burbuja al origen
    rect(d.x, d.y, 30, 30, 5); //dibujar la burbuja
    d.add(pos.x, pos.y); //actualiza la posición de la burbuja
    if(d.x > width || d.y > height){ //cuando se salga de ciertas coordenadas
      disparo=false; //inhabilita el disparo
    }
  }
}
