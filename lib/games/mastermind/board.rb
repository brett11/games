module MM
  class Board
    attr_accessor :number_of_rows, :number_of_cols, :pegs

    def initialize(args = {})
      @number_of_rows = args[:number_of_rows]
      @number_of_cols = args[:number_of_cols]
      @pegs = args[:pegs]
    end

    def change_peg(row, col, new_value)
      peg_to_change = retrieve_peg(row, col)
      peg_to_change.change_value(new_value)
    end

    def display_values
      return pegs.display_values
    end

    def result_values
      return pegs.display_values
    end

    def current_row(number_of_turns_taken)
      pegs.current_row(number_of_turns_taken)
    end

    private
      def retrieve_peg(row, col)
        return pegs.retrieve_peg(row, col)
      end
  end
end
