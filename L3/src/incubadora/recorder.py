# Paquete de Python que encapsula funciones de acceso a puerto serial
import serial 

# Array en el cual el script guarda en cada ciclo los valores de las variables de interes
record = [] 

# Clase en la cual se definen las funciones para conectar y leer datos del puerto serial
class Recorder(objetct):
    # Constructor de la clase
    def __init__(self):
        self.temp_op = 0 # Temperatura de operacion
        self.ctrl_sgn = 0 # Señal de control del PID
        self.temp_sens = 0 # Temperatura sensada por el termistor
        self.humd = 0 # Humedad sensada

    # Funcion que establece conexión con el puerto serial
    def connect(self, device_name="/tmp/ttyS1", baudrate=921600, timeout=1):
        self.baurate = baudrate
        self.timeout = timeout
        self.device_name = device_name
        print("connectiong to"+device_name)

        # Crea objeto Serial a traves del cual se podran llamar todas las funciones el paquete
        self.serial_dev = serial.Serial(self.device_name, baudrate=self.baurate, timeout=self.timeout)

'''
Funciones faltan: 
    - get_temp_op (lee la temperatura de operacion y la guarda en temp_op)
    - get_ctrl_sgn (lee la señal de control y la guarda en ctrl_sgn)
    - get_temp_sens (lee la temperatura sensada y la guarda en temp_sens)
    - get_humd (lee la humedad y la guarda en humd)
    - update_data (escribe en record todos los valores leido con las funciones get)
'''

''' Opcionalmente, puede escribir una sola funcion en la que se lean todos los datos 
y se escriban en record[], en lugar de hacer todas las funciones de arriba

Como le quede mejor
'''

if __name__ == '__main__':
