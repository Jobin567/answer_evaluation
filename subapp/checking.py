from sklearn.feature_extraction.text import TfidfVectorizer


#oans='There is one major difference between a ROM (read-only memory) and a RAM (random-access memory) chip: ROM can hold data without power and RAM cannot. Essentially, ROM is meant for permanent storage, and RAM is for temporary storage.'
#ans='There is no major difference between a ROM (read-only memory) and a RAM (random-access memory) chip: ROM can hold data with power and RAM can. Essentially, ROM is meant for temporary storage, and RAM is for permanent storage.'

oans = 'The Computer Organization and Architecture (COA) defines the structure and behavior of a computer system, covering both hardware and system design principles. It includes key components such as the CPU (Control Unit, ALU, Registers), Memory Hierarchy (Cache, RAM, ROM), and Input/Output devices. The architecture focuses on the instruction set, addressing modes, and data processing mechanisms, while organization deals with how these components interact efficiently. A fundamental concept in COA is the Von Neumann architecture, where instructions and data share the same memory space. Additionally, modern architectures include RISC (Reduced Instruction Set Computing) and CISC (Complex Instruction Set Computing), optimizing performance for different computational needs.'
ans = 'COA (Computer Organization and Architecture) describes how a computer s hardware and software interact to execute programs efficiently. It is divided into architecture (functional behavior) and organization (physical implementation), covering elements like processor design, memory access, and instruction execution. The CPU, memory hierarchy, buses, and input/output systems are core components that define a systems performance. The Harvard and Von Neumann architectures dictate how data and instructions are stored and processed. Additionally, concepts like pipelining, parallel processing, and multi-core processing enhance computational speed and efficiency in modern computing systems.'

documents = [oans, ans]
tfidf = TfidfVectorizer().fit_transform(documents)
# no need to normalize, since Vectorizer will return normalized tf-idf
pairwise_similarity = tfidf * tfidf.T


marks = str(pairwise_similarity).split('\n')
per = 0.0
print(pairwise_similarity)
if (len(marks) >= 4):
    print('_______________________')
    print (len(marks),type(len(marks)))
    # pp = marks[0].split('\t')[1]
    # per = float(pp)
print(per)

import nltk
from nltk.sentiment.vader import SentimentIntensityAnalyzer

sid = SentimentIntensityAnalyzer()
ss = sid.polarity_scores(oans)
print("positive", ss['pos'])
print("neg1", ss['neg'])
print("neu1", ss['neu'])

ss = sid.polarity_scores(ans)
print("pos2", ss['pos'])
print("neg2", ss['neg'])
print("neu2", ss['neu'])

import nltk
from nltk.corpus import wordnet as wn
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
#from nltk.metrics import edit_distance


# Function to get synonyms from WordNet
def get_synonyms(word):
    synonyms = set()

    # Get the synsets of the word
    for syn in wn.synsets(word):
        for lemma in syn.lemmas():
            synonyms.add(lemma.name())

    return list(synonyms)


# Function to clean and tokenize the text
def clean_text(text):
    stop_words = set(stopwords.words('english'))
    words = word_tokenize(text.lower())
    words = [word for word in words if word.isalnum() and word not in stop_words]
    return words


# Function to calculate semantic similarity between two texts
def calculate_similarity(text1, text2):
    # Tokenize and clean both texts
    words1 = clean_text(text1)
    words2 = clean_text(text2)

    similarity_score = 0
    total_comparisons = 0

    # For each word in the first text, compare it with words in the second text
    for word1 in words1:
        synonyms1 = get_synonyms(word1)
        print(synonyms1)

        # For each synonym of word1, compare it to words in the second text
        for word2 in words2:
            synonyms2 = get_synonyms(word2)

            # Calculate the semantic similarity (path similarity between synsets)
            max_similarity = 0
            for syn1 in wn.synsets(word1):
                for syn2 in wn.synsets(word2):
                    similarity = syn1.path_similarity(syn2)

                    if similarity and similarity > max_similarity:
                        max_similarity = similarity

            if max_similarity > 0.3:
                similarity_score += max_similarity
                total_comparisons += 1

    # Calculate the average similarity score
    if total_comparisons == 0:
        return 0.0
    else:

        sim= similarity_score / total_comparisons
        if sim==1:
            if len(words1)>total_comparisons:
                sim=similarity_score/len(word1)
        return sim


# Test the similarity function
text1 = oans
text2 = ans

similarity = calculate_similarity(text1.lower(), text2.lower())
print(f"Similarity Score: {similarity}")
