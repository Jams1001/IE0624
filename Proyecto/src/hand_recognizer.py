from pyautogui import *
import mediapipe as mp
import pyautogui
import time
import cv2
import os
import serial
import csv

arduino_port = "/dev/ttyACM0"  
baud = 9600
ser = serial.Serial(arduino_port, baud)
print("Connected to Arduino port:" + arduino_port)

mp_drawing = mp.solutions.drawing_utils
mp_drawing_style = mp.solutions.drawing_styles
mp_hands = mp.solutions.hands

'''
PARA MENSAJE DE "INFO: Created TensorFlow Lite XNNPACK delegate for CPU":
1. Quitar cv2.CAP_DSHOW de la siguiente linea
2. Correr el script
3. Devolver cv2.CAP_DSHOW
4. Volver a correr el script


arduino_port = "/dev/ttyACM0"  
baud = 9600
ser = serial.Serial(arduino_port, baud)
print("Connected to Arduino port:" + arduino_port)'''

def arduino(num):
    #num = input("Enter a number: ")
    #print("\n")
    
    if (num >= 50):    
        ser.write(bytes(num)) 
        print ("LED turned ON")
    
    if (num < 50): 
        ser.write(bytes(num))
        print ("LED turned OFF")

cap = cv2.VideoCapture(0)
with mp_hands.Hands(
    model_complexity=0,
    min_detection_confidence=0.5,
    min_tracking_confidence=0.1) as hands:

    counter = 0
    while cap.isOpened():
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

                print(str(pos_i)[0:4])

                # ser.write(bytes(pos, 'utf-8')) 
                # print ("LED turned ON")

                arduino(pos_i)

        cv2.imshow('MediaPipe Hands', cv2.flip(image, 1))
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
        counter += 1     
cap.release()