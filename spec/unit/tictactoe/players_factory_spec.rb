require_relative '../../../lib/games/tictactoe/players_factory'

RSpec.describe TTT::PlayersFactory do
  describe "factory" do
    let(:io_helpers) { instance_double "TTT::IOHelpers" }
    let(:players_factory) { TTT::PlayersFactory.new(io_helpers) }


    describe "#find_appropriate_player_1_factory" do
      before do
        expect(io_helpers).to receive(:is_player_1_saved?).and_return(false)
      end

      it "#generates two human players" do
        player_factory = players_factory.find_appropriate_player_1_factory
        expect(player_factory).to be_kind_of(TTT::PlayerFactoryHumanNew)
      end
    end
  end
end