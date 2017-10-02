require_relative '../../../lib/games/mastermind/game'
require_relative '../../shared_examples/shared/game'
require_relative '../../shared_examples/tictactoe/game'

RSpec.describe MM::Game do
  let(:io) { double("Games::Shared::IOTerminal").as_null_object }
  let(:board_presenter) { instance_double("MM::BoardPresenter") }

  let(:game) { MM::Game.new(game_module: MM, io: io, board_presenter: board_presenter) }
  subject { MM::Game.new(game_module: MM, io: io, board_presenter: board_presenter) }

  describe "when initialized" do

    #first test below maskes sure that this subclass does not violate Liskov substitution principle
    it_behaves_like "game interface"
    it_behaves_like "game subclass"
    # it_behaves_like "mastermind move_generator-able"
    # it_behaves_like "mastermind game_state_changer-able"
    # it_behaves_like "mastermind game_resetter-able"
    # it_behaves_like "mastermind minimax-able"
  end
end