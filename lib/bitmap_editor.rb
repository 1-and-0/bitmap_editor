require_relative 'bitmap'

class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      cmd = line.split(" ")
      case cmd[0]
      when 'I'
        unless BitmapValidator::validateBitmap(cmd[1], cmd[2])
          puts 'invalid bitmap size'
          return
        end
        @bitmap = Bitmap.new(cmd[1].to_i, cmd[2].to_i)
      else
        puts 'Bitmap not yet created' unless @bitmap
        @bitmap.executeCommand(cmd, @bitmap)
      end
    end
  end
end
