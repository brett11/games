require_relative '../../../lib/games/mastermind/players_factory'
require_relative '../../../lib/games/mastermind/game_config'

RSpec.describe MM::PlayersFactory do
  describe "factory" do
    let(:players_factory) { MM::PlayersFactory.new }
    let(:config) { instance_double(MM::GameConfig) }

    before do
      expect(config).to receive(:player_1_name).and_return("Brett")
    end

    it "#generates_players returns an array of players with correct values" do
      players = players_factory.generate_players(config)
      player_1 = players[0]
      expect(player_1.name).to eq("Brett")
    end
  end
end


