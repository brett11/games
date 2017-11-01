require_relative '../../../lib/games/tictactoe/game'
require_relative '../../shared_examples/shared/game'
require_relative '../../shared_examples/tictactoe/game'

RSpec.describe TTT::Game do
  let(:io) { double("Shared::IOTerminal").as_null_object }
  let(:io_helpers) { instance_double "TTT::IOHelpers" }
  let(:board_presenter) { double("TTT::BoardPresenterTerminal").as_null_object }
  let(:board_builder) {TTT::BoardBuilder.new }
  let(:players_factory) { TTT::PlayersFactory.new(io_helpers) }

  let(:game) { TTT::Game.new(game_module: TTT,
                             io: io,
                             io_helpers: io_helpers,
                             board_presenter: board_presenter,
                             board_builder: board_builder,
                             players_factory: players_factory,
  )}
  subject { TTT::Game.new(game_module: TTT,
                          io: io,
                          io_helpers: io_helpers,
                          board_presenter: board_presenter,
                          board_builder: board_builder,
                          players_factory: players_factory,
  )}

  describe "when initialized" do
    #first test below maskes sure that this subclass does not violate Liskov substitution principle
    it_behaves_like "game interface"
    it_behaves_like "game subclass"
    it_behaves_like "tictactoe move_generator-able"
    it_behaves_like "tictactoe game_state_changer-able"
    it_behaves_like "tictactoe game_resetter-able"
  end

  describe "game flow simulation, two humans, first player wins " do
    before do
      #in this game iteration, two humans play eachother, and the first human fills top row, winning the game
      expect(io_helpers).to receive(:initial_instructions)
      expect(io_helpers).to receive(:is_player_1_saved?).and_return(false)
      expect(io_helpers).to receive(:get_player_1_name).and_return("Brett")
      expect(io_helpers).to receive(:get_player_value).and_return("R")
      expect(io_helpers).to receive(:get_player_2_type).and_return(:human)
      expect(io_helpers).to receive(:is_player_2_saved?).and_return(false)
      expect(io_helpers).to receive(:get_opponent_name).and_return("Bob")
      expect(io_helpers).to receive(:get_player_value).and_return("D")
      expect(io_helpers).to receive(:get_number_of_rows_cols_max_9).and_return(3)
      expect(game).to receive(:loop).and_yield
      expect(io_helpers).to receive(:get_player_choice).and_return(1)
      expect(io_helpers).to receive(:get_player_choice).and_return(4)
      expect(io_helpers).to receive(:get_player_choice).and_return(2)
      expect(io_helpers).to receive(:get_player_choice).and_return(5)
      expect(io_helpers).to receive(:get_player_choice).and_return(3)
      expect(io_helpers).to receive(:winning_prompt).with("Brett")
      expect(io_helpers).to receive(:new_game_starting_graphic)
    end

    specify do
      game.play
    end
  end


  describe "game flow simulation, two humans, first player wins " do
    before do
      #in this game iteration, two humans play eachother, and the first human fills second row, winning the game
      expect(io_helpers).to receive(:initial_instructions)
      expect(io_helpers).to receive(:is_player_1_saved?).and_return(false)
      expect(io_helpers).to receive(:get_player_1_name).and_return("Brett")
      expect(io_helpers).to receive(:get_player_value).and_return("R")
      expect(io_helpers).to receive(:get_player_2_type).and_return(:human)
      expect(io_helpers).to receive(:is_player_2_saved?).and_return(false)
      expect(io_helpers).to receive(:get_opponent_name).and_return("Bob")
      expect(io_helpers).to receive(:get_player_value).and_return("D")
      expect(io_helpers).to receive(:get_number_of_rows_cols_max_9).and_return(3)
      expect(game).to receive(:loop).and_yield
      expect(io_helpers).to receive(:get_player_choice).and_return(1)
      expect(io_helpers).to receive(:get_player_choice).and_return(4)
      expect(io_helpers).to receive(:get_player_choice).and_return(2)
      expect(io_helpers).to receive(:get_player_choice).and_return(5)
      expect(io_helpers).to receive(:get_player_choice).and_return(7)
      expect(io_helpers).to receive(:get_player_choice).and_return(6)
      expect(io_helpers).to receive(:winning_prompt).with("Bob")
      expect(io_helpers).to receive(:new_game_starting_graphic)
    end

    specify do
      game.play
    end
  end

  describe "game flow simulation, playing against minimax" do
    before do
      #in this game iteration, two humans play eachother, and the first human fills second row, winning the game
      expect(io_helpers).to receive(:initial_instructions)
      expect(io_helpers).to receive(:is_player_1_saved?).and_return(false)
      expect(io_helpers).to receive(:get_player_1_name).and_return("Brett")
      expect(io_helpers).to receive(:get_player_value).and_return("R")
      expect(io_helpers).to receive(:get_player_2_type).and_return(:computer)
      expect(io_helpers).to receive(:get_computer_knowledge_level).and_return(:expert)
      expect(io_helpers).to receive(:get_number_of_rows_cols_max_3).and_return(3)
      expect(game).to receive(:loop).and_yield
      expect(io_helpers).to receive(:get_player_choice).and_return(1)
      expect(io_helpers).to receive(:computer_choosing_graphic)
      #minimax will always choose 5 if a corner is picked
      expect(io_helpers).to receive(:get_player_choice).and_return(3)
      expect(io_helpers).to receive(:computer_choosing_graphic)
      #minimax will always choose 2 here to prevent human player from winning
      expect(io_helpers).to receive(:get_player_choice).and_return(7)
      expect(io_helpers).to receive(:computer_choosing_graphic)
      #minimax will always choose 6 here in order to win
      expect(io_helpers).to receive(:winning_prompt).with("Computer")
      expect(io_helpers).to receive(:new_game_starting_graphic)
    end

    specify do
      game.play
    end
  end
end