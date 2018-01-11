require File.join('games', 'tictactoe', 'board')
require File.join('games', 'tictactoe', 'squares_factory')

module TTT
  class BoardBuilder
    def generate_empty_board(number_of_rows_cols)
      Board.new(squares: SquaresFactory.build_empty_squares(number_of_rows_cols) )
    end
  end
end
