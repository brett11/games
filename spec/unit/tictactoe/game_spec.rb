require_relative '../../../lib/games/tictactoe/game'
require_relative '../../shared_examples/shared/game'
require_relative '../../shared_examples/tictactoe/game'

RSpec.describe TTT::Game do
  let(:io) { double("Games::Shared::IOTerminal").as_null_object }
  let(:board_presenter) { instance_double("TTT::BoardPresenter") }

  let(:game) { TTT::Game.new(game_module: TTT, io: io, board_presenter: board_presenter) }
  subject { TTT::Game.new(game_module: TTT, io: io, board_presenter: board_presenter) }

  describe "when initialized" do
    #first test below maskes sure that this subclass does not violate Liskov substitution principle
    it_behaves_like "game interface"
    it_behaves_like "game subclass"
    it_behaves_like "tictactoe move_generator-able"
    it_behaves_like "tictactoe game_state_changer-able"
    it_behaves_like "tictactoe game_resetter-able"
    it_behaves_like "tictactoe minimax-able"
  end
end