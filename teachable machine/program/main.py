# uvicorn main:app --reload

from fastapi import FastAPI, UploadFile, File
from fastapi.responses import JSONResponse
import numpy as np
from PIL import Image, ImageOps
from tensorflow_hub import KerasLayer

app = FastAPI()

model_layer = KerasLayer(r'C:\Users\Я\Desktop\UKSIVT\special course\teachable machine\my_model\models\converted_savedmodel\model.savedmodel')
class_names = open(r'C:\Users\Я\Desktop\UKSIVT\special course\teachable machine\my_model\models\converted_savedmodel\labels.txt', 'r').readlines()


def predict_image(image: Image.Image):
    data = np.ndarray(shape=(1, 224, 224, 3), dtype=np.float32)

    size = (224, 224)
    image = ImageOps.fit(image, size, Image.Resampling.LANCZOS)
    image_array = np.asarray(image)
    normalized_image_array = (image_array.astype(np.float32) / 127.5) - 1
    data[0] = normalized_image_array

    predictions = model_layer(data)
    if isinstance(predictions, dict):
        predictions = list(predictions.values())[0]
    predictions = predictions.numpy()

    index = np.argmax(predictions)
    class_name = class_names[index]
    confidence_score = predictions[0][index]

    return class_name[2:].strip(), float(confidence_score)

@app.post('/predict')
async def predict(file: UploadFile = File(...)):
    try:
        image = Image.open(file.file).convert('RGB')
        class_name, confidence = predict_image(image)
        return  JSONResponse(content={'class': class_name, 'confidence': confidence})
    except Exception as e:
        return JSONResponse(content={'error': str(e)}, status_code=500)
