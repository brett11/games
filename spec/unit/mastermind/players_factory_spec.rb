require_relative '../../../lib/games/mastermind/players_factory'
require_relative '../../../lib/games/mastermind/game_config'

RSpec.describe MM::PlayersFactory do
  describe "factory" do
    let(:players_factory) { MM::PlayersFactory.new }
    let(:config) { instance_double(MM::GameConfig) }


    describe "player is human" do
      before do
        expect(config).to receive(:code_guesser).and_return(:human)
        expect(config).to receive(:player_1_name).and_return("Brett")
      end

      it "#generates_players returns an array of players with correct values" do
        players = players_factory.generate_players(config)
        player_1 = players[0]
        expect(player_1.name).to eq("Brett")
        expect(player_1).to be_kind_of(MM::HumanPlayer)
      end
    end

    describe "player is computer novice" do
      before do
        expect(config).to receive(:code_guesser).and_return(:computer)
        expect(config).to receive(:player_1_name).and_return("Computer")
        expect(config).to receive(:computer_knowledge_level).and_return(:novice)
      end

        it "#generates_players returns an array of players with correct values" do
          players = players_factory.generate_players(config)
          player_1 = players[0]
          expect(player_1.name).to eq("Computer")
          expect(player_1).to be_kind_of(MM::ComputerPlayerNovice)
        end
      end

      describe "player is computer expert" do
        before do
          expect(config).to receive(:code_guesser).and_return(:computer)
          expect(config).to receive(:player_1_name).and_return("Computer")
          expect(config).to receive(:computer_knowledge_level).and_return(:expert).at_least(:once)
        end

        it "#generates_players returns an array of players with correct values" do
          players = players_factory.generate_players(config)
          player_1 = players[0]
          expect(player_1.name).to eq("Computer")
          expect(player_1).to be_kind_of(MM::ComputerPlayerExpert)
        end
    end
  end
end


