# spec/cipher_spec.rb

require "cipher.rb"

# shifts text
# wraps from z to a
# keeps case
# handles shift of 0
# handles shift over 26
# handles negative shift
# handles shift with punctuation

describe "caesar_cipher" do
  context "given text and shift factor" do
    it "returns shifted text" do
      expect(caesar_cipher("hello", 2)).to eq("jgnnq")
    end
  end
  
  context "given letters near z" do
    it "wraps from z to a" do
      expect(caesar_cipher("voxel", 5)).to eq("atcjq")
    end
  end
  
  context "given mixed cases" do
    it "maintains letter case" do
      expect(caesar_cipher("ForGG", 1)).to eq("GpsHH")
    end
  end
  
  context "given no shift" do
    it "doesn't shift" do
      expect(caesar_cipher("velocity", 0)).to eq("velocity")
    end
  end
  
  context "given shift over 26" do
    it "wraps a to z multiple times" do
      expect(caesar_cipher("ForGG", 27)).to eq("GpsHH")
    end
  end
      
      
  
  
  
end