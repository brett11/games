require_relative '../../../lib/games/mastermind/game_config'
require_relative '../../../lib/games/mastermind/io_helpers'
require_relative '../../shared_examples/mastermind/game_config'
require_relative '../../shared_examples/shared/game_config'

RSpec.describe MM::GameConfig do
  let(:io_helpers) { instance_double("MM::IOHelpers") }
  let(:config) { MM::GameConfig.new(io_helpers) }

  subject { MM::GameConfig.new(io_helpers) }

  describe "when initialized" do
    it_behaves_like "mastermind players_factory-able"
    it_behaves_like "mastermind board builder-able"
    it_behaves_like "setup-able"
    it_behaves_like "game local_setup-able"
  end

  describe "user input"  do
    before do
      # expect(io_helpers).to receive(:get_number_of_rows).and_return(12)
      # expect(io_helpers).to receive(:get_number_of_cols).and_return(4)
    end

    context "human player" do
      before do
        expect(io_helpers).to receive(:computer_or_human_guesser_inquiry).and_return(:human)
        expect(io_helpers).to receive(:get_player_1_name).and_return("Brett")
        expect(config).to receive(:set_secret_code).and_return([5,1,6,2])
      end

      it "proper config values set" do
        config.one_time_setup
        config.every_time_setup
        expect(config.player_1_name).to eq("Brett")
        expect(config.number_of_rows).to eq(12)
        expect(config.number_of_cols).to eq(4)
        expect(config.code_guesser).to eq(:human)
        expect(config.secret_code).to eq([5,1,6,2])
      end
    end

    context "indicates player chooses secret code" do
      before do
        expect(io_helpers).to receive(:computer_or_human_guesser_inquiry).and_return(:computer)
        expect(io_helpers).to receive(:get_secret_code_from_user).and_return([6,3,5,4])
        expect(io_helpers).to receive(:get_computer_knowledge_level).and_return(:expert)
      end

      it "proper config values set" do
        config.one_time_setup
        config.every_time_setup
        expect(config.player_1_name).to eq("Computer")
        expect(config.number_of_rows).to eq(12)
        expect(config.number_of_cols).to eq(4)
        expect(config.code_guesser).to eq(:computer)
        expect(config.computer_knowledge_level).to eq(:expert)
        expect(config.secret_code).to eq([6,3,5,4])
      end
    end
  end
end