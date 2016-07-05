require "linked_list"


describe LinkedList do
  let(:l) { LinkedList.new }
  let(:list) { LinkedList.new.append("abc").append("def").append("ghi") }
  
  describe "LinkedList.append" do
    context "the list is empty" do
      it "creates a head node" do
        l.append("abc")
        expect(l.head.value).to eq("abc")
      end
    end
    it "adds a nodes with the given value" do
      l.append("abc")
      l.append("def")
      expect(l.head.value).to eq("abc")
      expect(l.head.next_node.value).to eq("def")
    end
  end
  
  describe "LinkedList.to_s" do
    context "the list is empty" do
      it "prints 'nil'" do
        expect(l.to_s).to eq("nil")
      end
    it "prints each node in the list" do
      expect(list.to_s).to eq("( abc ) -> ( def ) -> ( ghi ) -> nil")
    end
  end
  
  describe "LinkedList.prepend" do
    context "the list is empty" do
      it "creates a head node" do
        l.prepend("abc")
        expect(l.head.value).to eq("abc")
      end
    it "creates a node at the head of the current list" do
      list.prepend("jkl")
      expect(l.head.value).to eq("jkl")
      expect(l.head.next_node.value).to eq("abc")
      expect(l.head.next_node.next_node.next_node.value).to eq("ghi")
    end
  end
  
  describe "LinkedList.size" do
    it "says how many nodes there are" do
      expect(l.size).to eq(0)
      expect(list.size).to eq(3)
    end
  end
  
  describe "LinkedList.tail" do
    it "gets the value of the last node" do
      expect(l.tail).to eq(nil)
      l.append("abc")
      expect(l.tail).to eq("abc")
      expect(list.tail).to eq("ghi")
    end
  end
  
  describe "LinkedLied.at" do
    it "gets the value of a certain node" do
      expect(list.at(0)).to eq("abc")
      expect(list.at(2)).to eq("ghi")
    end
    context "the index is out of range" do
      it "returns nil" do
        expect(list.at(-1)).to eq(nil)
        expect(list.at(5)).to eq(nil)
      end
    end
  end
  
  describe "LinkedList.pop" do
    it "removes the tail" do
      list.pop
      expect(list.tail.value).to eq("def")
    end
  end
  
  describe "LinkedList.contains" do
    it "confirms if any node in the list has a given value" do
      expect(list.contains?("def")).to eq(true)
      expect(list.contains?("bcd")).to eq(false)
    end
  end
  
  describe "LinkedList.find" do
    it "gets the index for a node with the given value" do
      expect(list.find("abc")).to eq(0)
      expect(list.find("def")).to eq(1)
      expect(list.find("jkl")).to eq(nil)
    end
  end
  
  describe "LinkedList.insert_at" do
    it "makes a node with a given value at the given index" do
      list.insert_at("jkl", 1)
      expect(list.head.next_node.value).to eq("jkl")
      expect(list.size).to eq(4)
      list.insert_at("mno", 0)
      expect(list.head.value).to eq("mno")
      list.insert_at("pqr", 5)
      expect(list.tail.value).to eq("pqr")
      list.insert_at("tuv", 8)
      expect(list.size).to eq(6)
    end
  end
  
  describe "LinkedList.remove_at" do
    it "removes a node at the given index" do
      list.remove_at(0)
      expect(list.head.value).to eq("def")
      expect(list.head.next_node.value).to eq("ghi")
      list.remove_at(5)
      expect(list.size).to eq(2)
    end
  end
  
end

