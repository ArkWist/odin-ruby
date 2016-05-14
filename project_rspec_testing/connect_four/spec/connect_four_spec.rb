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
    it "sets player to #{p1}" do
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
      expect(bd.column[1][0]).to eq(p1)
    end
    it "stacks multiple discs" do
      bd.make_move(p1, 1); bd.make_move(p2, 1)
      expect(bd.column[1][1]).to eq(p2)
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
      expect(bd.valid_move?(bd.column.length + 1)).to eq(false)
    end
    it "rejects moves made on full columns" do
      5.times { bd.make_move(p1, 1) }
      expect(bd.valid_move?(1)).to eq(true)
      bd.make_move(p1, 1)
      expect(bd.valid_move?(1)).to eq(false)
    end
  end
  
  describe ".horizontal_win?" do
    it "identifies horizontal wins" do
      (0..2).times_with_index { |i| c4.move(i) }
      expect(bd.horizontal_win?).to eq(false)
      c4.move(3)
      expect(bd.horizontal_win?).to eq(true)
    end
    it "identifies elevated horiztonal wins" do
      (1..3).times_with_index { |i| c4.move(i) }
      expect(bd.horizontal_win?).to eq(false)
      c4.next_player
      c4.move(4)
      (1..3).times_with_index { |i| c4.move(i) }
      expect(bd.horizontal_win?).to eq(false)
      c4.move(4)
      expect(bd.horizontal_win?).to eq(true)
    end
  end
  
  describe ".vertical_win?" do
    it "identifies vertical wins" do
      3.times { c4.move(0) }
      expect(bd.vertical_win?).to eq(false)
      c4.move(0)
      expect(bd.vertical_win?).to eq(true)
    end
  end
  
    # horizonatal win
    # vertical win
    # diagonal win
    # no win
    # draw

=begin
  describe "bd.valid_move?" do
    it "places player's disc" do
      bd.valid_move?(1)
      expect(bd.column[1][0]).to eq(p1)
    end
    it "alternately places discs by player" do
      c4.move(1)
      expect(bd.column[1][0]).to eq(p1)
      c4.move(1)
      expect(bd.column[1][1]).to eq(p2)
    end
    context "column is not a number" do
      it "rejects the move" do
        c4.move("j")
        expect(bd.column[bd.column.length + 1][0]). to eq(nil)
        #expect(player).to eq(p1)
      end
    end
    context "column does not exist" do
      it "rejects the move" do
        c4.move(bd.column.length + 1)
        expect(bd.column[bd.column.length + 1][0]). to eq(nil)
        #expect(player).to eq(p1)
      end
    end
    context "columns is full" do
      it "rejects the move" do
        8.times { c4.move(1) }
        expect(bd.column[1].length).to eq(7)
        #expect(c4.player).to eq(p1)
      end
    end
  end
  describe ".game_set" do
  end
  
  describe ".play" do
  end
=end
end


=begin
describe ConnectFour, "#game_set" do
  context "with 4 discs in a horizontal row" do
    it "recogizes player's victory" do
      4.times { c4.drop_disc(p1, 1)  >> 3.times + 1
                c4.drop_disc(p2, 2) }
      expect
      
      c4.current_player = current_playercurrent_player = connect_four.drop(1) }
      
      
      end
=end
