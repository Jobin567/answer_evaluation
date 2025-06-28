import re, math
from collections import Counter
WORD = re.compile(r'\w+')
from nltk.stem import PorterStemmer
from nltk.tokenize import word_tokenize

ps = PorterStemmer()
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
def sr(text):
     stop_words = set(stopwords.words('english'))|{'special','format'}

     word_tokens = word_tokenize(text)


     filtered_sentence = []
     print("sw",stop_words)
     for w in word_tokens:
          if w not in stop_words:
               print( ps.stem(w))
               if ps.stem(w) not in stop_words:
                    filtered_sentence.append(ps.stem(w))
     print(filtered_sentence)
     return ' '.join(filtered_sentence)
def sr1(text,oa):
     stop_words = set(stopwords.words('english'))|{'special','format'}

     word_tokens = word_tokenize(text)


     filtered_sentence = []
     print("sw",stop_words)
     for w in word_tokens:
          if w not in stop_words:
               print( ps.stem(w))
               if ps.stem(w) in oa:
                    if ps.stem(w) not in stop_words:
                         filtered_sentence.append( ps.stem(w))
     print(filtered_sentence)
     return ' '.join(filtered_sentence)
def checkans(ans,oans):
     def get_cosine(vec1, vec2):
          intersection = set(vec1.keys()) & set(vec2.keys())
          numerator = sum([vec1[x] * vec2[x] for x in intersection])
          sum1 = sum([vec1[x]**2 for x in vec1.keys()])
          sum2 = sum([vec2[x]**2 for x in vec2.keys()])
          denominator = math.sqrt(sum1) * math.sqrt(sum2)
          if not denominator:
             return 0.0
          else:
             return float(numerator) / denominator
     def text_to_vector(text):
          words = WORD.findall(text)
          return Counter(words)

     text2 = sr(oans.lower())
     text1 = sr1(ans.lower(),text2)

     print(text1)
     print(text2)
     vector2 = text_to_vector(text2)
     vector1 = text_to_vector(text1)

     print(vector1)
     print(vector2)
     cosine = get_cosine(vector1, vector2)
     print ('Cosine:', cosine)

     return cosine

def checkans1(ans,oans):
     def get_cosine(vec1, vec2):
          intersection = set(vec1.keys()) & set(vec2.keys())
          numerator = sum([vec1[x] * vec2[x] for x in intersection])
          sum1 = sum([vec1[x]**2 for x in vec1.keys()])
          sum2 = sum([vec2[x]**2 for x in vec2.keys()])
          denominator = math.sqrt(sum1) * math.sqrt(sum2)
          if not denominator:
             return 0.0
          else:
             return float(numerator) / denominator
     def text_to_vector(text):
          words = WORD.findall(text)
          return Counter(words)

     text2 = sr(oans.lower()).split(' ')
     text1 = sr1(ans.lower(),text2).split(' ')
     print(text2)
     print(text1)
     d=[]
     for i in text2:
          if i not in text1:
               d.append(i)

     print("--------------",d)
     return ', '.join(d)


# print(checkans1('''it is used to organizing data in a specific format.information can be processed,stored and retrieved efficiently.''','''A data structure is a specialized format for organizing, processing, retrieving and storing data.'''))