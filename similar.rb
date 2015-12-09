#!/usr/bin/ruby
require "cgi"
require "./class"

data = CGI.new

main = data["main"].to_s
m1 = data["m1"].to_s

c1 = Color.new(main)
c2 = Color.new(m1)

# ここから先は出力
print "Content-type: text/xml\n\n"
#ダイアード判定
print ("<put>\n")
print ("<judge>")
if (0 <= c1.h_differ(c2)) && (c1.h_differ(c2) <= 45) then
  print ("まとまりのある類似色を選べたね！調和がとれた組み合わせでGOOD！100点満点！\n")
  print ("<score>#{100}</score>\n")
else
  print ("その色だと、バランスの悪い色になってしまっているよ〜!!メインカラーと似た色を選択しよう！\n")
  print ("<score>#{50}</score>\n")
end
print ("</judge>\n")
#ダイアードのRGB数値

print ("</put>")
