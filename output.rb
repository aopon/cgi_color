#!/usr/bin/ruby
require "cgi"
require "./class"

data = CGI.new

str1 = data["str1"].to_s
str2 = data["str2"].to_s

c1 = Color.new(str1)
c2 = Color.new(str2)

#rr = [c1.r, c2.r].max - [c1.r, c2.r].min
#gg = [c1.g, c2.g].max - [c1.g, c2.g].min
#bb = [c1.b, c2.b].max - [c1.b, c2.b].min
#h_differ = rr + gg + bb

print "Content-type: text/xml\n\n"
print ("<put>\n")
print ("<hsv>\n")
print ("hsv1 =(#{c1.get_hue},#{c1.get_sat},#{c1.get_val})\n")
print ("hsv2 =(#{c2.get_hue},#{c2.get_sat},#{c2.get_val})\n")
print ("明度差＝[#{c1.v_differ(c2)}]\n")
print ("</hsv>\n")
print ("<value>")
if 0 < c1.v_differ(c2) && c1.v_differ(c2) < 100 then
  print ("そのテキスト色だとかなり見にくいよ〜(ﾉ△･｡)\n")
  print ("あと[#{125-c1.v_differ(c2)}]の明度差が必要だよ\n")
  print ("<score>#{30}</score>\n")
elsif 100 < c1.v_differ(c2) && c1.v_differ(c2) < 125 then
  print ("惜しい！そのテキスト色だと見にくいよ〜(ﾉ△･｡)\n")
  print ("あと[#{125-c1.v_differ(c2)}]の明度差が必要だよ\n")
  print ("<score>#{50}</score>\n")
elsif c1.v_differ(c2) >= 125 then
  print ("ナイスチョイス！\n")
  print ("<score>#{100}</score>\n")
end
print ("</value>\n")
print ("</put>\n")
