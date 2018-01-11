require File.join('games', 'tictactoe', 'squares')
require File.join('games', 'tictactoe', 'square')

module TTT
  class SquaresFactory
    def self.build_custom_squares(config, squares_class = Squares)

      rows_and_cols = config.length

      #create multi-dimensional array
      squares = Array.new(rows_and_cols) do
        Array.new(rows_and_cols)
      end

      squares.each_with_index do |element, row|
        element.each_index do |col|
          squares[row][col] = create_custom_square(config[row][col][0],config[row][col][1])
        end
      end

      squares_class.new(collection_of_squares: squares)

    end


    def self.create_custom_square(display_value, value, square_class = Square)
      square_class.new(display_value: display_value,
                       value: value)
    end

    def self.build_empty_squares(rows_and_cols, squares_class = Squares)
      squares = Array.new(rows_and_cols) do
        Array.new(rows_and_cols)
      end

      i = 1
      squares.each_with_index do |element, row|
        element.each_index do |col|
          squares[row][col] = create_empty_square(i)
          i += 1
        end
      end

      squares_class.new(collection_of_squares: squares)
    end

    def self.create_empty_square(display_value, square_class = Square)
      square_class.new(display_value: display_value,
                       value: nil)
    end
  end
end