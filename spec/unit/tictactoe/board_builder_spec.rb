require_relative '../../../lib/games/tictactoe/board_builder'
require_relative '../../../lib/games/tictactoe/board'
require_relative '../../../lib/games/tictactoe/squares_factory'
require_relative '../../../lib/games/tictactoe/squares'

RSpec.describe TTT::BoardBuilder do
  let(:config) { instance_double("TTT::GameConfig") }
  let(:board_builder) { TTT::BoardBuilder.new }
  # let(:squares_factory) { class_double("TTT::SquaresFactory") }
  # let(:squares) { instance_double("TTT::Squares") }


  before do
    expect(config).to receive(:number_of_rows_cols).and_return(3)
    # allow(squares_factory).to receive(:build_empty_squares).with(3).and_return(squares)
  end


  it "builds board" do
    # https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/output-matcher
    board = board_builder.generate_empty_board(config)
    expect(board).to be_a_kind_of(TTT::Board)
    expect(board.number_of_rows_cols).to eq(3)
  end
end