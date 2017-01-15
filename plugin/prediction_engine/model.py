from collections import defaultdict
import nltk

class NgramModel():
    """ Basic Ngram model

        TO be added later
    """


    def __init__(self):
        self._wordDist = nltk.FreqDist()
        self.ngramsDict = defaultdict(int)



    def entropy(self, text):
        """ Calculate the entropy for the evaluation text


        :param text:
        :return:
        """

    def perplexity(self,text):
        """ Calculate the perplexity for the evaluation text


        :param text:
        :return:
        """

        return pow(2.0, self.entropy(text))

    def fit(self, corpus):
        """ Fits a model based on given corpus

        :param corpus: List of words.
        :return: None
        """

        self._wordDist = nltk.FreqDist(corpus)

        for nGram, count in self._wordDist.items():
            self.ngramsDict[nGram] = count

