require_relative '../shared/game'

module MM
  class Game < Games::Shared::Game
    attr_accessor :code_setter, :secret_code, :guess_evaluator, :current_guess, :current_result, :won_flag

    def local_setup
      self.code_setter = config.code_setter
      self.secret_code = config.secret_code
      print secret_code
      print "\n"
      self.guess_evaluator = MM::GuessEvaluator.new
      self.current_guess = []
      self.current_result = []
      self.won_flag = false
    end

    def over?
      won? || over_with_no_winner?
    end

    def over_with_no_winner?
      number_of_turns_taken >= 12
    end

    def won?
      #depends on evaluate_guess returning an array of all "X"s for perfect guess
      if won_flag
        return true
      end

      if current_result == ("X" * number_of_cols).chars
        self.won_flag = true
        true
      else
        false
      end
    end

    def change_peg(row, col, new_value)
      board.change_peg(row, col, new_value)
    end

    def evaluate_guess(secret_code, guess)
      guess_evaluator.evaluate_guess(secret_code, guess)
    end

    def current_row
      board.current_row(number_of_turns_taken)
    end

    def number_of_cols
      board.number_of_cols
    end

    def set_secret_code
      config.set_secret_code
    end
  end
end
