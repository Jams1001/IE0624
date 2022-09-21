

# Laboratorio 2: GPIOs, interrupciones, timers y FSM

[![cruce-semaforos.png](https://i.postimg.cc/6qZGbvDz/cruce-semaforos.png)](https://postimg.cc/0K8Qbb5J)

En este laboratorio se desarrolló un cruce de semáforo simplificado, conformado por un par de semáforos peatonales y uno vehicular. Para ello se utilizó un microcontrolador ATtiny4313, con el objetivo de implementar una máquina de estados que controle el sistema de semáforos. Dicho sistema debía replicar el comportamiento mostrado en la siguiente figura:

[![diagrama-temporizacion.png](https://i.postimg.cc/HnYfBwc1/diagrama-temporizacion.png)](https://postimg.cc/phSGdnJs)

La máquina de estados se diseñó con 5 entradas, conformadas por 2 pulsadores, 2 temporizadores y un contador. Además cuenta con 4 salidas que representan las luces de los semáforos, y posee un total de 5 estados.Por lo tanto, la máquina requiere únicamente de 1 bit de entrada, ya que los pulsadores están conectados en paralelo como entradas externas del sistema. Añadido a esto, la máquina necesita 3 bits para disponer de 5 combinaciones distintas que identifiquen cada estado. 

Por otro lado, el circuito diseñado para este laboratorio tiene una serie de leds que representan las luces de los semáforos, cada uno acompañado por una resistencia de protección. El circuito también cuenta con un filtro pasivo hecho con una resistencia y un capacitor. Dicho filtro se agregó con el fin de eliminar el factor del ``bouncing'' de los pulsadores.

## Autores

- Jafet David Gutiérrez Guevara, B73558 [@jdgg98](https://github.com/jdgg98)
- Jorge Adán Mora Soto, B95222 [@Jams1001](https://github.com/Jams1001)
## Resumen

El circuito diseñado para este laboartorio se muestra a continuación:

[![circuito-semaforo.png](https://i.postimg.cc/hjnK97KV/circuito-semaforo.png)](https://postimg.cc/f3H4sytb)

Cuando un usuario presiona cualquiera de los pulsadores del circuito el microcontrolador guarda la solicitud en su memoria. Entonces una vez que hayan transcurrido al menos 10 segundos de paso de vehículos, los semáforos iniciarán el cambio de luces para detener a los vehículos y permitir el paso de peatones. El resto de la secuencia se ejecuta independientemente del estado de los pulsadores, ya que están limitados únicamente por los periodos de tiempo establecidos. En la siguiente etapa la luz verde del semáforo vehicular parpadeará por 3 segundos, para que a continuación todos los semáforos del cruce cambien a luz roja por un segundo. Después la luz verde de los semáforos peatonales se encenderá por solo 10 segundos, para posteriormente parpadear por 3 segundos. Nuevamente, todos los semáforos encenderán sus luces rojas por un segundo y finalmente el sistema volverá al estado inicial, encendiendo la luz verde del semáforo vehicular y las luces rojas de los peatonales.

En las siguientes imágenes se presentan los 5 estados en orden del cruce de semáforos diseñado:

Estado A: paso de vehículos por al menos 10 segundos
[![estado-A.png](https://i.postimg.cc/L6MRwbw2/estado-A.png)](https://postimg.cc/mhV0F8T5)

Estado B: parpadeo de luz verde del semáforo vehicular por 3 segundos
[![estado-B.png](https://i.postimg.cc/NjznqyFm/estado-B.png)](https://postimg.cc/DS161wqw)

Estado C: paro total de vehículos y peatones por 1 segundo
[![estado-C.png](https://i.postimg.cc/XJcxJXj2/estado-C.png)](https://postimg.cc/qhq2DJCn)

Estado D: paso de peatones por 10 segundos
[![estado-D.png](https://i.postimg.cc/j5KQGKHy/estado-D.png)](https://postimg.cc/bGCtt7Fv)

Estado E: parpadeo de luces verdes de semáforos peatonales por 3 segundos
[![estado-E.png](https://i.postimg.cc/8k4tgFnc/estado-E.png)](https://postimg.cc/t71hhgbG)