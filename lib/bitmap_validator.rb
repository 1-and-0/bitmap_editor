module BitmapValidator
  def self.validateCommand(cmd, bitmap)
    case cmd[0]
    when 'L'
      xValueInBound(cmd[1], bitmap.x) && yValueInBound(cmd[2], bitmap.y)
    when 'H'
      xValueInBound(cmd[1], bitmap.x) && yValueInBound(cmd[2], bitmap.y) && yValueInBound(cmd[3], bitmap.y)
    when 'V'
      yValueInBound(cmd[1], bitmap.y) && xValueInBound(cmd[2], bitmap.x) && xValueInBound(cmd[3], bitmap.x)
    else
        return true
    end
  end

  def self.validateBitmap(x, y)
    return false unless (isInteger(x) && isInteger(y))
    return false unless (x.to_i >= 0 && y.to_i >= 0)
    return true
  end

  def self.xValueInBound(x, xlimit)
    return false unless isInteger(x)
    return false unless (x.to_i < xlimit && x.to_i >= 0)
    return true
  end

  def self.yValueInBound(y, ylimit)
    return false unless isInteger(y)
    return false unless (y.to_i < ylimit && y.to_i >= 0)
    return true
  end

  def self.isInteger str
    true if Integer(str) rescue false
  end
end
