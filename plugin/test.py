# Code is compatible for python 2 and 3
from __future__ import division
from __future__ import print_function
from builtins import input
import os
import pickle
from prediction_engine.predict import predict

pkl_file = 'prediction_engine/nGramData.pkl'
with open(pkl_file, 'rb') as handle:
    dict_words = pickle.load(handle)

hist = "how are"
print (predict(dict_words, hist.split()))


