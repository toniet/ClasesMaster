import unicodedata
import re
import nltk
import spacy
import numpy as np


nlp = spacy.load("en_core_web_sm")


def to_lower(text):
    return text.lower()



def remove_accents(text):
    return unicodedata.normalize("NFKD", text).encode("ascii", "ignore").decode("utf8", "ignore")



def expand_contractions(text):
    text = re.sub(r"won\'t'", "will not", text)
    text = re.sub(r"can\'t'", "can not", text)
    text = re.sub(r"\'re", " are", text)
    text = re.sub(r"\'s", " is", text)
    text = re.sub(r"\'d", " would", text)
    text = re.sub(r"\'ll", " will", text)
    text = re.sub(r"\'t", " not", text)
    text = re.sub(r"\'ve", " have", text)
    text = re.sub(r"\'m", " am", text)
    return text



def remove_special_characters(text):
    pattern = r"[^a-zA-Z0-9\s]"
    return re.sub(pattern, "", text)



def remove_stopwords(text, remove_not = False):
    stopwords = nltk.corpus.stopwords.words("english")
    if not remove_not:
        stopwords.remove("not")
    words = nltk.word_tokenize(text)
    return [word for word in words if word not in stopwords]



def remove_empty_words(words):
    return [word.strip() for word in words if word.strip() != ""]



def stemming(words):
    porter = nltk.PorterStemmer()
    return [porter.stem(word) for word in words]



def lemmatizing(words):
    text = " ".join(words)
    text = nlp(text)
    return [word.lemma_ for word in text if word.lemma_ != "-PRON-"]



def normalize_sentence(sentence, remove_not = False, apply_stemming = False, apply_lemmatizing = True):
    sentence = to_lower(sentence)
    sentence = remove_accents(sentence)
    sentence = expand_contractions(sentence)
    sentence = remove_special_characters(sentence)
    words = remove_stopwords(sentence, remove_not)
    if apply_stemming:
        words = stemming(words)
    if apply_lemmatizing:
        words = lemmatizing(words)
    words = remove_empty_words(words)
    return " ".join(words)




def document_vectorizer(corpus, model):
    
    def average_vector(sentence, model):
        num_features = model.wv.vector_size
        vector = np.zeros((num_features,))
        vocabulary = set(model.wv.index2word)
        
        num_words = 0
        for word in sentence:
            if word in vocabulary:
                num_words += 1
                vector = np.add(vector, model.wv[word])
        if num_words:
            vector = np.divide(vector, num_words)
        return vector
    
    features = [average_vector(sentence, model) for sentence in corpus]
    return np.array(features)
