# spec/enumerable_spec.rb
require "enumerable.rb"

# .myeach
# .my_each_with_index
# .my_select
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
  subject { [1, 2, 3] }

  describe ".my_each" do
    context "block passed to .my_each" do
      it "do block on each element" do
        #expect([1, 2, 3].@dummy_class.my_each{ |i| i + 1 }).to eq([2, 3, 4])
        #expect(data.my_each{ |i| i + 1 }).to eq(data.each{ |i| i + 1 })
        expect(subject.my_each{ |i| puts i }).to eq("123")
      end
    end
    
  end
end



