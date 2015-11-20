#!/usr/bin/ruby
require "cgi"

class Color
  @r
  @g
  @b
  attr_reader :r, :g, :b
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
  if (@r != @g) || (@r != @b) || (@g != @b) then
    if (@max == @r) then
      h = ((@g - @b).fdiv(@max - @min)) * 60
    elsif (@max == @g) then
      h = (((@b - @r).fdiv(@max - @min)) * 60) + 120
    elsif (@max == @b) then
      h = (((@r - @g).fdiv(@max - @min)) * 60) + 240
    end
  end
  if (@r == @g && @g == @b && @r == @b) then
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
    if (@r != @g) || (@r != @b) || (@g != @b) then
      s = ((@max - @min).fdiv(@max) * 255).round
    elsif (@r == @g && @g == @b && @r == @b) then
      s = 0
    end
    return @s = s.round
  end

#明度差を計算するときの明度
  def value()
    return ((@r * 299) + (@g * 587) + (@b * 114)).fdiv(1000)
  end

#明度差の計算
  def v_differ(c)
    return ((value() - c.value()).abs).round
  end

#ダイアード
  def h_differ(c)
    return (get_hue() - c.get_hue()).abs
  end

#ダイアード
  def diard()
    add = @max + @min
    di_r = add - @r
    di_g = add - @g
    di_b = add - @b
    return print("rgb(#{di_r},#{di_g},#{di_b})")
  end
end


#str1 = "000099"
#str2 = "ffffCC"

#c1 = Color.new(str1)
#c2 = Color.new(str2)
