require_relative '../../shared_examples/shared/game_config'

RSpec.describe TTT::GameConfig do
  let(:io_helpers) { instance_double("TTT::IOHelpers") }
  let(:config) { TTT::GameConfig.new(io_helpers) }
  subject { TTT::GameConfig.new(io_helpers)  }

  describe "when initialized" do
    it_behaves_like "tictactoe players_factory-able"
    it_behaves_like "board-builder-able"
    it_behaves_like "setup-able"
  end

  describe "player 1 set" do
    before do
      expect(io_helpers).to receive(:get_player_1_name).and_return("Brett")
      expect(io_helpers).to receive(:get_player_1_value).and_return("X")
    end

    context "opponent a difficult computer" do
      before do
        expect(io_helpers).to receive(:get_player_2_type).and_return(:computer)
        expect(io_helpers).to receive(:get_computer_knowledge_level).and_return(:expert)
        expect(io_helpers).to receive(:get_number_of_rows_cols_max_3).and_return(3)
      end

      it "sets proper config values for player 2 when difficult computer" do
        config.one_time_setup
        config.every_time_setup
        expect(config.player_1_name).to eq("Brett")
        expect(config.player_1_value).to eq("X")
        expect(config.player_2_name).to eq("Computer")
        expect(config.player_2_value).to eq("O")
        expect(config.computer_knowledge_level).to eq(:expert)
        expect(config.number_of_rows_cols).to eq(3)
      end
    end

    context "opponent an easy computer" do
      before do
        expect(io_helpers).to receive(:get_player_2_type).and_return(:computer)
        expect(io_helpers).to receive(:get_computer_knowledge_level).and_return(:novice)
        expect(io_helpers).to receive(:get_number_of_rows_cols_max_9).and_return(9)
      end

      it "sets proper config values for player 2 when easy computer" do
        config.one_time_setup
        config.every_time_setup
        expect(config.player_1_name).to eq("Brett")
        expect(config.player_1_value).to eq("X")
        expect(config.player_2_name).to eq("Computer")
        expect(config.player_2_value).to eq("O")
        expect(config.computer_knowledge_level).to eq(:novice)
        expect(config.number_of_rows_cols).to eq(9)
      end
    end

    context "opponent a human" do
      before do
        expect(io_helpers).to receive(:get_player_2_type).and_return(:human)
        expect(io_helpers).to receive(:get_player_2_name).and_return("Bob")
        expect(io_helpers).to receive(:get_player_2_value).with(anything()).and_return("O")
        expect(io_helpers).to receive(:get_number_of_rows_cols_max_9).and_return(9)
      end

      it "sets proper config values for player 2 when human" do
        config.one_time_setup
        config.every_time_setup
        expect(config.player_1_name).to eq("Brett")
        expect(config.player_1_value).to eq("X")
        expect(config.player_2_name).to eq("Bob")
        expect(config.player_2_value).to eq("O")
        expect(config.computer_knowledge_level).to be_nil
        expect(config.number_of_rows_cols).to eq(9)
      end
    end
  end
end