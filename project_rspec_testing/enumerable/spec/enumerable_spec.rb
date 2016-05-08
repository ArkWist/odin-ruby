# spec/enumerable_spec.rb
require "enumerable.rb"

describe Enumerable do
  subject { [1, 2, 4] }

  # How can I test this when there are no side effects?
  describe ".my_each" do
    context "passed a block" do
      it "does block on each element" do
        #expect([1, 2, 3].@dummy_class.my_each { |i| i + 1 }).to eq([2, 3, 5])
        #expect(data.my_each { |i| i + 1 }).to eq(data.each { |i| i + 1 })
        #expect(subject.my_each { |i| print i }).to eq("124")
      end
    end
  end
  
  # How can I test this when there are no side effects?
  describe ".my_each_with_index" do
    context "passed a block" do
      it "does block on each element with index" do
        #expect(subject.my_each { |e, i| print "#{i}:#{e} " }).to eq("1:1 2:2 3:4 ")
      end
    end
  end
  
  describe ".my_select" do
    context "passed a boolean block" do
      it "returns array satisfying the block" do
        expect(subject.my_select { |e| e > 1 }).to eq([2, 4])
      end
    end
  end
  
  describe ".my_all?" do
    context "passed a boolean block" do
      it "returns if all such elements are found" do
        expect(subject.my_all? { |e| e < 2 }).to eq(false)
        expect(subject.my_all? { |e| e < 5 }).to eq(true)
      end
    end
  end
  
  describe ".my_any?" do
    context "passed a boolean block" do
      it "returns if any such element is found" do
        expect(subject.my_any? { |e| e == 2 }).to eq(true)
        expect(subject.my_any? { |e| e == 3 }).to eq(false)
      end
    end
  end
  
  describe ".my_none?" do
    context "passed a boolean block" do
      it "returns if no such element is found" do
        expect(subject.my_none? { |e| e == 2 }).to eq(false)
        expect(subject.my_none? { |e| e == 3 }).to eq(true)
      end
    end
  end
  
  describe ".my_count" do
    context "passed a boolean block" do
      it "counts all such elements found" do
        expect(subject.my_count { |e| e % 2 == 0 }).to eq(2)
        expect(subject.my_count { |e| e < 2 }).to eq(1)
        expect(subject.my_count { |e| e < 5 }).to eq(3)
      end
    end
  end

  describe ".my_map" do
    context "passed a proc" do
      it "returns an array of tranformed elements" do
        expect(subject.my_map(Proc.new { |e| e ** 3 })).to eq([1, 8, 64])
      end
    end
    context "passed a block" do
      it "returns an array of tranformed elements" do
        expect(subject.my_map { |e| e ** 4 }).to eq([])
      end
    end
    context "passed a proc and a block" do
      it "returns an array of tranformed elements" do
        expect(subject.my_map(Proc.new { |e| e ** 2 }){ |e| e ** 3 }).to eq([1, 64, 4096])
      end
    end
  end
  
  describe ".inject" do
    subject { (5..10) }
    context "passed a block" do
      it "combines elements while accepting an initial vlaue" do
        expect(subject.inject { |sum, n| sum + n }).to eq(45)
        expect(subject.inject(1) { |product, n| product * n }).to eq(151200)
      end
    end
  end
  
end
