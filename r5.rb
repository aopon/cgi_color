#!/usr/bin/ruby
# -*- coding: utf-8 -*-

class Color
  @r
  @g
  @b
  def initialize(str)
    #HEXをRGB値に変換
    @r = str[0..1].hex
    @g = str[2..3].hex
    @b = str[4..5].hex

    #最大値を求める
    @max = [@r, @g, @b].max
    @min = [@r, @g, @b].min
  end

  #明度差(Value)の計算
  def get_val()
    return @v = @max
  end

  #色相(Hue)の計算
  def get_hue()
    if (@max == @r) then
      h = ((@g - @b).fdiv(@max - @min)) * 60
    elsif (@max == @g) then
      h = (((@b - @r).fdiv(@max - @min)) * 60) + 120
    elsif (@max == @b) then
      h = (((@r - @g).fdiv(@max - @min)) * 60) + 240
    elsif (@r == @g && @g == @b && @r == @b) then
      h = 0
    end

    if h < 0 then
      h = h + 360
    end
    return @h = h.round
  end

  #彩度(saturation)の計算
  def get_sat()
    #彩度(saturation)の計算
    return @s = ((@max - @min).fdiv(@max) * 255).round
  end

  def hue_diff(c)
    h1 = get_hue
    h2 = c.get_hue
    d = (h1 - h2).abs
    if d <= 180
      return d
    else
      return 360 - d
    end
  end

end


str1 = "AA2233"
str2 = "558822"

c1 = Color.new(str1)
c2 = Color.new(str2)

print "Content-type: text/xml\n\n"
print ("hsv =(#{c1.get_hue},#{c1.get_sat},#{c1.get_val})\n")
print ("hsv =(#{c2.get_hue},#{c2.get_sat},#{c2.get_val})\n")

#明度差の計算
if c1.get_val > c2.get_val then
  p differ = c1.get_val - c2.get_val
else
  p differ = c2.get_val - c1.get_val
end

print "c1:hue "
print c1.get_hue
print "\n"
print "c2:hue "
print c2.get_hue
print "\n"


print c1.hue_diff(c2)

