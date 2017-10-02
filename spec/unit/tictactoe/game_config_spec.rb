require_relative '../../../lib/games/tictactoe/game_config'
require_relative '../../shared_examples/tictactoe/game_config'

RSpec.describe TTT::GameConfig do
  let(:input_helper) { instance_double("TTT::InputHelper") }
  let(:config) { TTT::GameConfig.new(input_helper) }
  subject { TTT::GameConfig.new(input_helper)  }

  describe "when initialized" do
    it_behaves_like "tictactoe players_factory-able"
    it_behaves_like "board-builder-able"
  end

  describe "player 1 set" do
    before do
      expect(input_helper).to receive(:get_player_1_name).and_return("Brett")
      expect(input_helper).to receive(:get_player_1_value).and_return("X")
    end

    context "opponent a difficult computer" do
      before do
        expect(input_helper).to receive(:get_player_2_type).and_return(:computer)
        expect(input_helper).to receive(:get_computer_difficulty_level).and_return(:difficult)
        expect(input_helper).to receive(:get_number_of_rows_cols_max_3).and_return(3)
      end

      it "sets proper config values for player 2 when difficult computer" do
        config.one_time_setup
        config.every_time_setup
        expect(config.player_1_name).to eq("Brett")
        expect(config.player_1_value).to eq("X")
        expect(config.player_2_name).to eq("Computer")
        expect(config.player_2_value).to eq("O")
        expect(config.computer_difficulty_level).to eq(:difficult)
        expect(config.number_of_rows_cols).to eq(3)
      end
    end

    context "opponent an easy computer" do
      before do
        expect(input_helper).to receive(:get_player_2_type).and_return(:computer)
        expect(input_helper).to receive(:get_computer_difficulty_level).and_return(:easy)
        expect(input_helper).to receive(:get_number_of_rows_cols_max_9).and_return(9)
      end

      it "sets proper config values for player 2 when easy computer" do
        config.one_time_setup
        config.every_time_setup
        expect(config.player_1_name).to eq("Brett")
        expect(config.player_1_value).to eq("X")
        expect(config.player_2_name).to eq("Computer")
        expect(config.player_2_value).to eq("O")
        expect(config.computer_difficulty_level).to eq(:easy)
        expect(config.number_of_rows_cols).to eq(9)
      end
    end

    context "opponent a human" do
      before do
        expect(input_helper).to receive(:get_player_2_type).and_return(:human)
        expect(input_helper).to receive(:get_player_2_name).and_return("Bob")
        expect(input_helper).to receive(:get_player_2_value).with(anything()).and_return("O")
        expect(input_helper).to receive(:get_number_of_rows_cols_max_9).and_return(9)
      end

      it "sets proper config values for player 2 when human" do
        config.one_time_setup
        config.every_time_setup
        expect(config.player_1_name).to eq("Brett")
        expect(config.player_1_value).to eq("X")
        expect(config.player_2_name).to eq("Bob")
        expect(config.player_2_value).to eq("O")
        expect(config.computer_difficulty_level).to be_nil
        expect(config.number_of_rows_cols).to eq(9)
      end
    end
  end
end