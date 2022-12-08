

# Proyecto Final: Sistema de Control de Iluminación Gestual


## Autores

- Jafet David Gutiérrez Guevara, B73558 [@jdgg98](https://github.com/jdgg98)
- Jorge Adán Mora Soto, B95222 [@Jams1001](https://github.com/Jams1001)
## Resumen

En este proyecto se implementa un sistema que controle el estado de un conjunto de bombillos a través de gestos.  La primera funcionalidad consiste en que el sistema permitirte elevar y disminuir la intensidad de la luminaria desde completamente apagado, hasta la intensidad máxima. Por otra parte, se implementa un algoritmo que opera por defecto, encendiendo y cambiando la intensidad de las luces en función de la hora del día. El flujo bajo el cual se modela dicho sistema se muestra en la siguiente figura. El primer elemento que se puede observar de izquierda a derecha es una cámara, la cual enviará su transmisión al segundo componente: una computadora. La PC ejecutará un programa de reconocimiento de imágenes, el cual procesará la transmisión de la cámara. Si el programa detecta alguno de los gestos definidos, se enviará una respuesta al tercer componente: un Arduino UNO. Con base en el estímulo recibido, este microcontrolador generará la combinación de salidas correspondiente para producir el resultado deseado, ya sea encender, apagar, atenuar o aumentar el brillo del bombillo. Finalmente, el cambio en las salidas se propagará por un circuito de control que manipula la tensión suministrada al bombillo, y consecuentemente variará su intensidad luminosa. El proyecto entrega resultados satisfactorios en todo los puntos deseados.

![alt text](https://github.com/Jams1001/IE0624/blob/main/Proyecto/informe/informe/images/diagrama.pdf)
![alt text](https://github.com/Jams1001/IE0624/blob/main/Proyecto/informe/informe/images/esquematico_completo.png)





