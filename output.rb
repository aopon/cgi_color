#!/usr/bin/ruby
require "cgi"
require "./class"

data = CGI.new

str1 = data["str1"].to_s
str2 = data["str2"].to_s

c1 = Color.new(str1)
c2 = Color.new(str2)

print "Content-type: text/xml\n\n"
print ("<put>\n")
print ("<hsv>\n")
print ("hsv1 =(#{c1.get_hue},#{c1.get_sat},#{c1.get_val})\n")
print ("hsv2 =(#{c2.get_hue},#{c2.get_sat},#{c2.get_val})\n")
print ("明度差＝[#{c1.v_differ(c2)}]\n")
print ("</hsv>\n")
print ("<value>")
if 0 < c1.v_differ(c2) && c1.v_differ(c2) < 100 then
  print ("テキストの可読性が悪くて見にくいよ。もっと濃い色を選ぼう！")
  print ("あと[#{125-c1.v_differ(c2)}]の明度差を付けると加点されるよ。\n")
  print ("<score>#{60}</score>\n")
elsif c1.v_differ(c2) >= 125 then
  print ("テキストの可読性が最高だね。ナイスチョイス！\n")
  print ("<score>#{100}</score>\n")
end
print ("</value>\n")
print ("</put>\n")
