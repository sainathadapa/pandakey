from __future__ import division
from __future__ import print_function
from builtins import input
import os
import pickle
from prediction_engine.predict import predict
import json
from bottle import run, post, request, response

pkl_file = 'prediction_engine/nGramData.pkl'
with open(pkl_file, 'rb') as handle:
    dict_words = pickle.load(handle)

@post('/process')
def my_process():
  req_obj = request.body.read().decode('UTF-8')
  input_data = json.loads(req_obj)['input']
  predicted = predict(dict_words, input_data)
  return predicted

run(host='localhost', port=8080, debug=True)
