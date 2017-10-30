require_relative '../shared/game'

module TTT
  class Game < Shared::Game
    def one_time_setup
      self.players = players_factory.generate_players
      number_of_rows_cols = get_board_rows
      self.board = board_builder.generate_empty_board(number_of_rows_cols)
      local_setup
    end

    def every_time_setup

    end

    def get_board_rows
      #need this if else logic because if computer is difficult, it runs minimax, which is too slow to allow for more than 3 rows/cols
      if second_player_expert_computer?
        io_helpers.get_number_of_rows_cols_max_3
      else
        io_helpers.get_number_of_rows_cols_max_9
      end
    end

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
      won_flag || no_more_turns?
    end

    def no_more_turns?
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

    def reset_board
      self.board = generate_empty_board(number_of_rows_cols)
    end

    def number_of_rows_cols
      board.number_of_rows_cols
    end

    def generate_empty_board(number_of_rows_cols)
      board_builder.generate_empty_board(number_of_rows_cols)
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
