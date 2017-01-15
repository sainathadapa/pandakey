# This is the code for training data to
# calculate the prob for the n-grams
from __future__ import division
from model import NgramModel
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

    nmodel = NgramModel()
    nmodel.fit(brown_words)

    nGramData = os.path.join(os.path.dirname(__file__),'nGramData.pkl')

    with open(nGramData, 'wb') as handle:
        pickle.dump(nmodel.ngramsDict, handle, -1)


if __name__ == "__main__":
    print ("Training started")
    training()