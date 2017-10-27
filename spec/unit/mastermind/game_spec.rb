require_relative '../../../lib/games/mastermind/game'
require_relative '../../shared_examples/shared/game'
require_relative '../../shared_examples/tictactoe/game'

RSpec.describe MM::Game do
  # let(:io) { double("Shared::IOTerminal").as_null_object }
  # let(:board_presenter) { instance_double("MM::BoardPresenter") }

  let(:io) { double("Shared::IOTerminal").as_null_object }
  let(:input_helper) { instance_double("MM::InputHelper") }
  let(:config) { instance_double "MM::GameConfig" }
  let(:board_presenter) { double("MM::BoardPresenterTerminal").as_null_object }
  let(:board_builder) { MM::BoardBuilder.new }
  let(:players_factory) { MM::PlayersFactory.new }

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
    before do
      expect(input_helper).to receive(:initial_instructions)
      expect(config).to receive(:one_time_setup)
      expect(config).to receive(:every_time_setup)


      expect(config).to receive(:player_1_name).and_return("Brett")
      expect(config).to receive(:number_of_rows).and_return(12)
      expect(config).to receive(:number_of_cols).and_return(4)
      expect(config).to receive(:code_guesser).and_return(:computer)
      expect(config).to receive(:secret_code).and_return([5,1,6,2])

      expect(input_helper).to receive(:get_player_choice).and_return([5,1,6,2])
      expect(input_helper).to receive(:winning_prompt).with("Brett")
      expect(input_helper).to receive(:new_game_starting_graphic)
    end

    it "plays the game" do
      pending "need to figure out how to deal with game loop"
      game.play
    end
  end
end