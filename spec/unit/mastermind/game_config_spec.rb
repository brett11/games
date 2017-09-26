require_relative '../../../lib/games/mastermind/game_config'
require_relative '../../../lib/games/mastermind/input_helper'
require_relative '../../shared_examples/mastermind/game_config'

RSpec.describe MM::GameConfig do
  let(:input_helper) { instance_double("MM::InputHelper") }
  let(:config) { MM::GameConfig.new(input_helper) }

  subject { MM::GameConfig.new(input_helper) }

  describe "when initialized" do
    it_behaves_like "mastermind players_factory-able"
    it_behaves_like "mastermind board builder-able"
  end

  describe "user input"  do
    before do
      expect(input_helper).to receive(:get_player_1_name).and_return("Brett")
      expect(input_helper).to receive(:get_number_of_rows).and_return(12)
      expect(input_helper).to receive(:get_number_of_cols).and_return(4)
    end

    context "indicates computer chooses secret code" do
      before do
        expect(input_helper).to receive(:computer_or_human_code_setter_inquiry).and_return(:computer)
        expect(config).to receive(:set_secret_code).and_return([5,1,6,2])
      end

      it "proper config values set" do
        config.setup
        expect(config.player_1_name).to eq("Brett")
        expect(config.number_of_rows).to eq(12)
        expect(config.number_of_cols).to eq(4)
        expect(config.code_setter).to eq(:computer)
        expect(config.secret_code).to eq([5,1,6,2])
      end
    end

    context "indicates player chooses secret code" do
      before do
        expect(input_helper).to receive(:computer_or_human_code_setter_inquiry).and_return(:human)
        expect(input_helper).to receive(:get_secret_code_from_user).and_return([6,3,5,4])
      end

      it "proper config values set" do
        config.setup
        expect(config.player_1_name).to eq("Brett")
        expect(config.number_of_rows).to eq(12)
        expect(config.number_of_cols).to eq(4)
        expect(config.code_setter).to eq(:human)
        expect(config.secret_code).to eq([6,3,5,4])
      end
    end
  end
end