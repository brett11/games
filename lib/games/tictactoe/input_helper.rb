require_relative '../shared/input_helper'

module TTT
  class InputHelper < Games::Shared::InputHelper
    def get_number_of_rows_cols_max_3
      get_user_input("Please choose how many squares you would like in each row.", "Please choose number between 2 and 3.") do |input|
        input.to_i >=2 && input.to_i <=3
      end
    end

    def get_number_of_rows_cols_max_9
      get_user_input("Please choose how many squares you would like in each row.", "Please choose number between 2 and 3.") do |input|
        input.to_i >=2 && input.to_i <=9
      end
    end

    def get_player_1_value(player_name = "Player 1")
      user_choice = get_user_input("#{player_name}, please enter a value of either X or O", "Must be X or O. Please re-enter.") do |input|
        input == 'x' || input == 'X' || input == 'o' || input == 'O'
      end
      user_choice.upcase
    end

    def get_player_2_value(taken_value)
      user_choice = get_user_input("Player 2, please enter your value", "Must not be #{taken_value}, please re-enter") do |input|
        input.upcase != taken_value
      end
      user_choice.upcase
    end

    def get_player_choice(game)
      get_user_input("#{game.current_player.name}, please enter the number of the square that you would like to change.", "Invalid entry. Please try again.") do |input|
        game.available_choices.include?(input)
      end
    end
  end
end