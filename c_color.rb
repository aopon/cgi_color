#!/usr/bin/ruby
require "cgi"
#require "./r4"

def set_pattern(base,logo,head,navi,h_text,m_text,foot,btn)
  fh = open("/Library/WebServer/Documents/aoi/aoi_portfolio/c1.css", "w")
    fh.printf("
    body{background-color:##{base};}
    header{background-color:##{head};}
    #logo a{color:##{logo};}
    nav li a{color:##{navi};}
    .h_text{color:##{h_text};}
    .m_text{color:##{m_text};}
    .button a{background-color:##{btn};}
    .button a:nth-child(2){background-color:##{btn};}
    footer{background-color:##{foot};}");
  fh.close
end

data = CGI.new

base = data["base"]
logo = data["logo"]
head = data["head"]
navi = data["navi"]
h_text = data["h_text"]
m_text = data["m_text"]
foot = data["foot"]
btn = data["btn"]

# ここから先は出力

print "Content-type: text/xml\n\n"
set_pattern(base,logo,head,navi,h_text,m_text,foot,btn)
