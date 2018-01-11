require File.join('games', 'mastermind', 'pegs')
require File.join('games', 'mastermind', 'peg')

module MM
  module PegsFactory
    def self.build_empty_pegs(rows = 12, cols = 4, pegs_class = Pegs)
      pegs = Array.new(rows) do
        Array.new(cols)
      end

      pegs.each_with_index do |element, row|
        element.each_index do |col|
          pegs[row][col] = create_empty_peg
        end
      end

      pegs_class.new(collection_of_pegs: pegs)
    end

    def self.create_empty_peg( peg_class = Peg)
      peg_class.new
    end
  end
end