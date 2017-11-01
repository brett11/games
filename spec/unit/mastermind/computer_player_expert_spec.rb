require_relative "../../../lib/games/mastermind/computer_player_expert"
require_relative '../../shared_examples/shared/player'

RSpec.describe MM::ComputerPlayerExpert do
  context "initialized" do
    let(:player) { MM::ComputerPlayerExpert.new }

    it_behaves_like "player subclass"
    it_behaves_like "mastermind make_move-able"
  end
end