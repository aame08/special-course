# uvicorn main:app --reload

from fastapi import FastAPI, UploadFile, File
import tensorflow as tf
import numpy as np
from PIL import Image
import io

model = tf.keras.models.load_model(r'C:\Users\Я\Desktop\UKSIVT\special course\neural networks\digit recognition\model.keras')
app = FastAPI()

@app.post('/predict')
async def predict(file: UploadFile = File(...)):
    try:
        data = await file.read()
        image = Image.open(io.BytesIO(data)).convert('L')
        image = image.resize((28, 28))
        image = np.array(image) / 255.0
        image = image.reshape(1, 28, 28, 1)

        prediction = model.predict(image)
        prediction_digit = np.argmax(prediction)
        confidence = float(prediction[0][prediction_digit])

        return {"predicted": int(prediction_digit), "confidence": confidence}

    except Exception as e:
        return {"error": "Не удалось обработать изображение"}
