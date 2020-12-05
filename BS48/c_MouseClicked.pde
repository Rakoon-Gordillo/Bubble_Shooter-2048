void mousePressed(){
  pressed = true;
  _mouseButton = mouseButton;
} //activa click cuando se oprime el botón del mouse
void mouseReleased() { //cuando está suelto el botón del mouse
  if (pressed){ //y si estaba presionado
    if (interfaz == 1) { //durante juego
      if ((mouseY<(height-90))&&(mouseX<(width-140))&&(140<mouseX)) { //si el mouse se presiona dentro del tablero
        shoots.add(new Bubble((_mouseButton == LEFT)? (shoots.get(0)).getN():0, true, (shoots.get(0)).getBubbleColor())); //genera disparo
        (shoots.get(0)).reset(); //reinicia el que está en el cañón
      } //dispara
    } else if (interfaz == 0){ //presionables en el menú principal
      play.isPressed(); //confirmar el presionado de play
    } else if (interfaz == 2) {
      replay.isPressed();
    }
  } //al hacer click
  pressed = false; //soltar click
} //al soltar el click
