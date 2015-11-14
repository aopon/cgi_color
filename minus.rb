#!/usr/bin/ruby
require "cgi"

def set_btn(btn)
  fh = open("/Library/WebServer/Documents/aoi/aoi_portfolio/c1.css", "a")
    fh.printf(".button a:nth-child(2){background-color:##{btn};}");
  fh.close
end

data = CGI.new

btn = data["btn2"]

# ここから先は出力
print "Content-type: text/xml\n\n"
set_btn(btn)
