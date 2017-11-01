require_relative '../../../lib/games/mastermind/human_player'
require_relative '../../shared_examples/shared/player'

RSpec.describe MM::HumanPlayer do
  context "initialized" do
    let(:player) { MM::HumanPlayer.new(name: "Brett") }

    it_behaves_like "player subclass"
    it_behaves_like "mastermind make_move-able"

    it "has correct player name and value" do
      expect(player.name).to eq("Brett")
    end
  end
end