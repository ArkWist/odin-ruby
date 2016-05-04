# spec/cipher_spec.rb

require "cipher.rb"

# Unneeded because there are no internal classes.
#Rspec.describe "caesar_cipher" do
#end

#describe "Cipher testing" do
describe "caesar_cipher" do
  it "shifts letters by a shift factor" do
    expect(caesar_cipher("hello", 2)).to eq("jgnnq")
  end
end