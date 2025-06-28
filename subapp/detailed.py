import nltk
from sklearn.feature_extraction.text import TfidfVectorizer
from nltk.sentiment.vader import SentimentIntensityAnalyzer
from nltk.corpus import wordnet as wn
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize

# Sample texts
oans = 'There is one major difference between a ROM (read-only memory) and a RAM (random-access memory) chip: '
ans = 'There is a few difference between a ROM and a RAM chip. There will be data loss when power is off in ROM and opposite in RAM. Rom is for permanent storage and ram is for permanent storage'

# TF-IDF Vectorization
documents = [oans, ans]
tfidf = TfidfVectorizer().fit_transform(documents)
pairwise_similarity = tfidf * tfidf.T

# Extract the similarity between the two texts
similarity_score = pairwise_similarity[0, 1]
print(f"TF-IDF Similarity Score: {similarity_score}")

# Sentiment Analysis using VADER
sid = SentimentIntensityAnalyzer()
sentiment_oans = sid.polarity_scores(oans)
sentiment_ans = sid.polarity_scores(ans)

print(f"Sentiment for oans: {sentiment_oans}")
print(f"Sentiment for ans: {sentiment_ans}")

# Function to clean and tokenize the text
def clean_text(text):
    stop_words = set(stopwords.words('english'))
    words = word_tokenize(text.lower())
    words = [word for word in words if word.isalnum() and word not in stop_words]
    return words

# Function to get synonyms from WordNet
def get_synonyms(word):
    synonyms = set()
    for syn in wn.synsets(word):
        for lemma in syn.lemmas():
            synonyms.add(lemma.name())
    return list(synonyms)

# Function to calculate semantic similarity
def calculate_similarity(text1, text2):
    words1 = clean_text(text1)
    words2 = clean_text(text2)
    similarity_score = 0
    total_comparisons = 0

    # Compare words from text1 to words from text2
    for word1 in words1:
        synonyms1 = get_synonyms(word1)
        for word2 in words2:
            synonyms2 = get_synonyms(word2)
            max_similarity = 0
            for syn1 in wn.synsets(word1):
                for syn2 in wn.synsets(word2):
                    similarity = syn1.path_similarity(syn2) if syn1.path_similarity(syn2) is not None else 0
                    max_similarity = max(max_similarity, similarity)
            if max_similarity > 0.3:
                similarity_score += max_similarity
                total_comparisons +=

    # Return the average similarity score
    return similarity_score / total_comparisons if total_comparisons > 0 else 0.0

# Calculate the WordNet semantic similarity
semantic_similarity = calculate_similarity(oans, ans)
print(f"Semantic Similarity Score: {semantic_similarity}")
