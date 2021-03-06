require 'games/tictactoe/board_presenter_terminal'
require 'games/tictactoe/game'
require 'shared_examples/shared/board_presenter'

RSpec.describe TTT::BoardPresenterTerminal do
  it_behaves_like "PresentBoard-able"

  let(:squares) { TTT::SquaresFactory.build_empty_squares(3) }
  let(:board) { TTT::Board.new(squares: squares) }
  let(:terminal_board_presenter) { TTT::BoardPresenterTerminal.new }


  it "prints board correctly" do
    # https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/output-matcher
    expect { terminal_board_presenter.present_board(board)}.to output(" 1 |  2 |  3\n_______________\n 4 |  5 |  6\n_______________\n 7 |  8 |  9\n").to_stdout
  end
end
