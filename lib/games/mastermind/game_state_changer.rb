module MM
  class GameStateChanger
    attr_accessor :game

    def change_game_state(guess, game)
      @game = game
      game.current_guess = guess
      change_pegs(guess)
    end

    def change_pegs(guess)
      current_row.each_with_index do |peg, index|
        peg.change_value(guess[index])
      end
    end

    def current_row
      game.current_row
    end
  end
end
