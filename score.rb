#!/usr/bin/ruby
require "cgi"
require "./class"

data = CGI.new

str1 = data["str1"].to_s
str2 = data["str2"].to_s

c1 = Color.new(str1)
c2 = Color.new(str2)

rr = [c1.r, c2.r].max - [c1.r, c2.r].min
gg = [c1.g, c2.g].max - [c1.g, c2.g].min
bb = [c1.b, c2.b].max - [c1.b, c2.b].min
h_differ = rr + gg + bb

print "Content-type: text/xml\n\n"
print ("<score>\n")
if c1.v_differ(c2) < 125 && h_differ < 500 then
  print ("#{30}\n")
elsif c1.v_differ(c2) >= 125 && h_differ < 500 then
  print ("#{50}\n")

elsif c1.v_differ(c2) < 125 && h_differ >= 500 then
  print ("#{50}\n")
else
  print ("#{100}\n")
end

#ダイアード判定
#print ("<diard>\n")
#p c1.h_differ(c2)
#if c1.h_differ(c2) == 180 then
#  print ("ナイスダイアード！100点満点！\n")
#elsif (160 <= c1.h_differ(c2)) && (c1.h_differ(c2) <= 200) then
#  print ("プチダイアード！80点！\n")
#else
#  print ("BAD!!!\n")
#end
#ダイアードのRGB数値
#c1.diard
#print ("</diard>\n")
print ("</put>\n")
