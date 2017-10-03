require_relative '../shared/input_helper'

module TTT
  class InputHelper < Shared::InputHelper
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

    def get_player_2_name
      user_choice = get_user_input("Player 2, please enter your name", "Please re-enter your name, using only letters") do |input|
        input =~ /^[a-zA-Z]+$/
      end
      user_choice.capitalize
    end

    def get_player_2_type
      user_choice = get_user_input("Please enter \"C\" if you would like to play the Computer. Enter \"H\" if you would like to play the human sitting next to you.", "Invalid character. Please enter either C(Computer) or H(Human).") do |input|
        input == 'c' || input == 'C' || input == 'h' || input == 'H'
      end
      user_choice = user_choice.upcase
      if user_choice == "C"
        :computer
      elsif user_choice == "H"
        :human
      end
    end

    def get_computer_difficulty_level
      user_choice = get_user_input("Please enter \"E\" if you would like to play an easy Computer. Enter \"D\" if you would like to play an extremely difficult computer.", "Invalid character. Please enter either E (Easy) or D (Difficult).") do |input|
        input == 'd' || input == 'D' || input == 'e' || input == 'E'
      end
      user_choice = user_choice.upcase
      if user_choice == "D"
        :difficult
      elsif user_choice == "E"
        :easy
      end
    end

    def get_player_2_value(taken_value)
      user_choice = get_user_input("Player 2, please enter your value", "Must not be #{taken_value}, please re-enter") do |input|
        input.upcase != taken_value.upcase
      end
      user_choice.upcase
    end

    def get_player_choice(game)
      get_user_input("#{game.current_player_name}, please enter the number of the square that you would like to change.", "Invalid entry. Please try again.") do |input|
        game.available_choices.include?(input)
      end
    end

    def draw_prompt
      io.present_with_new_line("Draw! Please try again.")
    end

    def winning_prompt(current_player_name)
      io.present_with_new_line("#{current_player_name} wins!")
    end

    def no_winner_prompt
      io.present_with_new_line("Draw!")
    end
  end
end