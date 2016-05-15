# spec/connect_four_spec.rb
require "connect_four"

describe "ConnectFour" do
  let(:c4) { ConnectFour.new }
  let(:bd) { c4.board }
  let(:p1) { ConnectFour::PLAYERS.first }
  let(:p2) { ConnectFour::PLAYERS.last}
  
  describe "c4.new" do
    it "creates a new game board" do
      expect(c4.board).to be_instance_of(Board)
    end
    it "sets player to #{ConnectFour::PLAYERS.first}" do
      expect(c4.player).to eq(p1)
    end
  end

  describe "c4.next_player" do
    it "changes from #{ConnectFour::PLAYERS.first} player to #{ConnectFour::PLAYERS.last} player" do
      c4.next_player
      expect(c4.player).to eq(p2)
    end
    it "changes from #{ConnectFour::PLAYERS.last} player to #{ConnectFour::PLAYERS.first} player" do
      c4.next_player
      expect(c4.player).to eq(p2)
      c4.next_player
      expect(c4.player).to eq(p1)
    end
  end
  
  describe "bd.make_move" do
    it "places a player's disc" do
      bd.make_move(p1, 1)
      expect(bd.columns[1][0]).to eq(p1)
    end
    it "stacks multiple discs" do
      bd.make_move(p1, 1); bd.make_move(p2, 1)
      expect(bd.columns[1][1]).to eq(p2)
    end
  end
  
  describe "bd.valid_move?" do
    it "affirms valid moves" do
      expect(bd.valid_move?(3)).to eq(true)
    end
    it "rejects non-Integer moves" do
      expect(bd.valid_move?(4.3)).to eq(false)
      expect(bd.valid_move?("connect")).to eq(false)
    end
    it "rejects moves that can't be made" do
      expect(bd.valid_move?(-2)).to eq(false)
      expect(bd.valid_move?(bd.columns.length + 1)).to eq(false)
    end
    it "rejects moves made on full columns" do
      5.times { bd.make_move(p1, 1) }
      expect(bd.valid_move?(1)).to eq(true)
      bd.make_move(p1, 1)
      expect(bd.valid_move?(1)).to eq(false)
    end
  end
  
  # Victory Checks
  
  describe ".horizontal_win?" do
    it "identifies horizontal wins for #{ConnectFour::PLAYERS.first}" do
      (0..2).each { |i| bd.make_move(p1, i) }
      expect(bd.horizontal_win?).to eq(false)
      bd.make_move(p1, 3)
      expect(bd.horizontal_win?).to eq(true)
    end
    it "identifies horizontal wins for #{ConnectFour::PLAYERS.last}" do
      c4.next_player
      (0..2).each { |i| bd.make_move(p2, i) }
      expect(bd.horizontal_win?).to eq(false)
      bd.make_move(p2, 3)
      expect(bd.horizontal_win?).to eq(true)
    end
    it "identifies elevated horiztonal wins" do
      (1..3).each { |i| bd.make_move(p1, i) }
      expect(bd.horizontal_win?).to eq(false)
      c4.next_player
      bd.make_move(p1, 4)
      (1..3).each { |i| bd.make_move(p1, i) }
      expect(bd.horizontal_win?).to eq(false)
      bd.make_move(p1, 4)
      expect(bd.horizontal_win?).to eq(true)
    end
  end
  
  describe ".vertical_win?" do
    it "identifies vertical wins" do
      bd.make_move(p2, 0)
      3.times { bd.make_move(p1, 0) }
      expect(bd.vertical_win?).to eq(false)
      bd.make_move(p1, 0)
      expect(bd.vertical_win?).to eq(true)
    end
  end
  
  describe ".ne_diagonal_win?" do
    it "identifies north-east directional wins" do
      bd.make_move(p1, 0)
      bd.make_move(p2, 1)
      bd.make_move(p1, 1)
      2.times { bd.make_move(p2, 2) }
      bd.make_move(p1, 2)
      expect(bd.ne_diagonal_win?).to eq(false)
      3.times { bd.make_move(p2, 3) }
      bd.make_move(p1, 3)
      expect(bd.ne_diagonal_win?).to eq(true)
    end
  end
  
  describe ".se_diagonal_win?" do
    it "identifies south-east directional wins" do
      3.times { bd.make_move(p2, 0) }
      bd.make_move(p1, 0)
      2.times { bd.make_move(p2, 1) }
      bd.make_move(p1, 1)
      bd.make_move(p2, 2)
      bd.make_move(p1, 2)
      expect(bd.se_diagonal_win?).to eq(false)
      bd.make_move(p1, 3)
      expect(bd.se_diagonal_win?).to eq(true)
    end
  end
  
  
  
  
  
  describe ".display" do
    context "Game board is empty" do
      it "Prints the empty game board" do
        #expect
      end
    end
  end
  

end

