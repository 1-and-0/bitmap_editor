require_relative 'bitmap_validator'

module BitmapHelper
  def executeCommand (cmd, bitmap)
    unless BitmapValidator::validateCommand(cmd, bitmap)
      puts "Command #{cmd} ::: invalid coordinates for bitmap of size [#{bitmap.x} * #{bitmap.y}]"
      return
    end

    case cmd[0]
    when 'S'
      printBitmap bitmap
    when 'C'
      clearBitmap bitmap
    when 'L'
      drawPixel(cmd[1], cmd[2], cmd[3], bitmap)
    when 'H'
      drawHorizontalLine(cmd[1], cmd[2], cmd[3], cmd[4], bitmap)
    when 'V'
      drawVerticalLine(cmd[1], cmd[2], cmd[3], cmd[4], bitmap)
    else
        puts 'not a recognized command'
    end
  end

  def printBitmap bitmap
    puts "-----start--------"
    bitmap.map.each do |row|
      row.each do |val|
        print "#{val}\t"
      end
      print "\n"
    end
    puts "-------end--------"
  end

  def clearBitmap bitmap
    bitmap.map = Array.new(bitmap.x) { Array.new(bitmap.y, 'O')}
  end

  def drawHorizontalLine(x, y1, y2, c, bitmap)
    x, y1, y2 = x.to_i, y1.to_i, y2.to_i
    if y1==y2
      bitmap.map[x][y1] = c
    elsif y2>y1
      bitmap.map[x][y1..y2] = bitmap.map[x][y1..y2].map! { c }
    else
      bitmap.map[x][y2..y1] = bitmap.map[x][y2..y1].map! { c }
    end
  end

  def drawVerticalLine(y, x1, x2, c, bitmap)
    transposedmap = bitmap.map.transpose
    y, x1, x2 = y.to_i, x1.to_i, x2.to_i
    if x1==x2
      bitmap.map[x1][y] = c
    elsif x2>x1
      transposedmap[y][x1..x2] = transposedmap[y][x1..x2].map! { c }
    else
      transposedmap[y][x2..x1] = transposedmap[y][x2..x1].map! { c }
    end
    bitmap.map = transposedmap.transpose unless x1 == x2
  end

  def drawPixel(x, y, c, bitmap)
    x, y = x.to_i, y.to_i
    bitmap.map[x][y] = c
  end
end
