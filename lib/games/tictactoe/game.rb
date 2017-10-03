require_relative '../shared/game'

module TTT
  class Game < Shared::Game
    attr_accessor :won_flag

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

    def current_player_difficult_computer?
      current_player_computer? && current_player.difficulty_level == :difficult
    end

    def current_player_easy_computer?
      current_player_computer? && current_player.difficulty_level == :easy
    end

    def change_square(display_value, current_player_value)
      board.change_square(display_value, current_player_value)
    end
  end
end
