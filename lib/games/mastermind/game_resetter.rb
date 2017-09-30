module MM
  class GameResetter
    attr_accessor :game

    def reset_game(game)
      @game = game
      reset_board
      game.number_of_turns_taken = 0
      game.won_flag = false
      game.secret_code = game.set_secret_code
      game.current_guess = []
      game.current_result = []
    end

    def reset_board
      game.board = game.generate_empty_board(game.config)
    end
  end
end
