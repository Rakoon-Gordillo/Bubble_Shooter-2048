void mousePressed(){ pressed = true; } //activa click cuando se oprime el botón del mouse
void mouseReleased() { //cuando está suelto el botón del mouse
  if (pressed){ //y si estaba presionado
    if (interfaz == 1) { //durante juego
      if ((mouseY<(height-90))&&(mouseX<(width-140))&&(140<mouseX)) { //si el mouse se presiona dentro del tablero
        shoots.add(new Bubble((shoots.get(0)).getN(), true, (shoots.get(0)).getBubbleColor())); //genera disparo
        (shoots.get(0)).reset(); //reinicia el que está en el cañón
      }
    }
    if (interfaz == 0){
      play.isPressed(); //confirmar el presionado de play
    }
  }
  pressed = false; //soltar click
}
