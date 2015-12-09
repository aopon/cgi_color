#!/usr/bin/ruby
require "cgi"
require "./class"

def set_btn(btn2)
  fh = open("/Library/WebServer/Documents/aoi/aoi_portfolio/c3.css", "a")
    fh.printf(".button a:nth-child(2){background-color:##{btn2};}");
  fh.close
end

data = CGI.new

btn2 = data["btn2"].to_s
m1 = data["m1"].to_s

c1 = Color.new(btn2)
c2 = Color.new(m1)

# ここから先は出力
print "Content-type: text/xml\n\n"

set_btn(btn2)

#ダイアード判定
print ("<put>\n")
print ("<judge>")
if c1.h_differ(c2) == 180 then
  print ("ナイスダイアード！調和のとれた良いアクセントカラーを選べたね！100点満点！\n")
  print ("<score>#{100}</score>\n")
elsif (135 <= c1.h_differ(c2)) && (c1.h_differ(c2) <= 225) then
  print ("ナイスダイアード！良い色をチョイスしたね！100点！\n")
  print ("<score>#{100}</score>\n")
else
  print ("その色だと、メインカラーとの調和がとれて無いよ〜!!\n")
  print ("<score>#{50}</score>\n")
end
print ("</judge>\n")
#ダイアードのRGB数値
print ("<diard>\n")
c2.diard
print ("</diard>")
#p c1.get_sat
#p c1.get_val
print ("</put>")
