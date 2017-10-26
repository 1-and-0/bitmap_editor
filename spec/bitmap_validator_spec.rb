require './lib/bitmap'
require './lib/bitmap_validator'

describe BitmapValidator do
  bmv = BitmapValidator
  bm = Bitmap.new(5, 5)
  context "executing validateCommand" do
    validcmd1 = "L 3 4 D"
    validcmd2 = "H 1 1 2 G"
    validcmd3 = "V 0 0 2 F"
    invalidcmd1 = "L -1 0 D"
    invalidcmd2 = "L 8 9 D"
    it "providing valid coordinates - command L" do
      cmd = validcmd1.split
      result = bmv::validateCommand(cmd, bm)
      expect(result).to be true
    end
    it "providing valid coordinates - command H" do
      cmd = validcmd2.split
      result = bmv::validateCommand(cmd, bm)
      expect(result).to be true
    end
    it "providing valid coordinates - command V" do
      cmd = validcmd3.split
      result = bmv::validateCommand(cmd, bm)
      expect(result).to be true
    end
    it "providing invalid values" do
      cmd = invalidcmd1.split
      result = bmv::validateCommand(cmd, bm)
      expect(result).to be false
    end
    it "providing values below or above size of the bitmap" do
      cmd = invalidcmd2.split
      result = bmv::validateCommand(cmd, bm)
      expect(result).to be false
    end
  end

  context "executing validateBitmap" do
    it "providing valid bitmap coordinates" do
      result = bmv::validateBitmap(3, 3)
      expect(result).to be true
    end
    it "providing invalid bitmap coordinates" do
      result = bmv::validateBitmap(-1, 0)
      expect(result).to be false
    end
  end
end
