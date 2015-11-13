#!/usr/bin/ruby
require "cgi"
class BMA
  def initialize(base, main, accent)
    @b = base
    @m = main
    @a = accent
  end

  def cssCode
    fh = open("/Library/WebServer/Documents/aoi/aoi_portfolio/c1.css", "w")
    fh.printf("body{background-color:#{@b};}#header{background-color:#{@m};}.h_text{color:#{@m};}.m_text{color:#000000;}.button{background-color:#{@a};}#footer{background-color:#{@m};}#lnav li a{color:#{@m};}")
    fh.close
  end

  def xmlCode
    print ("<color>\n<b>#{@b}</b>\n<m>#{@m}</m>\n<a>#{@a}</a>\n</color>\n")
  end

  attr_accessor :base
  attr_accessor :main
  attr_accessor :accent
end

  color1 = BMA.new("#f9e3f7","#ff69b4","#068dfb")
  color2 = BMA.new("#ffc0cb","#fff0f5","#A53F88")
  color3 = BMA.new("#fff0f5","#ff1493","#0bbff9")
  color4 = BMA.new("#ffffe0","#ff69b4","#A53F88")
  color5 = BMA.new("#f8f8ff","#ba55d3","#A53F88")

  color1.base = "#000000"
  color1.main = "#ffffff"
  color1.accent = "#ff00ff";


data = CGI.new
print "Content-type: text/xml\n\n"

p = data["p"]

if p == "0" then
  color1.xmlCode
  color1.cssCode

elsif p == "1" then
  color2.xmlCode
  color2.cssCode

elsif p == "2" then
  color3.xmlCode
  color3.cssCode

elsif p == "3" then
  color4.xmlCode
  color4.cssCode

elsif p == "4" then
  color5.xmlCode
  color5.cssCode
end
