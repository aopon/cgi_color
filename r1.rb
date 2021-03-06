#!/usr/bin/ruby
require "cgi"
require "./rr1"

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
print ("<put>\n")

#HSV
print ("<hsv>\n")
print ("hsv1 =(#{c1.get_hue},#{c1.get_sat},#{c1.get_val})\n")
print ("hsv2 =(#{c2.get_hue},#{c2.get_sat},#{c2.get_val})\n")

#RGB
print ("rgb1 =(#{c1.r},#{c1.g},#{c1.b})\n")
print ("rgb2 =(#{c2.r},#{c2.g},#{c2.b})\n")

#明度差・色差
print ("明度差＝[#{c1.v_differ(c2)}]\n")
print ("色差＝[#{h_differ}]\n")
print ("</hsv>\n")

#可読性判定
print ("<value>")
if c1.v_differ(c2) < 125 && h_differ < 500 then
  print ("そのテキスト色だと見にくいよ〜(ﾉ△･｡)\n")
  print ("あと[#{125-c1.v_differ(c2)}]の明度差と\n")
  print ("あと[#{765-h_differ}]の色差が必要だよ\n")

elsif c1.v_differ(c2) >= 125 && h_differ < 500 then
  print ("惜しい！\n")
  print ("テキスト色の色差が、あと[#{765-h_differ}]必要だよ\n")

elsif c1.v_differ(c2) < 125 && h_differ >= 500 then
  print ("惜しい！\n")
  print ("テキスト色の明度差があと[#{125-c1.v_differ(c2)}]必要だよ\n")
else
  print ("テキストの色がNICEチョイス！\n")
end
print ("</value>\n")

#ダイアード判定
print ("<diard>\n")
p c1.h_differ(c2)
if c1.h_differ(c2) == 180 then
  print ("ナイスダイアード！100点満点！\n")
elsif (160 <= c1.h_differ(c2)) && (c1.h_differ(c2) <= 200) then
  print ("プチダイアード！80点！\n")
else
  print ("BAD!!!\n")
end

#ダイアードのRGB数値
c1.diard
print ("</diard>\n")
print ("</put>\n")
