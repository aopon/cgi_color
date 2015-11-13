#!/usr/bin/ruby

class Color
  def initialize(s)
    (@k,@n,@b,@m,@a) = s.split(",")
  end
  def selColor(kind,num)
    @k = kind
    @n = num
  end
end

color_list = []

fh = open("data.txt")
while line = fh.gets
  print line
  d = Color.new(line.chomp)
  color_list.push(d)
end

print color_list
print "\n"

k = gets
n = gets

for i in 0..color_list.size-1
  if k == color_list[i][0] then
     color_list[i]
  end
end
fh.close
