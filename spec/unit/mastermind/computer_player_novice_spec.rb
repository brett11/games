require_relative "../../../lib/games/shared/player"
require_relative '../../../lib/games/mastermind/computer_player_novice'
require_relative '../../shared_examples/shared/player'
require_relative '../../shared_examples/mastermind/player'

RSpec.describe MM::ComputerPlayerNovice do
  context "initialized" do
    let(:player) { MM::ComputerPlayerNovice.new }

    it_behaves_like "player subclass"
    it_behaves_like "MMPlayer Game-able"
  end
end