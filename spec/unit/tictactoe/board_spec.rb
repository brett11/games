require_relative '../../../lib/games/tictactoe/board'
require_relative '../../support/test_config'

RSpec.describe TTT::Board do
  let(:board) { TTT::Board.new(rows_and_cols: 3)}

  it "holds the number of rows & cols" do
    expect(board.rows_and_cols).to eq(3)
  end
end