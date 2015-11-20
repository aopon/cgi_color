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

# ここから先は出力
print "Content-type: text/xml\n\n"
set_btn(btn2)
