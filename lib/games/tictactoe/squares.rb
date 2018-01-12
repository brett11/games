module TTT
  class Squares
    attr_reader :collection_of_squares

    #collection_of_squares is a multi-dimensional array

    def initialize(args)
      @collection_of_squares = args[:collection_of_squares]
    end

    def retrieve_square(display_value)
      row = (display_value - 1) / number_of_rows_cols
      col = (display_value - 1) % number_of_rows_cols
      if row >= number_of_rows_cols || col >= number_of_rows_cols
        nil
      else
        collection_of_squares[row][col]
      end
    end

    def display_values
      collection_of_squares.map do |row|
        row.map do |square|
          square.display_value
        end
      end
    end

    def available_choices
      available_choices = Array.new
      collection_of_squares.each do |row|
        row.each do |square|
          if square.empty?
            available_choices.push(square.display_value)
          end
        end
      end
      available_choices
    end

    def full?
      collection_of_squares.each do |row|
        return false if !(row.all? { |square| square.full? })
      end
      true
    end

    def any_combination_won?
      possible_winning_combinations.any? do |possible_winning_combination|
        won?(possible_winning_combination)
      end
    end

    def won?(array)
      #https://stackoverflow.com/questions/3233278/how-do-i-test-if-all-items-in-an-array-are-identical
      return false if array[0].value == nil
      array.all? {|square| square.value == array[0].value}
    end

    def number_of_rows_cols
      collection_of_squares.length
    end

    private
    def cols
      number_of_rows_cols = collection_of_squares.size
      cols = Array.new
      col = 0
      while col < number_of_rows_cols
        cols.push (
                    collection_of_squares.map do |row|
                      row[col]
                    end
                  )
        col += 1
      end
      cols
    end

    #return collection_of_squares because set up as multidimensional array consisting of rows
    def rows
      collection_of_squares
    end

    def l_to_r_diag
      number_of_rows_cols = collection_of_squares.size
      diag = Array.new
      row = 0
      col = 0
      while row < number_of_rows_cols
        diag.push (
                    collection_of_squares[row][col]
                  )
        row += 1
        col += 1
      end
      diag
    end

    def r_to_l_diag
      number_of_rows_cols = collection_of_squares.size
      diag = Array.new
      row = 0
      col = number_of_rows_cols - 1
      while row < number_of_rows_cols
        diag.push (
                    collection_of_squares[row][col]
                  )
        row += 1
        col -= 1
      end
      diag
    end

    def possible_winning_combinations
      winning_combinations = Array.new
      winning_combinations.push(l_to_r_diag, r_to_l_diag)

      rows.each do |row|
        winning_combinations.push(row)
      end

      cols.each do |col|
        winning_combinations.push(col)
      end
      winning_combinations
    end
  end
end