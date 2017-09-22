require_relative '../shared/input_helper'

module MM
  class InputHelper < Games::Shared::InputHelper
    def computer_or_human_code_setter_inquiry(name)
      user_choice = get_user_input("#{name}, please enter \"1\" if you would like to be the code-guesser. Enter \"2\" if you would like set the code and have the computer guess.", "Invalid entry. Please enter either 1(computer picks code) or 2 (you pick code)") do |input|
        input == '1' || input == '2'
      end
      if user_choice == '1'
        :computer
      elsif user_choice == '2'
        :human
      end
    end

    def get_secret_code_from_user(name)
      user_choice = get_user_input("#{name}, please enter a secret code consisting of four numbers that each correspond to a color. Do not separate with punctuation. The computer will try to guess this code.", "Please re-enter a secret code, using only 4 numbers, 1 through 8.") do |input|
        input =~ /^[1-8]{4}$/
      end
      user_choice.to_s.chars.map(&:to_i)
    end

    def get_player_guess
      user_choice = get_user_input("Player 1, please enter a secret code consisting of four numbers that correspond to the color of your guess. Do not separate with punctuation.", "Please re-enter a secret code guess, using only 4 numbers, each being a digit 1 through 8.") do |input|
        input =~ /^[1-8]{4}$/
      end
      user_choice.to_s.chars.map(&:to_i)
    end

    def draw_prompt
      io.present_with_new_line("No such luck! Please try again.")
    end

    def winning_prompt(current_player_name)
      io.present_with_new_line("#{current_player_name} wins!")
    end
  end
end