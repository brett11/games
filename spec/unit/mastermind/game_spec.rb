require_relative '../../../lib/games/mastermind/game'
require_relative '../../shared_examples/shared/game'
require_relative '../../shared_examples/tictactoe/game'

RSpec.describe MM::Game do
  # let(:io) { double("Shared::IOTerminal").as_null_object }
  # let(:board_presenter) { instance_double("MM::BoardPresenter") }

  let(:io) { double("Shared::IOTerminal").as_null_object }
  let(:io_helpers) { instance_double("MM::IOHelpers") }
  let(:board_presenter) { double("MM::BoardPresenterTerminal").as_null_object }
  let(:board_builder) { MM::BoardBuilder.new }
  let(:players_factory) { MM::PlayersFactory.new(io_helpers) }

  let(:game) { MM::Game.new(game_module: MM,
                            io: io,
                            io_helpers: io_helpers,
                            board_presenter: board_presenter,
                            board_builder: board_builder,
                            players_factory: players_factory,
                            )}
  subject { MM::Game.new(game_module: MM,
                         io: io,
                         io_helpers: io_helpers,
                         board_presenter: board_presenter,
                         board_builder: board_builder,
                         players_factory: players_factory,
                        )}

end