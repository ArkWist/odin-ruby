# spec/connect_four_spec.rb
require "connect_four"

describe "ConnectFour" do
  let(:c4) { ConnectFour.new }
  let(:p1) { ConnectFour::PLAYERS.first }
  let(:p2) { ConnectFour::PLAYERS.last}
  
  describe ".new" do
    it "creates a new game board" do
      expect(c4.board).to be_instance_of(Board)
    end
    it "sets player to #{ConnectFour::PLAYERS.first}" do
      expect(c4.player).to eq(p1)
    end
  end

  describe ".next_player" do
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
  
  describe ".move" do
    it "places player's disc" do
      c4.move(1)
      expect(c4.board.column[1][0]).to eq(p1)
    end
    it "alternately places discs by player" do
      c4.move(1)
      expect(c4.board.column[1][0]).to eq(p1)
      c4.move(1)
      expect(c4.board.column[1][1]).to eq(p2)
    end
    context "columns is full" do
      it "rejects the move" do
        8.times { c4.move(1) }
        expect(c4.board.column[1].length).to eq(7)
        expect(c4.player).to eq(p1)
      end
    end
    context "column does not exist" do
      it "rejects the move" do
        c4.move(c4.length + 1)
        expect(c4.[length + 1][0]). to eq(nil)
        expect(player).to eq(p1)
      end
    end
  end

  describe ".game_set?" do
    # horizonatal win
    # vertical win
    # diagonal win
    # no win
    # draw
  end

  describe ".game_set" do
  end
  
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
