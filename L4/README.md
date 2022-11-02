

# Laboratorio 4: STM32: GPIO, ADC, comunicaciones, Iot


## Autores

- Jafet David Gutiérrez Guevara, B73558 [@jdgg98](https://github.com/jdgg98)
- Jorge Adán Mora Soto, B95222 [@Jams1001](https://github.com/Jams1001)
## Resumen

En está práctica de laboratorio se desarrolló un sistema que emula un sismógrafo digital para registrar y estudiar las oscilaciones en el edificio de la escuela de
ingeniería  eléctrica. El sismógrafo actual tiene alimentación por baterías (cargadas por paneles solares) y poco ancho de banda para el envío de datos. Por lo tanto el simógrafo a desarollar utiliza una placa STM32F429 Discovery kit y la biblioteca libopencm3, lee los ejes \texttt{x, y, z} del giroscopio incluido en el STM32F429 Discovery kit y despliega tales valores en una pantalla LCD; Además incluye un switch que habilita y deshabilita comunicaciones por USART-USB; a su vez, cuando la batería está baja cerca de su límite inferior, un led parpadea alertando el estado de la batería. Por último este sismógrafo se conecta a través de MQTT a una plataforma de IoT thingsboard en internet para desplegar sus lecturas de manera amigable para el usuario. El proyecto planeta un prototipo; únicamente se utilizan los componentes integrados en el STM32F429 Discovery kit físico. No se realiza simulaciones. El proyecto se concluyó con éxito.



\textbf{Instrucciones de simulación:}\\ El directorio \textbf{spi-gyro} que se entrega bajo el path \texttt{L4/src/spi-gyro/} \textbf{debe copiarse al directorio de ejemplos de la librería \texttt{libopencm3}}. Es indicación de este laboratorio trabajar con esta librería disponible en \href{https://github.com/libopencm3/libopencm3-examples}{ libopencm3 /
libopencm3-examples}. Una vez instalada esa librería y copiada la carpeta \textbf{spi-gyro} dentro del directorio de ejemplos de la misma, se debe realizar el \textit{«flasheo»}. Por ejemplo, \textbf{spi-gyro} se debe copiar al siguiente path:\\ \texttt{/home/jams/local/src/libopencm3-examples/examples/stm32/f4/stm32f429i-discovery/}\\
Una vez dentro del nuevo directorio:\\
\texttt{/home/jams/local/src/libopencm3-examples/examples/stm32/f4/stm32f429i-discovery/spi-gyro/}\\
Ejecutar la sintaxis en este orden:
\begin{minted}{C}
make
make flash
\end{minted}
Una vez «flasheado» el firmware, ya se puede ejecutar el \texttt{gyro\_publisher.py} adjunto en el entregable.




