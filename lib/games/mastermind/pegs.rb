module MM
  class Pegs
    attr_reader :collection_of_pegs

    #collection_of_pegs is a multi-dimensional array

    def initialize(args)
      @collection_of_pegs = args[:collection_of_pegs]
    end

    def retrieve_peg(row, col)
      if row >= number_of_rows || col >= number_of_cols
        return nil
      else
        return collection_of_pegs[row][col]
      end
    end

    def display_values
      collection_of_pegs.reverse.map do |row|
        row.map do |peg|
          peg.display_value
        end
      end
    end

    private
      def number_of_rows
        collection_of_pegs.length
      end

      def number_of_cols
        collection_of_pegs[0].length
      end
  end
end

