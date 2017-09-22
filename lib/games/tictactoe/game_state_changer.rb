module TTT
  class GameStateChanger
    attr_accessor :game

    def change_game_state(player_choice, game)
      @game = game
      change_square(player_choice)
    end

    def change_square(display_value)
      game.change_square(display_value, game.current_player_value)
      if !game.won?
        game.move_forward_one_turn
      end
    end
  end
end
