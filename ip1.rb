#!/usr/bin/ruby
require "cgi"
class BMA
  @b
  @m
  @a

  def initialize(b,m,a)
    @b = b
    @m = m
    @a = a
  end
end

bma = ["#EDD0E5","#ff69b4","#A53F88"]
bma1 = BMA.new("#EDD0E5","#ff69b4","#A53F88")

def set_color(b,m,a)
  fh = open("/Library/WebServer/Documents/aoi/aoi_portfolio/c1.css", "w")
  fh.printf("body{background-color:#{bma1.b};}#header{background-color:#{bma1.m};}#footer{background-color:#{bma1.m};}#lnav li a{color:#{bma1.a};}");
  fh.close
end

data = CGI.new
set_color(b,m,a)
# ここから先は出力
print "Content-type: text/html\n\n"

print "<html>\n"
print '<head><META http-equiv="refresh"; content="0; URL=/aoi/menu.html"></head></html>'
