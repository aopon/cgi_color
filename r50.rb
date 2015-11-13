#!/usr/bin/ruby
# -*- coding: utf-8 -*-

require "./r5"

str1 = "AA2233"
str2 = "558822"

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

print "c1:hue "
print c1.get_hue
print "\n"
print "c2:hue "
print c2.get_hue
print "\n"


print c1.hue_diff(c2)

