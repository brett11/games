require_relative '../shared/player'

module MM
  class ComputerPlayerExpert < Shared::Player
    def make_move(game)
      @game = game
      io_helpers.computer_choosing_graphic
      smart_move
    end

    def smart_move
      secret_code = current_result_partial_match_values.concat(current_result_exact_match_values)
      (4-(secret_code.size)).times do
        secret_code.push((1..6).to_a.sample)
      end
      secret_code.shuffle
    end

    def io_helpers
      @game.io_helpers
    end

    def current_result_partial_match_values
      @game.current_result_partial_match_values
    end

    def current_result_exact_match_values
      @game.current_result_exact_match_values
    end
  end
end