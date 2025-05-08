from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
import re

def preprocess_text(text):
    # Lowercase, remove special characters and numbers
    text = text.lower()
    text = re.sub(r'[^a-zA-Z\s]', '', text)
    return text

def calculate_match_score(resume_text, job_description):
    resume_text = preprocess_text(resume_text)
    job_description = preprocess_text(job_description)

    documents = [resume_text, job_description]

    tfidf_vectorizer = TfidfVectorizer(stop_words='english')
    tfidf_matrix = tfidf_vectorizer.fit_transform(documents)

    # Compute cosine similarity
    score = cosine_similarity(tfidf_matrix[0:1], tfidf_matrix[1:2])[0][0]

    # Convert to percentage
    return round(score * 100, 2)
