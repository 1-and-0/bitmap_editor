require_relative 'bitmap'
require_relative 'bitmap_validator'

class BitmapEditor
  include BitmapValidator

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      line.upcase!
      cmd = line.split(" ")
      case cmd[0]
      when 'I'
        unless BitmapValidator.validateBitmap(cmd[1], cmd[2])
          puts "invalid bitmap size (#{cmd[1]},#{cmd[2]})"
          next
        end
        @bitmap = Bitmap.new(cmd[1].to_i, cmd[2].to_i)
      else
        unless @bitmap
          puts 'Bitmap not yet created'
          next
        end
        @bitmap.executeCommand(cmd, @bitmap)
      end
    end
  end
end
