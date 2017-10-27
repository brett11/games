require_relative '../../../lib/games/tictactoe/board'
require_relative '../../support/test_config'
require_relative '../../shared_examples/tictactoe/board'

RSpec.describe TTT::Board do
  subject { TTT::Board.new }

  describe "when initialized" do
    it_behaves_like "board presenter-able"
  end
end