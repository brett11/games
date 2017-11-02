require_relative '../../../lib/games/tictactoe/human_player'
require_relative '../../shared_examples/shared/player'

RSpec.describe TTT::HumanPlayer do
  context "initialized" do
    let(:player) { TTT::HumanPlayer.new(name: "Brett", value: "R") }

    it_behaves_like "player subclass"
    it_behaves_like  "TTTPlayer subclass"
    it_behaves_like "TTTPlayer Game-able"

    it "has correct player name and value" do
      expect(player.name).to eq("Brett")
      expect(player.value).to eq("R")
    end
  end
end