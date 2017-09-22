require_relative '../../../lib/games/mastermind/game_config'

RSpec.describe MM::GameConfig do
  let(:input_helper) { instance_double("MM::InputHelper") }
  let(:config) { MM::GameConfig.new(input_helper) }

  before do
    expect(input_helper).to receive(:get_player_1_name).and_return("Brett")
  end

  context "computer chooses secret code" do
    before do
      expect(input_helper).to receive(:computer_or_human_code_setter_inquiry).and_return(:computer)
      expect(config).to receive(:set_secret_code).and_return([5,1,9,2])
    end

    it "sets proper config values" do
      config.setup
      expect(config.player_1_name).to eq("Brett")
      expect(config.code_setter).to eq(:computer)
      expect(config.secret_code).to eq([5,1,9,2])
    end
  end

  context "player chooses secret code" do
    before do
      expect(input_helper).to receive(:computer_or_human_code_setter_inquiry).and_return(:human)
      expect(input_helper).to receive(:get_secret_code_from_user).and_return([8,3,5,4])
    end

    it "sets proper config values" do
      config.setup
      expect(config.player_1_name).to eq("Brett")
      expect(config.code_setter).to eq(:human)
      expect(config.secret_code).to eq([8,3,5,4])
    end
  end
end