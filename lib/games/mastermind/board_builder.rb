require_relative 'pegs_factory'

module MM
  class BoardBuilder
    def generate_empty_board(config)
      MM::Board.new(number_of_rows: config.number_of_rows, number_of_cols: config.number_of_cols, pegs: MM::PegsFactory.build_empty_pegs(config.number_of_rows, config.number_of_cols), result_pegs: MM::PegsFactory.build_empty_pegs(config.number_of_rows, config.number_of_cols) )
    end
  end
end
