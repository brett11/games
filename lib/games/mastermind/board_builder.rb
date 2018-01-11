require 'games/mastermind/board'
require 'games/mastermind/pegs_factory'

module MM
  class BoardBuilder
    def generate_empty_board(number_of_rows = 12, number_of_cols = 4)
      MM::Board.new(number_of_rows: number_of_rows,
                    number_of_cols: number_of_cols,
                    pegs: MM::PegsFactory.build_empty_pegs(number_of_rows, number_of_cols),
                    result_pegs: MM::PegsFactory.build_empty_pegs(number_of_rows, number_of_cols) )
    end
  end
end
