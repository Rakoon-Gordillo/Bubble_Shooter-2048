# Bubble_Shooter-2048
Proyecto Programación Orientada a Objetos.

Por **Juan Gordillo** y **Manuel Maya**, grupo **5**.

## Requerimientos

- IDE de processing.
- Java 7 o superior.

## Como ejecutar

Para ejecutar el juego tienes que copiar el codigo en Processing y estar con la version integrada de java.

## Proceso
Nuestro proyecto inicio como una idea de realizar una innovacion dentro de los juegos de tile-matching, por lo que nos basamos en la combinacion de un bubble shooter con el juego de 2048 ya que podriamos realizar algo nuevo a partir de algo ya creado como todo en esta vida la inspiracion siempre viene de una parte la cual ya existe.
En primer lugar debemos realizar los 2 juegos por separado el bubble shooter y el 2048.
## Bubble shooter
Para la realización de este, se comenzó por crear la pantalla de inicio. Para esta, se buscaron fuentes apropiadas para los números (*Dosis Regular* en tamaño **40**) y la letra (*Bubblegum Sans Regular*, en tamaño **40**), de tal manera que fuese más llamativo.

Seguido de esto, se implementó la clase ```Button``` para los botones, de tal forma que cada se pudiesen hacer varios botones a la vez y en los diferentes menús; empezando por el botón *Jugar* del menú de inicio. Esta contiene los métodos:

+ ```isPressed```: Verifica si se está presionando el botón, y de ser cierto, hace su función
+ ```display```: Se encarga de mostrar el botón en el respectivo menú.

Durante este proceso, se empezó a diseñar un modelo de cañón para los tiradores que se encuentran en la parte inferior de la pantalla al comenzar el juego, a partir de ejes. Para esto, se creo otra clase llamada ```Cannon```. Esta es la encargada de los cañones. Sus métodos son:

+ ```display```: Se encarga de mostar el cañón en el tablero.
+ ```setActivo```: Se encarga de fijar el cañón como principal o secundario.
+ ``` activar```: Se encarga de establecer el cañón como principal y devuelve el booleano ```false```, de tal manera que pueda ser usado para desactivar el otro cañón.
+ ```getActivo```: Devuelve un valor booleano que determina si dicho cañón es principal o secundario.

## 2048
Primero debemos saber que es un 2048, el juego tiene como objetivo deslizar baldosas en una cuadrícula para combinarlas y crear una baldosa con el número 2048. Se lo considera como un rompecabezas de deslizamiento, fue desarrollado por primera vez por: Gabriele Cirulli.
La realizacion de este juego se hizo por medio de objetos en processing. Como toda realizacion de un proyecto tiene sus pasos. en primer lugar planteamos hacer una grilla para ubicar los bloques, cabe destacar la realizacion de la grilla de 5x5, luego de eso viene la creacion de los bloques y ademas de eso los numeros que van contenidos dentro de estos. Al realizar los bloques debemos idear una algo la combinacion de bloques identicos se realizo es un calculo para poder combinar los bloques de igual numero y realizar la duplicacion del numero en el centro y cada uno de estos calculos se realizo para el movimiento en cada direccion. Una problema que ocurrio durante esto fue la creación de diferentes colores para cada bloque de cada numero y al no poderlo realizar se dejaron todos los bloques de un mismo color, el juego termina cuando el jugador se queda sin opciones de combinar los bloques, y estan llenas cada una de las casillas de la grilla. Para realizar este juego se crearon 5 clases las cuales son:
- Clase colores: En esta clase se realiza el pintado de los bloques con color rojo y ademas de eso se ubican los bloques en la pantalla.
- Clase grilla: En esta clase se realiza la grilla que aparece en pantalla y ademas se definen los bloques y como van a estar, y su aparición en la pantalla.
- Clase maths: En esta clase se realizan todos los calculos para la combinacion de los bloques en cada una de las direcciones.
- Clase puntaje: En esta clase se da la puntuacion y se dibuja en el tablero.
- Clase controller: Como su nombre lo indica esta clase es el cerebro del juego ya que esta hereda los calculos de las demas, y los lleva a la pestaña principal la cual tiene como nombre central, para que se ejecute el juego y todos sus procesos

