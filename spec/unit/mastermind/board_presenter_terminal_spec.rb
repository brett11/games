require 'games/mastermind/board_presenter_terminal'
require 'games/mastermind/pegs_factory'
require 'shared_examples/shared/board_presenter'

RSpec.describe MM::BoardPresenterTerminal do
  it_behaves_like "PresentBoard-able"

  let(:pegs) { MM::PegsFactory.build_empty_pegs(4) }
  let(:board) { MM::Board.new(number_of_rows: 4, number_of_cols: 4, pegs: pegs) }
  let(:terminal_board_presenter) { MM::BoardPresenterTerminal.new }

  it "prints board correctly", :pending do
    # https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/output-matcher
      expect { terminal_board_presenter.present_board(board)}.to output("   |    |    |   \n____________________\n   |    |    |   \n____________________\n   |    |    |   \n____________________\n   |    |    |   \n").to_stdout
  end
end
