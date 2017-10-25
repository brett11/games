require_relative '../shared/game'
require 'logger'

module MM
  class Game < Shared::Game
    attr_accessor :secret_code, :current_guess, :current_result

    def local_setup
      self.secret_code = config.secret_code
      logger = Logger.new(STDOUT)
      logger.level = Logger::DEBUG
      logger.debug("The secret code is #{secret_code.join(",")}.")
      self.current_guess = []
      self.current_result = []
      self.won_flag = false
    end

    def change_game_state(move)
      self.current_guess = move
      self.current_result = evaluate_guess(secret_code, current_guess)
      change_pegs(move)
      if !won?
        move_forward_one_turn
      end
    end

    def reset_game
      reset_board
      self.number_of_turns_taken = 0
      self.won_flag = false
      self.secret_code = set_secret_code
      self.current_guess = []
      self.current_result = []
    end

    def reset_board
      self.board = generate_empty_board(config)
    end

    def change_pegs(guess)
      pegs_current_row.each_with_index do |peg, index|
        peg.change_value(guess[index])
      end

      result_pegs_current_row.each_with_index do |result_peg, index|
        result_peg.change_value(current_result[index])
      end
    end

    def over?
      won? || over_with_no_winner?
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

    #only gets evaluated if won is false
    def over_with_no_winner?
      number_of_turns_taken >= 12
    end

    def change_peg(row, col, new_value)
      board.change_peg(row, col, new_value)
    end

    def evaluate_guess(secret_code, guess)
      MM::GuessEvaluator.evaluate_guess(secret_code, guess)
    end

    def pegs_current_row
      board.pegs_current_row(number_of_turns_taken)
    end

    def result_pegs_current_row
      board.result_pegs_current_row(number_of_turns_taken)
    end

    def number_of_cols
      board.number_of_cols
    end

    def set_secret_code
      config.set_secret_code
    end
  end
end
