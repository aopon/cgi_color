#!/usr/bin/ruby
require "cgi"
require "./class"

def set_btn(btn2)
  fh = open("/Library/WebServer/Documents/aoi/aoi_portfolio/c1.css", "a")
    fh.printf(".button a:nth-child(2){background-color:##{btn2};}");
  fh.close
end

data = CGI.new

btn2 = data["btn2"].to_s
m1 = data["m1"].to_s

c1 = Color.new(btn2)
c2 = Color.new(m1)

rr = [c1.r, c2.r].max - [c1.r, c2.r].min
gg = [c1.g, c2.g].max - [c1.g, c2.g].min
bb = [c1.b, c2.b].max - [c1.b, c2.b].min
h_differ = rr + gg + bb

# ここから先は出力
print "Content-type: text/xml\n\n"

set_btn(btn2)

#ダイアード判定
print ("<put>\n")
print ("<judge>")
if c1.h_differ(c2) == 180 then
  print ("ナイスダイアード！調和のとれた良いアクセントカラーを選べたね！100点満点！\n")
elsif (150 <= c1.h_differ(c2)) && (c1.h_differ(c2) <= 210) then
  print ("プチダイアード！もう少し改善すると良くなるよ！80点！\n")
else
  print ("その色だと、メインカラーとの調和がとれて無いよ〜!!\n")
end
print ("</judge>\n")
#ダイアードのRGB数値
print ("<diard>\n")
c2.diard
print ("</diard>")
print ("</put>")
