# streamlit run streamlit.py

import streamlit as st
import requests

API_URL = "http://127.0.0.1:8000"

def main():
    st.title('Movie Recommendation System')

    menu = st.sidebar.selectbox('Выберите действие', ['Топ-10 фильмов', 'Рекомендации по жанру', 'Рекомендации по контенту'])
    if menu == 'Топ-10 фильмов':
        response = requests.get(f'{API_URL}/top-10')
        if response.status_code == 200:
            top_10 = response.json()
            st.subheader('Топ-10 популярных фильмов')
            for title in top_10['titles']:
                st.write(title)
        else:
            st.error('Ошибка при получении данных.')
    elif menu == 'Рекомендации по жанру':
        genre = st.text_input('Введите жанр:')
        if st.button('Получить рекомендации'):
            if genre:
                response = requests.post(
                    'http://127.0.0.1:8000/recommendations/genre',
                    json={'genre': genre}
                )

                if response.status_code == 200:
                    data = response.json()
                    st.write(f'Рекомендации по жанру {genre}:', data['titles'])
                elif response.status_code == 404:
                    st.error('Жанр не найден.')
                else:
                    st.error('Ошибка при получении данных.')
            else:
                st.warning("Пожалуйста, введите жанр.")
    elif menu == 'Рекомендации по контенту':
        title = st.text_input('Введите название фильма:')
        if st.button('Получить рекомендации'):
            if title:
                response = requests.post(
                    'http://127.0.0.1:8000/recommendations/content',
                    json={'title': title}
                )

                if response.status_code == 200:
                    data = response.json()
                    st.write(f'Рекомендации по фильму "{title}":', data['titles'])
                elif response.status_code == 404:
                    st.error('Фильм не найден.')
                else:
                    st.error('Ошибка при получении данных.')
            else:
                st.warning("Пожалуйста, введите фильм.")

    st.sidebar.subheader('Справка')
    st.sidebar.write('1. Топ-10 фильмов: Получите список из 10 популярных фильмов.')
    st.sidebar.write('2. Рекомендации по жанру: Введите жанр и получите рекомендации.')
    st.sidebar.write('3. Рекомендации по контенту: Введите название фильма и получите рекомендации по контенту.')

if __name__ == "__main__":
    main()
