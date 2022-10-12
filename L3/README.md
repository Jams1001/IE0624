

# Laboratorio 3: Arduino: PID, GPIO, ADC y comunicaciones


## Autores

- Jafet David Gutiérrez Guevara, B73558 [@jdgg98](https://github.com/jdgg98)
- Jorge Adán Mora Soto, B95222 [@Jams1001](https://github.com/Jams1001)
## Resumen

En está práctica de laboratorio se desarrolló un sistema que emula una incubadora de huevos. Para ejecutar el algoritmo de control de dicho sistema se utilizó un Arduino UNO, y aparte de este dispositivo, se cuenta con un circuito compuesto por: una pantalla
LCD PCD8544, un termistor, una fuente de tensión DC variable de $0\,V$ a $5\,V$, una fuente de tensión DC fija de $5\,V$, un potenciómetro, un transistor, dos LEDs (uno rojo y uno azul) y un conjunto de resistencias. Por otro lado, en el Arduino UNO se implementó un controlador PID para manipular la temperatura de la incubadora, con base en la temperatura deseada y la temperatura en tiempo real determinada por el termistor.
