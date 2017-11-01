require_relative '../../../lib/games/mastermind/board_builder'

RSpec.describe MM::Board do
  let(:board_builder) { MM::BoardBuilder.new }
  let(:board) { board_builder.generate_empty_board }

  it "holds the number of rows & cols" do
    expect(board.number_of_rows).to eq(12)
    expect(board.number_of_cols).to eq(4)
  end
end
