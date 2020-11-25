color colorBubble(){ //sortea el color para la burbuja
  color i = #FF0000; //inicializa variable
  switch(int(random(paleta))){ //sortea color aletorio según la cantidad de colores permitidos
    case 0: i = color(#FFFF00); break; //amarillo
    case 1: i = color(#0000FF); break; //azul
    case 2: i = color(#FF0000); break; //rojo
    case 3: i = color(#00FF00); break; //verde
    case 4: i = color(#FF00FF); break; //rosa
    case 5: i = color(#00FFFF); break; //celeste
    case 6: i = color(#FF8000); break; //naranja
    case 7: i = color(#800080); break; //morado
  } //escoge un color aleatorio para la burbuja
  return i; //retorna el color
}
