# Change song with the hand (OpenCV)
# Examples: https://www.programcreek.com/python/example/104590/win32api.keybd_event
from pyautogui import *
import mediapipe as mp
import pyautogui
import time
import cv2
import os

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
cap = cv2.VideoCapture(0)
with mp_hands.Hands(
    model_complexity=0,
    min_detection_confidence=0.5,
    min_tracking_confidence=0.1) as hands:

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
                print(newX)

                pos = newX

                if((pos > '0.5') and (pos < '0.58')):

                    print("Threshold exceeded")

        cv2.imshow('MediaPipe Hands', cv2.flip(image, 1))
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
            
cap.release()