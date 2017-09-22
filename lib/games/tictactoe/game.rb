require_relative '../shared/game'

module TTT
  class Game < Games::Shared::Game
    def over?
      board.full? || board.won?
    end

    def no_winner?
      board.full? && !board.won?
    end

    def won?
      board.won?
    end

    def available_choices
      board.available_choices
    end

    def current_player_value
      current_player.value
    end

    def current_player_human?
      current_player.type == :human
    end

    def current_player_computer?
      current_player.type == :computer
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
