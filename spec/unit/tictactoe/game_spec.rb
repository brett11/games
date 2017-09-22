require_relative '../../../lib/games/tictactoe/game'
require_relative '../../shared_examples/shared/game'
require_relative '../../shared_examples/tictactoe/game'

RSpec.describe TTT::Game do
  let(:io) { double("Games::Shared::io_terminal").as_null_object }
  let(:board_presenter) { instance_double("TTT::io_terminal") }

  let(:game) { TTT::Game.new(game_module: TTT, io: io, board_presenter: board_presenter) }
  subject { TTT::Game.new(game_module: TTT, io: io, board_presenter: board_presenter) }

  describe "when initialized" do
    #first test below maskes sure that this subclass does not violate Liskov substitution principle
    it_behaves_like "game interface"
    it_behaves_like "game subclass"
    it_behaves_like "move_generator-able"
    it_behaves_like "game_state_changer-able"
    it_behaves_like "game_resetter-able"
    it_behaves_like "minimax-able"
  end
end