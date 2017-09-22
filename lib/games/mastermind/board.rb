module MM
  class Board
    attr_accessor :rows_and_cols, :pegs

    def initialize(args = {})
      @rows_and_cols = args[:rows_and_cols]
      @squares = args[:squares]
    end

    def change_peg(row, col, new_value)
      peg_to_change = retrieve_peg(row, col)
      peg_to_change.change_value(new_value)
    end

    private
      def retrieve_peg(row, col)
        return pegs.retrieve_peg(row, col)
      end
  end
end
