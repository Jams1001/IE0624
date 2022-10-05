import serial

record = []

class Recorder(objetct):
    def __init__(self):
        self.temp_op = 0
        self.ctrl_sgn = 0
        self.temp_sens = 0
        self.humd = 0

    def connect(self, device_name="/tmp/ttyS1", baudrate=921600, timeout=1):
        self.baurate = baudrate
        self.timeout = timeout
        self.device_name = device_name
        print("connectiong to"+device_name)
        self.serial_dev = serial.Serial(self.device_name, baudrate=self.baurate, timeout=self.timeout)


if __name__ == '__main__':
