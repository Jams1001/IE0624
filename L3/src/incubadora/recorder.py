import serial
import csv

arduino_port = "/tmp/ttyS1" 
baud = 9600
fileName="incubadora_data.csv" 

ser = serial.Serial(arduino_port, baud)
print("Connected to Arduino port:" + arduino_port)
file = open(fileName, "a")
print("Created file")

line = 0
sensor_data = [] 


while True:
    getData=ser.readline()
    dataString = getData.decode('utf-8')
    data=dataString[0:][:-2]
    readings = data.split(",")
    sensor_data.append(readings)
    line = line+1
    
    with open(fileName, 'w', encoding='UTF8', newline='') as f:
        writer = csv.writer(f)
        writer.writerows(sensor_data)
    file.close()