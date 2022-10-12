import serial
import csv

arduino_port = "/tmp/ttyS1" 
baud = 9600
fileName="incubadora_data.csv" 

ser = serial.Serial(arduino_port, baud)
print("Connected to Arduino port:" + arduino_port)
file = open(fileName, "w")
print("Created file")

line = 1
sensor_data = [] 

header = ['Temperatura_Termistor', 'Humedad', 'Temperatura_Operacion', 'Ctrl_sgn']
file.write(header[0]+','+header[1]+','+header[2]+','+header[3]+'\n')

print(header[0]+','+header[1]+','+header[2]+','+header[3])
while True:
    getData=ser.readline()
    dataString = getData.decode('utf-8')
    data=dataString[0:][:-2]
    readings = data.split(",")
    sensor_data.append(readings)
    line = line+1
    print(data)
    
    with open(fileName, 'a', encoding='UTF8', newline='') as f:
        writer = csv.writer(f)
        writer.writerows(sensor_data)
    file.close()