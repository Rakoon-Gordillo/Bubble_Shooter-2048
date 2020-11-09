# Bubble_Shooter-2048
Proyecto Programación Orientada a Objetos.

Por **Juan Gordillo** y **Manuel Maya**, grupo **5**.

## Requerimientos

- IDE de processing.
- Java 7 o superior.

## Como ejecutar

Para ejecutar el juego tienes que copiar el codigo en Processing y estar con la version integrada de Java.

## Proceso
Nuestro proyecto inicio como una idea de realizar una innovacion dentro de los juegos de Tile-Matching, por lo que nos basamos en la combinacion de un bubble shooter con el juego de 2048 ya que podriamos realizar algo nuevo a partir de algo ya creado como todo en esta vida la inspiracion siempre viene de una parte la cual ya existe.
En primer lugar debemos realizar los 2 juegos por separado el bubble shooter y el 2048.
## Bubble shooter
Para la realización de este, se comenzó por crear la pantalla de inicio. Para esta, se buscaron fuentes apropiadas para los números (*Dosis Regular* en tamaño **40**) y la letra (*Bubblegum Sans Regular*, en tamaño **40**), de tal manera que fuese más llamativo.

Seguido de esto, se implementó la clase ```Button``` para los botones, de tal forma que cada se pudiesen hacer varios botones a la vez y en los diferentes menús; empezando por el botón *Jugar* del menú de inicio. Esta contiene los métodos:

+ ```isPressed```: Verifica si se está presionando el botón, y de ser cierto, llama a la función ```mousePressed```, con la cual se activa la función del botón.
+ ```display```: Se encarga de mostrar el botón en el respectivo menú.

Durante este proceso, se empezó a diseñar un modelo de cañón y burbujas para los tiradores que se encuentran en la parte inferior de la pantalla al comenzar el juego, a partir de ejes. Esta sección de código se fue perfeccionando y resulto de la siguiente forma:

```
line(width/2-20, height-10, width/2+20, height-10); line(width/2, height-25 , width/2, height+5); //ejes del cañón
    mouse.set(mouseX-(width/2),mouseY-height+10); //posición del mouse respecto al tirador (y distancia según su ejes)
    mouse.normalize(); //vector a distancia 1, hace lo mismo que mouse.mult(50/(sqrt(pow(mouse.x,2)+pow(mouse.y,2)))); el cual fija x=50cos y y=-50sen
    line(width/2,height-10,50*mouse.x+(width/2),50*mouse.y+(height-10)); //trasa la linea al seno*50
    if(mousePressed){ //cuando se presione el mouse
      disparo = true; //se habilita disparo
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
```

Al final, se unificó con el código original, con los que se formaron las clases ```Cannon``` y ```Bubble```.

La clase ```Cannon``` es la encargada del movimiento, mostrado y comportamiento general de los cañones. Sus métodos son:

+ ```display```: Se encarga de mostar el cañón en el tablero.
+ ```setActivo```: LLama al método ```activar``` con valor ```true```.
+ ``` activar```: Se encarga de establecer el cañón como principal y devuelve el booleano ```false```, de tal manera que pueda ser usado para desactivar el otro cañón.
+ ```getActivo```: Devuelve un valor booleano que determina si dicho cañón es principal o secundario.

La clase ```Bubble``` es la encargada del movimiento, mostrado y comportamiento general de las burbujas. Sus métodos son:

+ ```getBubbleColor```: Se encarga de devolver el color de cierta burbuja (trivial en este punto de avance del juego).
+ ```getN``` : Devuelve el valor para el grado del número en la burbuja (no implementado correctamente aún).
+ ```display```: Muestra la burbuja. Además, le da movimiento en caso de haberse disparado.
+```mover```: Se encarga de transladar la burbuja del arreglo shoots (que guarda la información de las burbujas en movimiento en el tablero y la que tiene el cañón) al arreglo tablero (que guarda las burbujas que se fijan en el tablero).
+ ```reset```: Al disparar una burbuja, esta se duplica en el arreglo shoots, de tal manera que se le pueda aparentar movimiento desde el cañón. Al duplicarla, este método se encarga de reiniciar las propiedades de la burbuja en el cañón (la original) para poder repetir el proceso.
+ ```getPos```: Devuelve la posición de la burbuja como vector.

Debido a que estas 2 funciones requerían información sobre la posición del *mouse*, bien sea para alinear el cañón o bien sea para dirigir la burbuja en la dirección correcta, se implemento la clase abstracta ```Vectoriables```, la cual guarda un vector que tiene la posición del *mouse* respecto al cañón, pero cuya magnitud se mantiene en 50 al utilizar el método ```setDirection```, encargado de alinear el cañón respecto al *mouse* y de dirigir la burbuja en dirección al *mouse* al momento de disparar (el cual se activa con la función ```mouseClicked```).

Debido a varios problemas en la construcción del código, como lo fueron la instalación del código a objetos, el detector de impacto de las burbujas respecto a otras burbujas en el tablero, la necesidad de varios métodos para las burbujas y el cañón, y el perfeccionamiento en el funcionamiento de estos, está para su próxima implementación:
+ Una guía durante el disparo de las burbujas
+ Los números dados por *2^n* de cada burbuja según se vayan combinando para que dicho *n* vaya aumentando.
+ El movimiento de las burbujas hacia la parte inferior del tablero, para generar más burbujas aleatoriamente.
+ El diseño, texturas y estética de los cañones
+ Los puntajes durante juego y demás estadísticas.
+ Un menú para guardar los mejores puntajes.
+ Un menú de configuración para modificar la dificultad y estética del juego a gusto del usuario.
+ Manual de juego.
+ Sensor de pérdida.

## 2048
Primero debemos saber que es un 2048, el juego tiene como objetivo deslizar baldosas en una cuadrícula para combinarlas y crear una baldosa con el número 2048. Se lo considera como un rompecabezas de deslizamiento, fue desarrollado por primera vez por: Gabriele Cirulli.
La realizacion de este juego se hizo por medio de objetos en Processing de Java.

Para la elaboración de este, en primer lugar planteamos hacer una grilla para ubicar los bloques; cabe destacar la realizacion de la grilla de 5x5, luego de eso viene la creacion de los bloques y además de eso los números que van contenidos dentro de estos. Al realizar los bloques se debía idear la combinacion de bloques idénticos, con lo que se realizó un cálculo para poder combinar los bloques de igual número y realizar la duplicación del número en el centro. Cada uno de estos calculos se realizó para el movimiento en cada dirección. Un problema que ocurrió durante esto fue la creación de diferentes colores para cada bloque de cada número, pero al no poderlo realizar se dejaron todos los bloques de un mismo color, el juego termina cuando el jugador se queda sin opciones de combinar los bloques, y estan llenas cada una de las casillas de la grilla. Para realizar este juego se crearon 5 clases las cuales son:
+ Clase ```colores```: En esta clase se realiza el pintado de los bloques con color rojo y ademas de eso se ubican los bloques en la pantalla.
+ Clase ```grilla```: En esta clase se realiza la grilla que aparece en pantalla y ademas se definen los bloques y como van a estar, y su aparición en la pantalla.
+ Clase ```maths```: En esta clase se realizan todos los cálculos para la combinacion de los bloques en cada una de las direcciones.
+ Clase ```puntaje```: En esta clase se da la puntuacion y se dibuja en el tablero.
+ Clase ```controller```: Como su nombre lo indica, esta clase es el cerebro del juego ya que esta hereda los cálculos de las demas, y los lleva a la pestaña principal la cual tiene como nombre ```central```, para que se ejecute el juego y todos sus procesos.
