#!/usr/bin/ruby
require "csv"
require "cgi"


def set_kind(k)
  array = []
  line_read = CSV.foreach("data.csv")do|row|
  array << row
  end
  print ("<list>\n")
  for i in 0..array.size-1
    if array[i][0] == k then
      print("<color>\n<b>#{array[i][2]}</b>\n<m>#{array[i][3]}</m>\n<a>#{array[i][4]}</a>\n</color>\n")

      fh =   open("/Library/WebServer/Documents/aoi/aoi_portfolio/c1.css", "w")
        fh.printf("body{background-color:#{array[i][2]};}#header{background-color:#{array[i][3]};}#header a{color:#{array[i][3]};}.h_text{color:#{array[i][4]};}.m_text{color:#000000;}.button a{background-color:#{array[i][4]};}.button a:nth-child(2){background-color:##{array[i][4]};}#footer{background-color:#{array[i][3]};}#lnav li a{color:#{array[i][3]};}")
      fh.close
    end
  end
  print ("</list>\n")
end

data = CGI.new
k = data["k"]

print "Content-type: text/xml\n\n"
# ここから先は出力
set_kind(k)

#print "<html>\n"
#print '<html><head><META http-equiv="refresh"; content="0; URL=/aoi/top.html"></head></html>'
#print "<body>"
#print "</body>"
#print "</html>"
