#!/usr/bin/ruby
require "cgi"

class Color
  def initialize(s)
    (@k, @n, @b, @m, @a) = s.split(",")
  end

  def color_set(kind, num, base, main, accent)
    @k = kind
    @n = num
    @b = base
    @m = main
    @a = accent
  end

  def selColor(k, n)
    for i in 0..color_list.size-1
      if ((k == color_list[i].kind) && (n == color_list[i].num)) then
        print color_list[i]
      end
    end
  end

  def cssCode
    fh = open("/Library/WebServer/Documents/aoi/aoi_portfolio/c1.css", "w")
    fh.printf("body{background-color:#{@b};}#header{background-color:#{@m};}.h_text{color:#{@m};}.m_text{color:#000000;}.button{background-color:#{@a};}#footer{background-color:#{@m};}#lnav li a{color:#{@m};}")
    fh.close
  end

  def xmlCode
    print ("<color>\n<b>#{@b}</b>\n<m>#{@m}</m>\n<a>#{@a}</a>\n</color>\n")
  end
end

color_list = []#空の配列を用意

fh = open("data.txt")

while(line = fh.gets) #data.txtを一行ずる読む
  print line
  d = Color.new(line.chomp) #chompで行末尾の改行コードを取り除く
  color_list.push(d)
end
fh.close

msg = "欲しい色のナンバーを選べ（1~3）"
while true
  puts(msg)
  k = gets()
  n = gets()
  selColor(k,n)

end
