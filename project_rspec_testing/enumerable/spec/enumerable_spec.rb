# spec/enumerable_spec.rb
require "enumerable.rb"

# .my_all?
# my_any?
# my_none?
# my_count
# my_map
# my_inject << multiple_els
# my_map << with proc
# my_map << with proc, block, or both, but do block only if both given

#class DummyClass
#end
#before(:each) do
#  @dummy_class = DummyClass.new
#  @dummy_class.extend(Enumerable)
#end

describe Enumerable do
  subject { [1, 2, 4] }

  # Don't know how to test this properly
  describe ".my_each" do
    context "passed a block" do
      it "does block on each element" do
        #expect([1, 2, 3].@dummy_class.my_each{ |i| i + 1 }).to eq([2, 3, 5])
        #expect(data.my_each{ |i| i + 1 }).to eq(data.each{ |i| i + 1 })
        #expect(subject.my_each{ |i| print i }).to eq("124")
      end
    end
  end
    
  describe ".my_each_with_index" do
    context "passed a block" do
      it "does block on each element with index" do
        #expect(subject.my_each{ |e, i| print "#{i}:#{e} " }).to eq("1:1 2:2 3:4 ")
      end
    end
  end
  
  describe ".my_select" do
    context "passed a boolean block" do
      it "returns array satisfying the block" do
        expect(subject.my_select{ |e| e > 1 }).to eq([2, 4])
      end
    end
  end
  
  describe ".my_all?" do
    context "passed a boolean block" do
      it "returns if all elements satisfy the block" do
        expect(subject.my_select{ |e| e < 2}).to eq(false)
        expect(subject.my_select{ |e| e < 5}).to eq(true)
      end
    end
  end
    

end



