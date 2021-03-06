require "games/shared/player"
require "games/tictactoe/player"
require 'shared_examples/shared/player'


RSpec.describe TTT::Player do
  context "initialized" do
    let(:player) { TTT::Player.new }

    it_behaves_like "player subclass"

    specify "value is X by default" do
      expect(player.value).to eq("X")
    end

    specify "name is \"Player 1\" by default" do
      expect(player.name).to eq("Player 1")
    end
  end
end