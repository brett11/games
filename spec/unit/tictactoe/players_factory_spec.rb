require_relative '../../../lib/games/tictactoe/players_factory'
require_relative '../../../lib/games/tictactoe/game_config'

RSpec.describe TTT::PlayersFactory do
  describe "factory" do
    let(:players_factory) { TTT::PlayersFactory.new }
    let(:config) { instance_double(TTT::GameConfig) }

    describe "two human players" do
      before do
        expect(config).to receive(:player_1_name).and_return("Brett")
        expect(config).to receive(:player_1_value).and_return("X")
        expect(config).to receive(:player_2_type).and_return(:human)
        expect(config).to receive(:player_2_name).and_return("Bob")
        expect(config).to receive(:player_2_value).and_return("O")
      end

      it "#generates_players returns an array of players with correct values" do
        players = players_factory.generate_players(config)
        player_1 = players[0]
        player_2 = players[1]
        expect(players).to respond_to(:each)
        expect(player_1.name).to eq("Brett")
        expect(player_1.value).to eq("X")
        expect(player_1).to be_kind_of(TTT::HumanPlayer)
        expect(player_2.name).to eq("Bob")
        expect(player_2.value).to eq("O")
        expect(player_2).to be_kind_of(TTT::HumanPlayer)
      end
    end

    describe "one expert computer player" do
      before do
        expect(config).to receive(:player_1_name).and_return("Brett")
        expect(config).to receive(:player_1_value).and_return("X")
        expect(config).to receive(:player_2_type).and_return(:computer)
        expect(config).to receive(:player_2_name).and_return("Computer")
        expect(config).to receive(:player_2_value).and_return("O")
        expect(config).to receive(:computer_knowledge_level).and_return(:expert)
      end

      it "#generates_players returns an array of players with correct values" do
        players = players_factory.generate_players(config)
        player_1 = players[0]
        player_2 = players[1]
        expect(players).to respond_to(:each)
        expect(player_1.name).to eq("Brett")
        expect(player_1.value).to eq("X")
        expect(player_1).to be_kind_of(TTT::HumanPlayer)
        expect(player_2.name).to eq("Computer")
        expect(player_2.value).to eq("O")
        expect(player_2).to be_kind_of(TTT::ComputerPlayerExpert)
      end
    end
  end
end