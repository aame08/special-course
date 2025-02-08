# streamlit run streamlit.py

import streamlit as st
import requests
from PIL import Image

API_URL = 'http://127.0.0.1:8000/predict'

st.title('Классификация изображений')
st.write('Загрузите изображение, чтобы получить предсказание')

uploaded_file = st.file_uploader('Загрузите изображение', type=['png', 'jpg', 'jpeg'])

if uploaded_file is not None:
    image = Image.open(uploaded_file)
    st.image(image, caption='Загруженное изображение', use_container_width =True)

    if st.button('Предсказать'):
        try:
            files = {'file': uploaded_file.getvalue()}
            response = requests.post(API_URL, files=files)

            if response.status_code == 200:
                result = response.json()
                st.success(f"Класс: {result['class']}")
                st.success(f"Уверенность: {result['confidence']:.2f}")
            else:
                st.error(f"Ошибка: {response.json().get('error', 'Неизвестная ошибка')}")
        except Exception as e:
            st.error(f"Ошибка при отправке запроса: {e}")
