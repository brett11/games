module MM
  class GameResetter
    attr_accessor :game

    def reset_game(game)
      @game = game
      reset_board
      game.number_of_turns_taken = 0
      game.won_flag = false
    end

    def reset_board
      game.board = game.generate_empty_board(game.config)
    end
  end
end
