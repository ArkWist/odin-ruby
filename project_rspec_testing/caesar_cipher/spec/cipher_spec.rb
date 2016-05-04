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
      
      
  
  
  
end