module TTT
  class Board
    attr_accessor :squares

    def initialize(args = {})
      @squares = args[:squares]
    end

    def change_square(display_value, new_value)
      square_to_change = retrieve_square(display_value)
      square_to_change.change_value(new_value)
    end

    def full?
      squares.full?
    end

    def won?
      squares.any_combination_won?
    end

    def display_values
      squares.display_values
    end

    def available_choices
      squares.available_choices
    end

    def number_of_rows_cols
      squares.number_of_rows_cols
    end

    private
    def retrieve_square(display_value)
      squares.retrieve_square(display_value)
    end
  end
end
