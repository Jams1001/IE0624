from pyautogui import *
import mediapipe as mp
import pyautogui
import time
import cv2
import os
import serial
import csv

ON = True
OFF = False

arduino_port = "/dev/ttyACM0"  
baud = 9600
ser = serial.Serial(arduino_port, baud)
print("Connected to Arduino port:" + arduino_port)

prev_state = 0
ac_state = 0
enable = False

mp_drawing = mp.solutions.drawing_utils
mp_drawing_style = mp.solutions.drawing_styles
mp_hands = mp.solutions.hands

'''
PARA MENSAJE DE "INFO: Created TensorFlow Lite XNNPACK delegate for CPU":
1. Quitar cv2.CAP_DSHOW de la siguiente linea
2. Correr el script
3. Devolver cv2.CAP_DSHOW
4. Volver a correr el script
'''

def arduino(ac_pos):
    global prev_state
    global ac_state
    global enable

    print(str(ac_pos)[0:4])

    if(ac_pos < 10):
        ac_state = 0

    elif(ac_pos >= 10 and ac_pos < 20):
        ac_state = 10

    elif(ac_pos >= 20 and ac_pos < 30):
        ac_state = 20

    elif(ac_pos >= 30 and ac_pos < 40):
        ac_state = 30

    elif(ac_pos >= 40 and ac_pos < 50):
        ac_state = 40

    elif(ac_pos >= 50 and ac_pos < 60):
        ac_state = 50

    elif(ac_pos >= 60 and ac_pos < 70):
        ac_state = 60

    elif(ac_pos >= 70 and ac_pos < 80):
        ac_state = 70

    elif(ac_pos >= 80 and ac_pos < 90):
        ac_state = 80

    elif(ac_pos >= 90 and ac_pos < 100):
        ac_state = 90

    if(ac_state != prev_state):
        enable = True
        prev_state = ac_state
    else:
        enable = False

    if(enable):
        ser.write(bytes(str(ac_state), 'utf-8'))
cap = cv2.VideoCapture(0)
with mp_hands.Hands(
    model_complexity=0,
    min_detection_confidence=0.5,
    min_tracking_confidence=0.1) as hands:

    counter = 0
    while cap.isOpened():
        enable = False
        success, image = cap.read()
        if not success:
            print("Ignoring...")
            continue

        image.flags.writeable = False
        image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
        results = hands.process(image)

        image.flags.writeable = True 
        image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
        if results.multi_hand_landmarks:
            for hand_landmarks in results.multi_hand_landmarks:
                mp_drawing.draw_landmarks(
                    image,
                    hand_landmarks,
                    mp_hands.HAND_CONNECTIONS,
                    mp_drawing_style.get_default_hand_landmarks_style(),
                    mp_drawing_style.get_default_hand_connections_style())      
                
                x = str(hand_landmarks.landmark[0]).split(' ')[1]
                newX = x.split('y')[0] * 100
                pos = float(newX[0:4])*100
                pos_i = int(pos)
                arduino(int(str(pos_i)[0:4]))

        cv2.imshow('MediaPipe Hands', cv2.flip(image, 1))
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
        counter += 1     
cap.release()