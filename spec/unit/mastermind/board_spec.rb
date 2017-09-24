require_relative '../../../lib/games/mastermind/board'
require_relative '../../shared_examples/shared/board'

RSpec.describe MM::Board do
  let(:board) { MM::Board.new(rows_and_cols: 4) }
  subject { MM::Board.new(rows_and_cols: 4) }

  describe "when initialized" do
    it_behaves_like "board presenter-able"

    it "holds the number of rows & cols" do
      expect(board.rows_and_cols).to eq(4)
    end
  end
end