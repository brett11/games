require 'games/mastermind/board_builder'
require 'shared_examples/shared/board_builder'

RSpec.describe MM::BoardBuilder do
  let(:board_builder) { MM::BoardBuilder.new }
  let(:board) { board_builder.generate_empty_board }

  it_behaves_like "SharedBoardBuilder Game-able"

  it "holds the number of rows & cols" do
    expect(board.number_of_rows).to eq(12)
    expect(board.number_of_cols).to eq(4)
  end
end
