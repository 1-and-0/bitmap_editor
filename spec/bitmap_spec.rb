require './lib/bitmap'

describe Bitmap do
  context "initializing a new bitmap" do
    it "should create a new bitmap for valid values - 0 value limits" do
      x = 0
      y = 0
      bm1 = Bitmap.new(x, y)
      expect(bm1.x == x && bm1.y == y).to be true
    end
    it "should create a new bitmap for valid values - random value limit" do
      x = rand(10)
      y = rand(10)
      bm1 = Bitmap.new(x, y)
      expect(bm1.x == x && bm1.y == y).to be true
    end
  end
end
