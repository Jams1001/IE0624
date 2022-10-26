import serial, time, json
import paho.mqtt.client as mqtt

#ser = serial.Serial(port = '/dev/ttyACM0', baudrate=115200, timeout=1) 
print("Connected")
data_rows = []
header = ['x', 'y', 'z']
print(header)

#while(1):
#    #data = ser.readline().decode('utf-8').replace('\r', "").replace('\n', "")
#    #data = data.split('\t')
#
#    if len(data) >= 3:
#        print(data)
data = [1, 2, 3]


def on_connect(client, userdata, flags, rc):
    if rc == 0:
        client.connected = True
        print("Connected succesfully")
    else: 
        print("Not connected, returned code: ", rc)
        client.loop_stop()
def on_disconnect(client, userdata, rc):
    if(rc == 0):
        print("Disconnection Successful")
    else:
        print("System disconnected via code: ", rc)
def on_publish(client, userdata, mid):
    print("Message: ", mid, " has left the client")


#PuertoSerial = serial.Serial(port = '/tmp/ttyACM0') 
print("Connected to serial port")
client = mqtt.Client("B95222")
client.connected = False
client.on_connect = on_connect
client.on_disconnect = on_disconnect
client.on_publish = on_publish

broker ="iot.eie.ucr.ac.cr"
port = 1883
topic = "v1/devices/me/telemetry"
device = "n304FtKg956XPgJMSCl9"
client.username_pw_set(device)
client.connect(broker, port)
dict = dict()

while(1):
    #if(PuertoSerial.in_waiting > 0):
        #input = PuertoSerial.readline()
        #decode = input.decode().replace('\r\n', '')
        #split = decode.split('/')
        dict["x"] = data[0]
        dict["y"] = data[1]
        dict["z"] = data[2]
        time.sleep(2)
        output = json.dumps(dict)
        print(output)
        client.publish(topic, output)


    

