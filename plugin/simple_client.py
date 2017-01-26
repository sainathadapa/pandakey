import httplib

c = httplib.HTTPConnection('localhost', 8080)
c.request('POST', '/process', '{"input": ["how", "about"]}')
doc = c.getresponse().read()
print doc
