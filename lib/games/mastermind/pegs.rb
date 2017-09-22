module MM
  class Pegs
    attr_reader :collection_of_pegs

    #collection_of_squares is a multi-dimensional array

    def initialize(args)
      @collection_of_pegs = args[:collection_of_pegs]
    end

    def retrieve_square(row, col)
      if row >= number_of_rows_cols || col >= number_of_rows_cols
        return nil
      else
        return collection_of_pegs[row][col]
      end
    end
  end

  def number_of_rows_cols
    collection_of_squares.length
  end
end
