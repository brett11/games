require_relative '../../../lib/games/mastermind/game'
require_relative '../../shared_examples/shared/game'
require_relative '../../shared_examples/mastermind/game'

RSpec.describe MM::Game do
  # let(:io) { double("Shared::IOTerminal").as_null_object }
  # let(:board_presenter) { instance_double("MM::BoardPresenter") }

  let(:io) { double("Shared::IOTerminal").as_null_object }
  let(:io_helpers) { instance_double("MM::IOHelpers") }
  let(:board_presenter) { double("MM::BoardPresenterTerminal").as_null_object }
  let(:board_builder) { MM::BoardBuilder.new }
  let(:players_factory) { MM::PlayersFactory.new(io_helpers) }

  let(:game) { MM::Game.new(
                            io_helpers: io_helpers,
                            board_presenter: board_presenter,
                            board_builder: board_builder,
                            players_factory: players_factory,
                            )}
  subject { MM::Game.new(
                         io_helpers: io_helpers,
                         board_presenter: board_presenter,
                         board_builder: board_builder,
                         players_factory: players_factory,
                        )}

  describe "when initialized" do
    #first test below maskes sure that this subclass does not violate Liskov substitution principle
    it_behaves_like "game interface"
    it_behaves_like "game subclass"
    it_behaves_like "MMGame ComputerNoviceMakeMove-able"
    it_behaves_like "MMGame ComputerExpertMakeMove-able"
    it_behaves_like "MMGame HumanPlayerMakeMove-able"
  end

  describe "game flow simulation, two humans, first player wins " do
    before do
      #in this game iteration, two humans play eachother, and the first human fills top row, winning the game
      expect(io_helpers).to receive(:initial_instructions)
      expect(io_helpers).to receive(:computer_or_human_guesser_inquiry).and_return(:human)
      expect(io_helpers).to receive(:is_player_1_saved?).and_return(false)
      expect(io_helpers).to receive(:get_player_1_name).and_return("Brett")
      expect(game).to receive(:loop).and_yield
      expect(game).to receive(:set_secret_code).and_return([4,3,5,4])
      expect(io_helpers).to receive(:get_player_choice).and_return([4,3,5,1])
      expect(io_helpers).to receive(:get_player_choice).and_return([4,3,5,2])
      expect(io_helpers).to receive(:get_player_choice).and_return([4,3,5,3])
      expect(io_helpers).to receive(:get_player_choice).and_return([4,3,5,4])
      expect(io_helpers).to receive(:winning_prompt).with("Brett")
      expect(io_helpers).to receive(:new_game_starting_graphic)
    end

    specify do
      game.play
    end
  end
end