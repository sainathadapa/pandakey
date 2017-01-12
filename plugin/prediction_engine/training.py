# This is the code for training data to
# calculate the prob for the n-grams
from __future__ import division
from collections import defaultdict
#from . import ngram
import nltk
import pickle
import os

def training():
    """ Trains the n-gram language model and returns dict"""

    from nltk.corpus import brown
    # all the text from brown corpus
    raw_text = [];
    for cat in brown.categories():
        raw_text.extend(brown.words(categories=cat))

    brown_words = [str(word) for word in raw_text]

    # 1-gram not needed for now.
    # fD_1gram = nltk.FreqDist(brown_words)
    #fD_2gram = nltk.FreqDist(nltk.bigrams(brown_words))
    fD_3gram = nltk.FreqDist(nltk.trigrams(brown_words))

    dict_ngrams = defaultdict(int)

    for nGram, count in fD_3gram.items():
        dict_ngrams[nGram] = count

    nGramData = os.path.join(os.path.dirname(__file__),'nGramData.pkl')

    with open(nGramData, 'wb') as handle:
        pickle.dump(dict_ngrams, handle, -1)


if __name__ == "__main__":
    print "Training started"
    training()