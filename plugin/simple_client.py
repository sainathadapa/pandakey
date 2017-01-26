import http.client as ht

c = ht.HTTPConnection('localhost', 8080)
c.request('POST', '/process', '{"input": ["how", "about"]}')
doc = c.getresponse().read().decode('UTF-8')
print(doc)
