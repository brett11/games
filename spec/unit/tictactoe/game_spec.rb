require_relative '../../../lib/games/tictactoe/game'
require_relative '../../shared_examples/shared/game'
require_relative '../../shared_examples/tictactoe/game'

RSpec.describe TTT::Game do
  let(:io) { instance_double "Shared::IOTerminal" }
  let(:io_helpers) { instance_double "TTT::IOHelpers" }
  let(:config) { instance_double "TTT::GameConfig" }
  let(:board_presenter) { instance_double "TTT::BoardPresenterTerminal" }
  let(:board_builder) {instance_double "TTT::BoardBuilder" }
  let(:players_factory) { instance_double "TTT::PlayersFactory" }

  let(:game) { TTT::Game.new(game_module: TTT,
                            io: io,
                            io_helpers: io_helpers,
                            board_presenter: board_presenter,
                            board_builder: board_builder,
                            players_factory: players_factory,
                            config: config
  )}
  subject { TTT::Game.new(game_module: TTT,
                         io: io,
                         io_helpers: io_helpers,
                         board_presenter: board_presenter,
                         board_builder: board_builder,
                         players_factory: players_factory,
                         config: config
  )}

  describe "when initialized" do
    #first test below maskes sure that this subclass does not violate Liskov substitution principle
    it_behaves_like "game interface"
    it_behaves_like "game subclass"
    it_behaves_like "tictactoe move_generator-able"
    it_behaves_like "tictactoe game_state_changer-able"
    it_behaves_like "tictactoe game_resetter-able"
  end
end