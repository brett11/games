require_relative '../../../lib/games/mastermind/game'
require_relative '../../shared_examples/shared/game'
require_relative '../../shared_examples/tictactoe/game'

RSpec.describe MM::Game do
  # let(:io) { double("Shared::IOTerminal").as_null_object }
  # let(:board_presenter) { instance_double("MM::BoardPresenter") }

  let(:io) { instance_double "Shared::IOTerminal" }
  let(:input_helper) { instance_double "MM::InputHelper" }
  let(:config) { instance_double "MM::GameConfig" }
  let(:board_presenter) { instance_double "MM::BoardPresenterTerminal" }
  let(:board_builder) {instance_double "MM::BoardBuilder" }
  let(:players_factory) { instance_double "MM::PlayersFactory" }

  let(:game) { MM::Game.new(game_module: MM,
                            io: io,
                            input_helper: input_helper,
                            board_presenter: board_presenter,
                            board_builder: board_builder,
                            players_factory: players_factory,
                            config: config
                            )}
  subject { MM::Game.new(game_module: MM,
                         io: io,
                         input_helper: input_helper,
                         board_presenter: board_presenter,
                         board_builder: board_builder,
                         players_factory: players_factory,
                         config: config
                        )}

  describe "when initialized" do
    #first test below maskes sure that this subclass does not violate Liskov substitution principle
    it_behaves_like "game interface"
    it_behaves_like "game subclass"
  end

  describe "game simulation" do

  end
end