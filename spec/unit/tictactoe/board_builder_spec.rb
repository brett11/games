require_relative '../../../lib/games/tictactoe/board_builder'
require_relative '../../../spec/shared_examples/shared/board_builder'

RSpec.describe TTT::BoardBuilder do
  let(:board_builder) { TTT::BoardBuilder.new }

  it_behaves_like "SharedBoardBuilder Game-able"

  it "builds board" do
    # https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/output-matcher
    board = board_builder.generate_empty_board(3)
    expect(board).to be_a_kind_of(TTT::Board)
    expect(board.number_of_rows_cols).to eq(3)
  end
end