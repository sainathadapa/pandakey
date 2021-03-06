# Code is compatible for python 2 and 3
from __future__ import division
from __future__ import print_function
from builtins import input
import os
import pickle

def predict(dict_words, history):
    ''' Gives back the best prediction for next word '''

    hist_words = []
    if not all(isinstance(word,str) for word in history):
        hist_words = [str(word) for word in history]
    else:
        hist_words = history

    no_of_words = len(hist_words)
    needed_words = []

    if no_of_words>2:
        print ("2 words are enough for prediction")
        needed_words = hist_words[-2:]
    elif no_of_words==2:
        needed_words=hist_words
    elif no_of_words==1:
        print ("Please input at least 2 words for prediction")
        needed_words = hist_words.append('undef')
    else:
        print ("How the fuck should I predict if you don't give me any input")
        needed_words = 2 * ['undef']

    word = 'fuck'
    count = 1
    for nGram in dict_words.keys():
        if nGram[0]==hist_words[-2] and nGram[1]==hist_words[-1]:
            if dict_words[nGram] >= count:
                word = nGram[-1]
                count = dict_words[nGram]

    return word

if __name__ == "__main__":
    pkl_file = os.path.join(os.path.dirname(__file__), 'nGramData.pkl')
    with open(pkl_file, 'rb') as handle:
        dict_words = pickle.load(handle)

    hist = ""
    while(hist != "quit"):
        hist = input("Enter two words :")
        print (predict(dict_words, hist.split()))


