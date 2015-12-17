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
  print ("ボタンの調和性が最高だね。ナイスチョイス！\n")
  print ("<score>#{100}</score>\n")
elsif (135 <= c1.h_differ(c2)) && (c1.h_differ(c2) <= 225) then
  print ("ボタンの調和性が良いね。ナイスチョイス！\n")
  print ("<score>#{100}</score>\n")
else
  print ("ボタンの調和性が悪いよ。メインカラーの補色の関係にある色を選ぶぼう!\n")
  print ("<score>#{60}</score>\n")
end
print ("</judge>\n")

print ("<judge2>\n")
if 245<= c1.get_sat && c1.get_sat <= 255 then
  print ("ボタンの視認性が最高だね。ナイスチョイス！\n")
  print ("<score3>#{100}</score3>\n")
elsif 235 <= c1.get_sat && c2.get_sat <= 244 then
  print ("ボタンの視認性が良いね。もう少し彩度を高くすると良くなるよ！\n")
  print ("<score3>#{90}</score3>\n")
elsif 225 <= c1.get_sat && c2.get_sat <= 234 then
  print ("ボタンの視認性はまぁまぁ。もう少し彩度を高くすると良くなるよ！\n")
  print ("<score3>#{80}</score3>\n")
else
  print ("ボタンの視認性が悪いよ。彩度を思い切って上げてみよう！\n")
  print ("<score3>#{60}</score3>\n")
end
print ("</judge2>\n")

#ダイアードのRGB数値
print ("<diard>\n")
c2.diard
print ("</diard>")
print ("</put>")
