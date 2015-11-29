#!/usr/bin/ruby
require "cgi"

def set_content(c)
  css = "border:3px solid #ffff00;"
  fh =   open("/Library/WebServer/Documents/aoi/aoi_portfolio/c2.css", "w")
  case c
  when "1" then
    fh.printf("body{#{css}}")
  when "2" then
    fh.printf("#logo a{#{css}}")
  when "3" then
    fh.printf("header{#{css}}")
  when "4" then
    fh.printf("nav li a{#{css}}")
  when "5" then
    fh.printf(".h_text{#{css}}")
  when "6" then
    fh.printf(".m_text{#{css}}")
  when "7" then
    fh.printf("footer{#{css}}")
  when "8" then
    fh.printf(".button a{#{css}}")
  when "9" then
    fh.printf(".button a:nth-child(2){#{css}}")
  end
  fh.close
end

data = CGI.new
c = data["c"]

print "Content-type: text/xml\n\n"
# ここから先は出力
set_content(c)
