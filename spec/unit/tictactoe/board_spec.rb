require 'games/tictactoe/board'
require 'shared_examples/tictactoe/board'

RSpec.describe TTT::Board do
  subject { TTT::Board.new }

  describe "when initialized" do
    it_behaves_like "TTTBoardPresenter-able"
    it_behaves_like "TTTBoardMinimax-able"
  end
end