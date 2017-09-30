module MM
  class GameStateChanger
    attr_accessor :game

    def change_game_state(guess, game)
      @game = game
      game.current_guess = guess
      game.current_result = game.evaluate_guess(secret_code, current_guess)
      change_pegs(guess)
      if !game.won?
        game.move_forward_one_turn
      end
    end

    def change_pegs(guess)
      current_row.each_with_index do |peg, index|
        peg.change_value(guess[index])
      end
    end

    def current_row
      game.current_row
    end

    def secret_code
      game.secret_code
    end

    def current_guess
      game.current_guess
    end
  end
end
