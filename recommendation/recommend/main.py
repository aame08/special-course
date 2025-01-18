# uvicorn main:app --reload

from fastapi import FastAPI
from pydantic import BaseModel
import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity

data = pd.read_csv(r'C:\Users\Я\Desktop\UKSIVT\special course\recommendation\films\data.csv')

app = FastAPI()

class MovieTitles(BaseModel):
    titles: list[str]

class GenreRequest(BaseModel):
    genre: str

class ContentRequest(BaseModel):
    title: str


def recommend_by_genre(genre: str):
    tfidf_vectorizer = TfidfVectorizer(stop_words='english')
    tfidf_genre_matrix = tfidf_vectorizer.fit_transform(data['listed_in'])
    genre_cosine_sim = cosine_similarity(tfidf_genre_matrix, tfidf_genre_matrix)

    genre_indices = data[data['listed_in'].str.contains(genre, case=False)].index.to_list()

    sim_scores = list(enumerate(genre_cosine_sim[genre_indices[0]]))
    sim_scores = sorted(sim_scores, key=lambda x: x[1], reverse=True)[1:11]

    return data.iloc[[i[0] for i in sim_scores]]['title'].tolist()


def recommend_by_content(title):
    tfidf_vectorizer = TfidfVectorizer(stop_words='english')
    tfidf_matrix = tfidf_vectorizer.fit_transform(data['unification'])
    content_cosine_sim = cosine_similarity(tfidf_matrix, tfidf_matrix)

    idx = data[data['title'].str.lower() == title.lower()].index[0]

    sim_scores = list(enumerate(content_cosine_sim[idx]))
    sim_scores = sorted(sim_scores, key=lambda x: x[1], reverse=True)[1:11]

    return data.iloc[[i[0] for i in sim_scores]]['title'].tolist()

@app.get('/top-10', response_model=MovieTitles)
def get_top_10():
    top_10 = data.sample(10)['title'].reset_index(drop=True).tolist()
    return MovieTitles(titles=top_10)

@app.post('/recommendations/genre', response_model=MovieTitles)
def get_recommend_by_genre(request: GenreRequest):
    recommendations = recommend_by_genre(request.genre)
    return MovieTitles(titles=recommendations)

@app.post('/recommendations/content', response_model=MovieTitles)
def get_recommend_by_content(request: ContentRequest):
    recommendations = recommend_by_content(request.title)
    return MovieTitles(titles=recommendations)
