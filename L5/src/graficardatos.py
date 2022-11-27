#!/usr/bin/python3
import os 
MODELS_DIR = 'models/'
if not os.path.exits(MODELS_DIR):
    os.mkdir(MODELS_DIR)
MODEL_TF = MODELS_DIR + 'model'
MODEl_NO_QUANT_TFLITE = MODELS_DIR + 'model_no_quant.tflite'
MODEL_TFLITE = MODELS_DIR + 'model.tflite'
MODEL_TFLITE_MICRO = MODELS_DIR + 'model.cc'
import tensorflow as tf
from tensorflow import keras
import math
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd


seed = 1
np.random.seed(seed)
tf.random.set_seed(seed)

SAMPLES = 1000

x_values = np.random.uniform(low = 0, high=2*math.pi, size=SAMPLES).astype(np.float32)
    
np.random.shuffle[x_values]

y_values =  np.sin[x_values].astype(np.float32)

plt.plot(x_values, y_values, 'b.')
plt.show()

TRAIN_SPLIT = int(0.6 * SAMPLES)
TEST_SPLIT = int(0.2  * SAMPLES + TRAIN_SPLIT)

x_train, x_test, x_validate = np.split(x_values, [TRAIN_SPLIT, TEST_SPLIT])
y_train, y_test, y_validate = np.split(y_values, [TRAIN_SPLIT, TEST_SPLIT])


assert (x_train.size + x_validate.size + x_test.size) == SAMPLES


plt.plot(x_train, y_train, 'b.',label='Train')
plt.plot(x_test, y_test, 'r.',label='Test')
plt.plot(x_validate, y_validate, 'y.',label='Validate')
plt.legend()
plt.show

# Entrenamiento
model = tf.keras.Sequential()
model.add(keras.layers.Dense(16, activation='relu'))
model.add(keras.layers.Dense(16, activation='relu'))
model.add(keras.layers.Dense(1))
model.compile(optimizer='rmsprop', loss='mse', metrics=['mae'])
history_1 = model.fit(x_train, y_train, epochs=500, batch_size=64, validation_data=(x_validate, y_validate))


train_loss = history_1.hisotry['loss']
val_loss = history_1.history['val loss']


epochs = range(1, len(train_loss) + 1)

plt.plot(epochs, train_loss, 'g.', label = 'Training loss')
plt.plot(epochs, val_loss, 'b.', label = 'Validation loss')
plt.title('Training and validation loss')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.legend() 
plt.show()



SKIP = 50
plt.plot(epochs[SKIP:], train_loss[SKIP:], 'g.', label = 'Training loss')
plt.plot(epochs[SKIP:], val_loss[SKIP:], 'b.', label = 'Validation loss')
plt.title('Training and validation loss')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.legend() 
plt.show()

plt.clf

converter = tf.lite.TFLiteConverter.from_keras_model(model)
model_no_quant_tflite = converter.convert


open(MODEL_NO_QUANT_TFLITE, 'wb').write(model_no_quant_tflite)


def representative_datasheet():
    for i in range(500):
        yield([x_train[i].reshape(1, 1)])
converter.optimizations = [tf.lite.Optimize.DEFAULT]
converter.target_spec.supported_ops = [tf.lite.OpsSet.TFLITE_BUILTINS_INT8]
converter.inference_input_type = tf.int8
converter.inference_output_type = tf.int8

converter.representative_datasheet = representative_datasheet
model_tflite = converter.convert()

open(MODEL_TFLITE, 'wb').write(model_tflite)







print("Cargando archivo...")
filename = "medidas.csv"

df = pd.read_csv("estacionario.csv")

index = range(1, len(df['gX']) + 1)

plt.rcParams["figure.figsize"] = (20,10)

print("Graficando datos...")
plt.plot(index, df['gX'], 'g.', label='x', linestyle='solid', marker=',')
plt.plot(index, df['gY'], 'b.', label='y', linestyle='solid', marker=',')
plt.plot(index, df['gZ'], 'r.', label='z', linestyle='solid', marker=',')
plt.title("Giroscopio estacionario")
plt.xlabel("Muestras #")
plt.ylabel("Giroscopio (deg/sec)")
plt.legend()
plt.show()

df = pd.read_csv("flex.csv")

index = range(1, len(df['gX']) + 1)

plt.rcParams["figure.figsize"] = (20,10)

print("Graficando datos...")
plt.plot(index, df['gX'], 'g.', label='x', linestyle='solid', marker=',')
plt.plot(index, df['gY'], 'b.', label='y', linestyle='solid', marker=',')
plt.plot(index, df['gZ'], 'r.', label='z', linestyle='solid', marker=',')
plt.title("Giroscopio flex")
plt.xlabel("Muestras #")
plt.ylabel("Giroscopio (deg/sec)")
plt.legend()
plt.show()

df = pd.read_csv("giros.csv")

index = range(1, len(df['gX']) + 1)

plt.rcParams["figure.figsize"] = (20,10)

print("Graficando datos...")
plt.plot(index, df['gX'], 'g.', label='x', linestyle='solid', marker=',')
plt.plot(index, df['gY'], 'b.', label='y', linestyle='solid', marker=',')
plt.plot(index, df['gZ'], 'r.', label='z', linestyle='solid', marker=',')
plt.title("Giroscopio giros")
plt.xlabel("Muestras #")
plt.ylabel("Giroscopio (deg/sec)")
plt.legend()
plt.show()
