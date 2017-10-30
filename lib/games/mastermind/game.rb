require_relative '../shared/game'
require 'logger'

module MM
  class Game < Shared::Game
    attr_accessor :secret_code, :current_result

    def one_time_setup
      self.players = players_factory.generate_players
      self.board = board_builder.generate_empty_board
    end

    def every_time_setup
      self.number_of_turns_taken = 0
      self.won_flag = false
      self.secret_code = set_secret_code
      self.current_result = MM::Result.new
      logger = Logger.new(STDOUT)
      logger.level = Logger::DEBUG
      logger.debug("The secret code is #{secret_code.join(",")}.")
    end


    def set_secret_code
      is_code_guesser_human = (players[0].kind_of?(MM::HumanPlayer))
      MM::SecretCode.generate(io_helpers, is_code_guesser_human)
    end

    def change_game_state(move)
      self.current_result = evaluate_guess(secret_code, move)
      change_pegs(move)
      if !won?
        move_forward_one_turn
      end
    end

    def current_result_partial_match_values
      current_result.partial_match_values
    end

    def current_result_exact_match_values
      current_result.exact_match_values
    end

    def reset_game
      reset_board
      self.number_of_turns_taken = 0
      self.won_flag = false
    end

    def reset_board
      self.board = generate_empty_board
    end

    def generate_empty_board
      board_builder.generate_empty_board
    end

    def over?
      won? || no_more_turns?
    end

    def won?
      #depends on evaluate_guess returning an array of all "X"s for perfect guess
      if won_flag
        return true
      end

      if self.current_result.is_won
        self.won_flag = true
        true
      else
        false
      end
    end

    def no_more_turns?
      number_of_turns_taken >= 12
    end

    def change_pegs(guess)
      pegs_current_row.each_with_index do |peg, index|
        peg.change_value(guess[index])
      end

      result_pegs_current_row.each_with_index do |result_peg, index|
        result_peg.change_value(current_result.xo_key[index])
      end
    end


    def change_peg(row, col, new_value)
      board.change_peg(row, col, new_value)
    end

    #below returns result object
    def evaluate_guess(secret_code, guess)
      MM::GuessEvaluator.evaluate_guess(secret_code, guess)
    end

    def pegs_current_row
      board.pegs_current_row(number_of_turns_taken)
    end

    def result_pegs_current_row
      board.result_pegs_current_row(number_of_turns_taken)
    end

    def number_of_rows
      board.number_of_rows
    end

    def number_of_cols
      board.number_of_cols
    end
  end
end
