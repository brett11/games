module TTT
  class GameStateChanger
    def change_game_state(player_choice, game)
      change_square(player_choice, game)
    end

    def change_square(display_value, game)
      game.board.change_square(display_value, game.current_player.value)
      if !game.won?
        game.move_forward_one_turn
      end
    end
  end
end
