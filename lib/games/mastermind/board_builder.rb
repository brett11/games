require_relative 'pegs_factory'

module MM
  class BoardBuilder
    def generate_empty_board
      Board.new(rows_and_cols: number_of_rows_cols, squares: SquaresFactory.build_empty_squares(number_of_rows_cols) )
    end
  end
end
