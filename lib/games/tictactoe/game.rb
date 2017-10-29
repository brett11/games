require_relative '../shared/game'

module TTT
  class Game < Shared::Game
    def change_game_state(move)
      change_square(move, current_player_value)
      if !won?
        move_forward_one_turn
      end
    end

    def local_setup
      self.won_flag = false
    end


    def over?
      won_flag || over_with_no_winner?
    end

    def over_with_no_winner?
      board.full?
    end

    def won?
      if won_flag
        return true
      end

      if board.won?
        self.won_flag = true
      else
        false
      end
    end

    def reset_game
      reset_board
      self.number_of_turns_taken = 0
      self.won_flag = false
    end

    def available_choices
      board.available_choices
    end

    def player_1_value
      players[0].value
    end

    def player_2_value
      players[1].value
    end

    def current_player_value
      current_player.value
    end

    def change_square(display_value, current_player_value)
      board.change_square(display_value, current_player_value)
    end
  end
end
