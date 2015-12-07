#!/usr/bin/ruby 
require 'rubygems'
require 'grok-pure'
require "awesome_print"
 
grok = Grok.new

print grok.add_patterns_from_file("../grok.d/base")
print grok.add_patterns_from_file("../grok.d/zimbra_patterns")

authlog = '2015-12-05 18:47:36,435 INFO  [qtp1545357780-7135140:http://127.0.0.1:80/service/soap/AuthRequest] [name=pepe@domain.com;oip=10.1.2.123;ua=zclient/2.0.5_GA_1839;] security - cmd=Auth; account=pepe@domain.com; protocol=soap;'
pattern = '%{ZIMBRAAUDIT}'
grok.compile(pattern)
#print grok.match(authlog).captures()
ap grok.match(authlog).captures()
print "\n"
print "\n"
print "\n"
