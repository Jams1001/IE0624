

# Laboratorio 5: STM32: Arduino: GPIO, Giroscopio, comunicaciones, TinyML


## Autores

- Jafet David Gutiérrez Guevara, B73558 [@jdgg98](https://github.com/jdgg98)
- Jorge Adán Mora Soto, B95222 [@Jams1001](https://github.com/Jams1001)
## Resumen

En el siguiente laboratorio se desarrolla un reconocedor de actividad humana el cual utiliza un kit  Arduino Nano 33 BLE. Para esto se realiza un programa para el microcontrolador que capture la informacion del giroscopio y se envie a la computadora por el puerto USB; esta información se procesa mediante un script de python que  la guarde con etiqueta
el tipo de movimiento que se efectua y la ordene en un archivo CSV. Se registran 3 movimientos: «Up-Down», «Circle» y «Stationary». Con esta información muestreada se pretende realizar un modelo de red neuronal para cargar en el Arduino, de modo que este pueda identificar el movimiento realizado según la red cargada con datos históricos y frecuentes para determinado movimiento.\n
Sobre el modelo: se aspira a una red de dos capas con varias neuronas y 3 salidas (una para cada movimiento). Se entrena el modelo con el 60% de los datos, se valida con el 20% y se prueba con el último 20% de los datos. Este modelo se procesa/exporta al microcontrolador mediante y gracias a la librería de TensorFlow. Los practicantes se apoyan en la plataforma de EdgeImpulse para pefeccionar el modelo. El objetivo se cumplió dentro de los parámetos evaluativos. Se exporta un modelo que detectan los 3 movimientos. Con respecto a la red neuronal, no se cumplió perfectamente el objetivo  con el movimiento "Stationary" pues este se predice parcialmente; pero este conocimiento de redes neuronales no corresponde a criterios evacuativos del curso, por lo que se concluye una práctica exitosa.



![alt text](https://github.com/Jams1001/Images/blob/main/1.png)




