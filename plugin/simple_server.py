import json

from bottle import run, post, request, response

@post('/process')
def my_process():
  # req_obj = json.loads(request.body.read())
  # do something with req_obj
  # ...
  return 'All done'

run(host='localhost', port=8080, debug=True)
