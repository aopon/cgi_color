#!/usr/bin/ruby
require "cgi"

def set_pattern(p)
  fh = open("/Library/WebServer/Documents/aoi/aoi_portfolio/c1.css", "w")
  case p
  when "p1"
    fh.printf("body{background-color:red;}");
  when "p2"
    fh.printf("body{background-color:yellow;}");
  when "p3"
    fh.printf("body{background-color:green;}");
  when "p4"
    fh.printf("body{background-color:blue;}");
  when "p5"
    fh.printf("body{background-color:purple;}");
  end
  fh.close
end

data = CGI.new
p = data["c_pattern"]
set_pattern(p)

# ここから先は出力
print "Content-type: text/html\n\n"

print "<html>\n"
print '<head><META http-equiv="refresh"; content="0; URL=/aoi/menu.html"></head></html>'