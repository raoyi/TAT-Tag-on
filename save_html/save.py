#!/usr/bin/env python
import urllib2
import ConfigParser

conf = ConfigParser.ConfigParser()
conf.read('config.ini')

#url[0]*url[1]
url = conf.get('config','url').split('*')
itemfile = conf.get('config','itemfile')

#items[i]
items = open(itemfile).readlines()

i = 0
while i<len(items):
    r = urllib2.urlopen(url[0]+items[i].split('\n')[0]+url[1])
    f = open(items[i].split('\n')[0]+".html",'w')
    f.write(r.read())
    f.close()
    i = i+1
