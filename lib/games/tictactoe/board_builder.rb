require_relative 'squares_factory'

module TTT
  class BoardBuilder
    def generate_empty_board(config)
      number_of_rows_cols = config.number_of_rows_cols
      Board.new(rows_and_cols: number_of_rows_cols, squares: SquaresFactory.build_empty_squares(number_of_rows_cols) )
    end
  end
end