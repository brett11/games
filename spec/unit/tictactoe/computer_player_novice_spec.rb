require "games/tictactoe/computer_player_novice"
require 'shared_examples/tictactoe/player'

RSpec.describe TTT::ComputerPlayerNovice do
  context "initialized" do
    let(:player) { TTT::ComputerPlayerNovice.new }

    it_behaves_like "player subclass"
    it_behaves_like  "TTTPlayer subclass"
    it_behaves_like "TTTPlayer Game-able"
  end
end