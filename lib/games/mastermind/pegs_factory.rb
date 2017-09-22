require_relative 'pegs'
require_relative 'peg'

module MM
  module PegsFactory
    def self.build_empty_pegs(rows_and_cols, pegs_class = Pegs)
      pegs = Array.new(rows_and_cols) do
        Array.new(rows_and_cols)
      end

      pegs.each_with_index do |element, row|
        element.each_index do |col|
          squares[row][col] = create_empty_square(row, col)
        end
      end

      pegs_class.new(collection_of_pegs: pegs)
    end

    def self.create_empty_square(row, col, display_value = 0, peg_class = Peg)
      peg_class.new(display_value: display_value,
                       row: row,
                       col: col )
    end
  end
end