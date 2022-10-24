import serial

ser = serial.Serial(port = '/dev/ttyACM0', baudrate=115200, timeout=1) 
print("Connected")
data_rows = []
header = ['x', 'y', 'z']
print(header)

while(1):
    data = ser.readline().decode('utf-8').replace('\r', "").replace('\n', "")
    data = data.split('\t')

    if len(data) == 3:
        print(data)



    

