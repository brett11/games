require_relative '../shared/input_helper'

module MM
  class InputHelper < Shared::InputHelper
    def computer_or_human_guesser_inquiry
      user_choice = get_user_input("Please enter \"1\" if you would like to be the code-guesser. Enter \"2\" if you would like to set the code and have the computer guess.", "Invalid entry. Please enter either 1(computer picks code) or 2 (you pick code)") do |input|
        input == 1 || input == 2
      end
      if user_choice == 1
        return :human
      elsif user_choice == 2
        return :computer
      end
    end

    def get_secret_code_from_user(name)
      user_choice = get_user_input("#{name}, please enter a secret code consisting of four numbers that each correspond to a color. Do not separate with punctuation. The computer will try to guess this code.", "Please re-enter a secret code, using only 4 numbers, 1 through 6.") do |input|
        input.to_s =~ /^[1-6]{4}$/
      end
      user_choice.to_s.chars.map(&:to_i)
    end

    def get_player_choice(game)
      user_choice = get_user_input("#{game.current_player_name}, please enter a secret code consisting of 4 numbers that correspond to the color of your guess. Do not separate with punctuation.", "Please re-enter a secret code guess, using exactly 4 numbers, each being a digit 1 through 6.") do |input|
        input.to_s =~ /^[1-6]{4}$/
      end
      user_choice.to_s.chars.map(&:to_i)
    end

    def initial_instructions
      io.present_with_new_line("MASTERMIND")
      io.present_with_new_line("__________")
      io.present_with_new_line("INSTRUCTIONS: Try to guess a 4 digit code \nthat contains a collection of numbers 1-6 \n(\"6241\", for example).")
      io.present_with_new_line("After each guess, the \"Result\" section will generate \nan \"X\" for each digit in the guess that \nis perfect(correct number and correct spot) and \nan \"O\" for each digit that is the correct \nnumber but in the wrong spot.")
      io.present_with_new_line("___________")
      io.present_with_new_line("Type \"Exit\" to quit the game.")
      io.present_with_new_line("___________")
    end

    def get_computer_knowledge_level
      user_choice = get_user_input("Please enter \"D\" if you would like the computer to be kinda dumb. Enter \"S\" if you would like the computer to be pretty smart.", "Invalid character. Please enter either D (dumb) or S (Smart).") do |input|
        input == 's' || input == 'S' || input == 'd' || input == 'D'
      end
      user_choice = user_choice.upcase
      if user_choice == "S"
        :expert
      elsif user_choice == "D"
        :novice
      end
    end

    def no_winner_prompt
      io.present_with_new_line("No such luck! Please try again.")
    end

    def custom_final_message(game)
      io.present_with_new_line("The secret code was #{game.secret_code.join(",")}")
    end

    def get_number_of_rows
      get_user_input("Please choose how many rows of pegs you would like, from 4 to 12.", "Please choose a number between 4 and 12.") do |input|
        input.to_i >=4 && input.to_i <=12
      end
    end

    def get_number_of_cols
      get_user_input("Please choose how many pegs you would like in each row, from 4 to 6.", "Please choose a number between 4 and 6.") do |input|
        input.to_i >=4 && input.to_i <=6
      end
    end
  end
end