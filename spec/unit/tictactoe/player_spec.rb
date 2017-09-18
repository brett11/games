require_relative "../../../lib/games/tictactoe/player"

RSpec.describe TTT::Player do
  context "initialized with no value" do
    let(:player) { TTT::Player.new}

    it "is X by default" do
      expect(player.value).to eq("X")
    end
  end


  context "initialized with no name" do
    let(:player) { TTT::Player.new}

    it "is X by default" do
      expect(player.name).to eq("Player 1")
    end
  end

end