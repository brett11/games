require 'games/mastermind/board'
require 'shared_examples/mastermind/board'

RSpec.describe MM::Board do
  let(:board) { MM::Board.new(number_of_rows: 12, number_of_cols: 4) }
  subject { board }

  describe "when initialized" do
    it_behaves_like "MMBoardPresenter-able"

    it "holds the number of rows & cols" do
      expect(board.number_of_rows).to eq(12)
      expect(board.number_of_cols).to eq(4)
    end
  end
end