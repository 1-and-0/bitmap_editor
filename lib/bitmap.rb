require_relative 'bitmap_helper'

class Bitmap
  include BitmapHelper

  attr_accessor :x, :y, :map

  def initialize(x, y)
      @map = Array.new(x) { Array.new(y, 'O')}
      @x, @y = x, y
      puts "New Bitmap created of size :: (#{@x} * #{@y})"
  end
end
