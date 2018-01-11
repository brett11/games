require "games/tictactoe/computer_player_expert"
require 'shared_examples/tictactoe/player'

RSpec.describe TTT::ComputerPlayerExpert do
  context "initialized" do
    let(:player) { TTT::ComputerPlayerExpert.new }

    it_behaves_like "player subclass"
    it_behaves_like  "TTTPlayer subclass"
    it_behaves_like "TTTPlayer Game-able"

  end
end