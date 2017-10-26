require './lib/bitmap_editor'

describe BitmapEditor do
  context "executing the bitmap editor run function" do
    bme = BitmapEditor.new
    it "should fail when an invalid file is provided" do
      expect { bme.run "invalidfile.txt" }.to output("please provide correct file\n").to_stdout
    end
    it "should continue when a valid file is provided" do
      expect { bme.run "./examples/spec_test.txt" }.to output("Bitmap not yet created\n").to_stdout
    end
    it "should initialize a bitmap when a valid bitmap coordinates is given" do
      expect { bme.run "./examples/spec_createbitmap3*3.txt"}.to output("New Bitmap created of size :: (3 * 3)\n").to_stdout
    end
    it "should fail to initialize a bitmap when an invalid bitmap coordinates is given" do
      expect { bme.run "./examples/spec_invalidbitmap3*-1.txt"}.to output("invalid bitmap size (3,-1)\n").to_stdout
    end
    it "should fail to executeCommand when trying to run without a bitmap being created" do
      bme2 = BitmapEditor.new
      expect { bme2.run "./examples/spec_printbitmap.txt"}.to output("Bitmap not yet created\n").to_stdout
    end
  end
end
