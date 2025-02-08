# streamlit run streamlit.py

import streamlit as st
import requests
from PIL import Image
import numpy as np
from streamlit_drawable_canvas import st_canvas
import io

API_URL = 'http://127.0.0.1:8000/predict'

st.title('Распознавание цифры')

option = st.radio('Выберите способ ввода изображения', ('Нарисовать', 'Загрузить изображение'))

if option == 'Нарисовать':
    canvas_result = st_canvas(
        fill_color='white',
        stroke_width=5,
        stroke_color='black',
        background_color='white',
        height=280,
        width=280,
        drawing_mode='freedraw',
        key='canvas',
    )

    if canvas_result.image_data is not None:
        image = Image.fromarray(canvas_result.image_data.astype('uint8'))
        image = image.convert('L')
        image = image.resize((28, 28))

        image = Image.fromarray(255 - np.array(image))

        image = np.array(image) / 255.0
        image = image.reshape(1, 28, 28, 1)

        buffered = io.BytesIO()
        image_to_save = Image.fromarray((image[0, :, :, 0] * 255).astype(np.uint8))
        image_to_save.save(buffered, format="PNG")
        img_bytes = buffered.getvalue()

        if st.button('Предсказать'):
            try:
                files = {'file': img_bytes}
                response = requests.post(API_URL, files=files)

                if response.status_code == 200:
                    result = response.json()
                    st.write(f"Результат: {result['predicted']}")
                    st.write(f"Точность: {result['confidence']:.2%}")
                else:
                    st.error(f"Ошибка {response.status_code}: не удалось получить результат от сервера")
                    st.write(f"Ответ от сервера: {response.text}")

            except Exception as e:
                st.error(f"Ошибка при отправке запроса: {e}")

elif option == 'Загрузить изображение':
    uploaded_file = st.file_uploader('Загрузите изображение', type=['png', 'jpg', 'jpeg'])

    if uploaded_file is not None:
        image = Image.open(uploaded_file)
        st.image(image, caption='Загруженное изображение', use_container_width=True)
        image = image.convert('L')
        image = image.resize((28, 28))

        image = Image.fromarray(255 - np.array(image))

        image = np.array(image) / 255.0
        image = image.reshape(1, 28, 28, 1)

        buffered = io.BytesIO()
        image_to_save = Image.fromarray((image[0, :, :, 0] * 255).astype(np.uint8))
        image_to_save.save(buffered, format="PNG")
        img_bytes = buffered.getvalue()

        if st.button('Предсказать'):
            try:
                files = {'file': img_bytes}
                response = requests.post(API_URL, files=files)

                if response.status_code == 200:
                    result = response.json()
                    st.write(f"Результат: {result['predicted']}")
                    st.write(f"Точность: {result['confidence']:.2%}")
                else:
                    st.error(f"Ошибка {response.status_code}: не удалось получить результат от сервера")
                    st.write(f"Ответ от сервера: {response.text}")

            except Exception as e:
                st.error(f"Ошибка при отправке запроса: {e}")
