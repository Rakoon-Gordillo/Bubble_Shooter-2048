PVector mouse,center,pos;
float x,y,dt,v,dx,dy;
boolean disparo;
float modMouse;
 
void setup(){
  size(640,480);
  mouse = new PVector(mouseX,mouseY);
  center = new PVector(width/2,height-10);
  pos = new PVector(0,0);
  dt = 0.01;// variable para aumentar la posición en "x" y en "y"
  v = 0.005;//
  dx = 0.0;
  dy=0.0;
  disparo = false;
}
void draw(){
   
  background(200);
   
  //redibujado de ejes
  line(width/2-20, height-10, width/2+20, height-10); //eje X
  line(width/2, height-25 , width/2, height+5); //eje Y
 
  mouse.x = mouseX; //actualiza el x del vector según la posición del mouse
  mouse.y = mouseY; //actualiza el y del vector según la posición del mouse
  
  mouse.sub(center);
  modMouse = sqrt((mouse.x*mouse.x)+(mouse.y*mouse.y));
  //mouse.normalize();
  mouse.x /= modMouse;
  mouse.y /= modMouse;
  mouse.mult(50);
  
  
  translate(width/2,height-10);
  line(0,0,mouse.x,mouse.y);
  fill(255,0,0);
   
  if(mousePressed){
    disparo = true;
    dx=0.0;
    dy=0.0;
    pos.x = (mouse.x/8);
    pos.y = (mouse.y/8);
  }
   
   
  if(disparo==true){
     
    fill(255, 0, 0);
    rectMode(CENTER);
    rect( dx, dy, 30, 30, 5);
    dx += v*dt + pos.x;
    dy += v*dt + pos.y;    
     
    if(dx > width || dy > height){
      disparo=false;
       
    }
    else{
      disparo=true;
    }
  }
   
}
