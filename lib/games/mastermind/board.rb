module MM
  class Board
    attr_accessor :number_of_rows, :number_of_cols, :pegs, :result_pegs

    def initialize(args = {})
      @number_of_rows = args[:number_of_rows]
      @number_of_cols = args[:number_of_cols]
      @pegs = args[:pegs]
      @result_pegs = args[:result_pegs]
    end

    def change_peg(row, col, new_value)
      peg_to_change = retrieve_peg(row, col)
      peg_to_change.change_value(new_value)
    end

    def display_values
      pegs.display_values
    end

    def result_values
      result_pegs.display_values
    end

    def pegs_current_row(number_of_turns_taken)
      pegs.current_row(number_of_turns_taken)
    end

    def result_pegs_current_row(number_of_turns_taken)
      result_pegs.current_row(number_of_turns_taken)
    end

    private
      def retrieve_peg(row, col)
        pegs.retrieve_peg(row, col)
      end

      #result_pegs is an instance of pegs
      def retrieve_result_peg(row, col)
        result_pegs.retrieve_peg(row,col)
      end
  end
end
