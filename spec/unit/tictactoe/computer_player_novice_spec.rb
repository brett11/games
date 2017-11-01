require_relative "../../../lib/games/tictactoe/computer_player_novice"
require_relative '../../shared_examples/shared/player'

RSpec.describe TTT::ComputerPlayerNovice do
  context "initialized" do
    let(:player) { TTT::ComputerPlayerNovice.new }

    it_behaves_like "player subclass"
    it_behaves_like "tictactoe make_move-able"
  end
end