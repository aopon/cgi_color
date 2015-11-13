#!/usr/bin/ruby
# -*- coding: utf-8 -*-
require "cgi"
require "./r5"

data = CGI.new

str1 = data["str1"].to_s
str2 = data["str2"].to_s

c1 = Color.new(str1)
c2 = Color.new(str2)

print "Content-type: text/xml\n\n"
print ("hsv =(#{c1.get_hue},#{c1.get_sat},#{c1.get_val})\n")
print ("hsv =(#{c2.get_hue},#{c2.get_sat},#{c2.get_val})\n")

#明度差の計算
if c1.get_val > c2.get_val then
  p differ = c1.get_val - c2.get_val
else
  p differ = c2.get_val - c1.get_val
end

