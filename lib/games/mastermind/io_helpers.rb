require_relative '../shared/io_helpers'
require 'paint'

module MM
  class IOHelpers < Shared::IOHelpers
    def custom_final_message(game)
      io.present_with_new_line("The secret code was #{game.secret_code.join(",")}")
    end

    def initial_instructions
      io.present_with_new_line(Paint["-" * 60 + "MASTERMIND" + "-" * 60, :blue, :bold, :bright, :underline])
      io.present_with_new_line(Paint["INSTRUCTIONS: ", :green] + "Try to guess a 4 digit code that consists of only numbers 1-6 (\"3164\", for example).\n\n")
      io.present_with_new_line("After each guess, the \"Result\" section will generate an "+ Paint["\"X\" ", :bold, :magenta] + "for each digit in the guess that is perfect(correct number and correct spot) and an "+ Paint["\"O\" ", :bold, :magenta] + "for each digit that is the correct number but in the wrong spot.")
      io.present_with_new_line("-" * 130)
      io.present_with_new_line(Paint["Type ",:red] + Paint["\"Exit\" ", :red, :bold] + Paint["to quit the game.", :red])
      io.present_with_new_line("-" * 130)
    end

    def no_winner_prompt(game)
      if game.players[0].kind_of?(MM::HumanPlayer)
        io.present_with_new_line(Paint["No such luck! Please try again.", :red, :bold])
      else
        io.present_with_new_line(Paint["The computer has been stumped!", :green, :bold])
      end

    end

    def computer_or_human_guesser_inquiry
      user_choice = get_user_input("Please enter " + Paint["\"1\" ", :blue, :bold] + "if you would like to be the code-guesser. Enter " + Paint["\"2\" ", :blue, :bold] + "if you would like to set the code and have the computer guess.", "Invalid entry. Please enter either 1(computer picks code) or 2 (you pick code)") do |input|
        input == 1 || input == 2
      end
      if user_choice == 1
        return :human
      elsif user_choice == 2
        return :computer
      end
    end

    def get_secret_code_from_user
      user_choice = get_user_input("Please enter a secret code consisting of four numbers that each correspond to a color. Do not separate with punctuation. The computer will try to guess this code.", "Please re-enter a secret code, using only 4 numbers, 1 through 6.") do |input|
        input.to_s =~ /^[1-6]{4}$/
      end
      user_choice.to_s.chars.map(&:to_i)
    end

    def get_player_choice(current_player_name)
      user_choice = get_user_input("#{current_player_name}, please enter a secret code consisting of 4 numbers that correspond to the color of your guess. Do not separate with punctuation.", "Please re-enter a secret code guess, using exactly 4 numbers, each being a digit 1 through 6.") do |input|
        input.to_s =~ /^[1-6]{4}$/
      end
      user_choice.to_s.chars.map(&:to_i)
    end

    def get_computer_knowledge_level
      user_choice = get_user_input("Please enter " + Paint["\"D\" ", :blue, :bold] + "if you would like the computer to be kinda dumb. Enter " + Paint["\"S\" ", :blue, :bold] + "if you would like the computer to be pretty smart.", "Invalid character. Please enter either D (dumb) or S (Smart).") do |input|
        input == 's' || input == 'S' || input == 'd' || input == 'D'
      end
      user_choice = user_choice.upcase
      if user_choice == "S"
        :expert
      elsif user_choice == "D"
        :novice
      end
    end
  end
end