require_relative 'pegs'
require_relative 'peg'

module MM
  module PegsFactory
    def self.build_empty_pegs(rows = 12, cols = 4, pegs_class = Pegs)
      pegs = Array.new(rows) do
        Array.new(cols)
      end

      pegs.each_with_index do |element, row|
        element.each_index do |col|
          pegs[row][col] = create_empty_peg(row, col)
        end
      end

      pegs_class.new(collection_of_pegs: pegs)
    end

    def self.create_empty_peg(row, col, display_value = nil, peg_class = Peg)
      peg_class.new(display_value: display_value,
                       row: row,
                       col: col )
    end
  end
end