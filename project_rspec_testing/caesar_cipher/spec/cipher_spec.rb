# spec/cipher_spec.rb
require "cipher.rb"

describe "caesar_cipher" do
  context "given text and shift factor" do
    it "shifts a to z" do
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
    it "wraps a to z" do
      expect(caesar_cipher("ForGG", 27)).to eq("GpsHH")
    end
  end
  
  context "given shift multiply over 26" do
    it "wraps a to z multiple times" do
      expect(caesar_cipher("ForGG", 53)).to eq("GpsHH")
    end
  end

  context "given negative shift" do
    it "shifts z to a" do
      expect(caesar_cipher("rabbit", -1)).to eq("qzaahs")
    end
  end
  
  context "given negative shift under -26" do
    it "wraps z to a" do
      expect(caesar_cipher("rabbit", -27)).to eq("qzaahs")
    end
  end
  
  context "given non-alphabetical letters" do
    it "maintains non-alphabetical letters" do
      expect(caesar_cipher("This... is a test!", 1)).to eq("Uijt... jt b uftu!")
    end
  end
end