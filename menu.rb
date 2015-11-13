#!/usr/bin/ruby
require "cgi"

def set_pattern(p)
  fh = open("/Library/WebServer/Documents/aoi/aoi_portfolio/c1.css", "w")
  case p
  when "ip1"
    fh.printf("body{background-color:#EDD0E5;}#header{background-color:#ff69b4;}#footer{background-color:#ff69b4;}#lnav li a{color:#A53F88;}");
  when "ip2"
    fh.printf("body{background-color:#EDFFFF;}#header{background-color:#3CF;}#footer{background-color:#3CF;}#lnav li a{color:#A53F88;}");
  when "ip3"
    fh.printf("body{background-color:#000000;}#header{background-color:#ffffff;}#footer{background-color:#ffffff;}#lnav li a{color:#ffffff;}p{color:#ffffff;}");
  when "cp1"
    fh.printf("body{background-color:red;}");
  when "cp2"
    fh.printf("body{background-color:yellow;}");
  when "cp3"
    fh.printf("body{background-color:green;}");
  when "cp4"
    fh.printf("body{background-color:blue;}");
  when "cp5"
    fh.printf("body{background-color:purple;}");
  end
  fh.close
end

data = CGI.new
p = data["pattern"]
set_pattern(p)

# ここから先は出力
print "Content-type: text/html\n\n"

print "<html>\n"
print '<head><META http-equiv="refresh"; content="0; URL=/aoi/menu.html"></head></html>'
