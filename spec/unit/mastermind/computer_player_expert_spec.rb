require "games/mastermind/computer_player_expert"
require 'shared_examples/shared/player'
require 'shared_examples/mastermind/player'

RSpec.describe MM::ComputerPlayerExpert do
  context "initialized" do
    let(:player) { MM::ComputerPlayerExpert.new }

    it_behaves_like "player subclass"
    it_behaves_like "MMPlayer Game-able"
  end
end