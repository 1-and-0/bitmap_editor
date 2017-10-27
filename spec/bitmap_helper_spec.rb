require './lib/bitmap'
require './lib/bitmap_helper'

describe BitmapHelper do
  bm = Bitmap.new(5, 5)
  context "executing executeCommand" do
    validcmd1 = "L 0 0 D"
    validcmd2 = "H 0 0 4 G"
    validcmd3 = "V 4 0 4 F"
    invalidcmd1 = "L -1 0 D"
    invalidcmd2 = "L 8 9 D"
    unrecognisedcmd = "INVALID"
    it "providing valid commands - command L" do
      cmd = validcmd1.split
      bm.executeCommand(cmd, bm)
      expect(bm.map[cmd[1].to_i][cmd[2].to_i]).to be cmd[3]
    end
    it "providing valid commands - command H" do
      cmd = validcmd2.split
      bm.executeCommand(cmd, bm)
      expect(bm.map[cmd[1].to_i]).to all( be == cmd[4])
    end
    it "providing valid commands - command V" do
      cmd = validcmd3.split
      bm.executeCommand(cmd, bm)
      expect(bm.map.transpose[cmd[1].to_i]).to all( be == cmd[4])
    end
    it "providing invalid commands (negative values)" do
      cmd = invalidcmd1.split
      expect { bm.executeCommand(cmd,bm) }.to output("Command #{cmd} ::: invalid coordinates for bitmap of size [#{bm.x} * #{bm.y}]\n").to_stdout
    end
    it "providing invalid commands (out of bitmap boundry)" do
      cmd = invalidcmd2.split
      expect { bm.executeCommand(cmd,bm) }.to output("Command #{cmd} ::: invalid coordinates for bitmap of size [#{bm.x} * #{bm.y}]\n").to_stdout
    end
    it "providing unrecognised commands" do
      cmd = unrecognisedcmd.split
      expect { bm.executeCommand(cmd,bm) }.to output("not a recognized command\n").to_stdout
    end
  end
  context "execute printBitmap" do
    it "should printBitmap" do
      bm.clearBitmap(bm)
      expect { bm.printBitmap(bm) }.to output("-----start--------\nO\tO\tO\tO\tO\t\nO\tO\tO\tO\tO\t\nO\tO\tO\tO\tO\t\nO\tO\tO\tO\tO\t\nO\tO\tO\tO\tO\t\n-------end--------\n").to_stdout
    end
  end
  context "execute clearBitmap" do
    it "should clearBitmap" do
      cmd = "V 4 0 4 F".split
      bm.executeCommand(cmd, bm)
      bm.clearBitmap(bm)
      expect(bm.map.transpose[cmd[1].to_i]).to all( be == 'O')
    end
  end
  context "execute drawPixel" do
    it "should drawPixel for valid coordinates" do
      cmd = "L 0 0 G".split
      bm.drawPixel(cmd[1], cmd[2], cmd[3], bm)
      expect(bm.map[cmd[1].to_i][cmd[2].to_i]).to be cmd[3]
    end
  end
  context "execute drawHorizontalLine" do
    it "should drawHorizontalLine for valid coordinates" do
      cmd = "H 0 0 4 X".split
      bm.drawHorizontalLine(cmd[1], cmd[2], cmd[3], cmd[4], bm)
      expect(bm.map[cmd[1].to_i]).to all( be == cmd[4])
    end
  end
  context "execute drawVerticalLine" do
    it "should drawVerticalLine for valid coordinates" do
      cmd = "V 4 4 0 Y".split
      bm.drawVerticalLine(cmd[1], cmd[2], cmd[3], cmd[4], bm)
      expect(bm.map.transpose[cmd[1].to_i]).to all( be == cmd[4])
    end
  end
end
