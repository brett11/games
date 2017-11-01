require_relative "../../../lib/games/tictactoe/computer_player_expert"
require_relative "../../../lib/games/tictactoe/computer_player_expert"
require_relative '../../shared_examples/shared/player'

RSpec.describe TTT::ComputerPlayerExpert do
  context "initialized" do
    let(:player) { TTT::ComputerPlayerExpert.new }

    it_behaves_like "player subclass"
    it_behaves_like "tictactoe make_move-able"
  end
end