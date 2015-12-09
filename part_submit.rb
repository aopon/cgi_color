#!/usr/bin/ruby
require "cgi"

def set_partcolor(c,part)
  fh =   open("/Library/WebServer/Documents/aoi/aoi_portfolio/c3.css", "a")
  case c
  when "1" then
    fh.printf("body{background-color:##{part};}")
  when "2" then
    fh.printf("#logo a{color:##{part};}")
  when "3" then
    fh.printf("header{background-color:##{part};}")
  when "4" then
    fh.printf("nav li a{color:##{part};}")
  when "5" then
    fh.printf(".h_text{color:##{part};}")
  when "6" then
    fh.printf(".m_text{color:##{part};}")
  when "7" then
    fh.printf("footer{background-color:##{part};}")
  when "8" then
    fh.printf(".button a{background-color:##{part};}")
    fh.printf(".button a:nth-child(2){background-color:##{part};}")
  when "9" then
    fh.printf(".button a:nth-child(2){background-color:##{part};}")
  end
  fh.close
end

data = CGI.new
c = data["c"]
part = data["part"]

print "Content-type: text/xml\n\n"
# ここから先は出力
set_partcolor(c,part)
