require_relative '../../../lib/games/tictactoe/board'
require_relative '../../support/test_config'
require_relative '../../shared_examples/tictactoe/board'

RSpec.describe TTT::Board do
  let(:board) { TTT::Board.new(rows_and_cols: 3) }
  subject { TTT::Board.new(rows_and_cols: 3) }

  describe "when initialized" do
    it_behaves_like "board presenter-able"

    it "holds the number of rows & cols" do
      expect(board.rows_and_cols).to eq(3)
    end
  end
end