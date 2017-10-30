require_relative '../shared/io_helpers'
require 'paint'

module TTT
  class IOHelpers < Shared::IOHelpers
    def initial_instructions
      io.present_with_new_line(Paint["-" * 60 + "TIC TAC TOE" + "-" * 60, :blue, :bold, :bright, :underline])
      io.present_with_new_line(Paint["INSTRUCTIONS: ", :green] + "Try to fill a row, a column, or a diagonal with only your token value.")
      io.present_with_new_line("-" * 131)
      io.present_with_new_line(Paint["Type ",:red] + Paint["\"Exit\" ", :red, :bold] + Paint["to quit the game.", :red])
      io.present_with_new_line("_" * 131)
    end

    def no_winner_prompt(game)
      io.present_with_new_line(Paint["Draw! Please try again.", :red, :bold])
    end

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

    def is_player_2_saved?
      user_choice = get_user_input("Is Player 2 saved? Please enter either Y(yes) or N(no).", "Invalid entry. Please enter either Y(yes) or N(no).") do |input|
        input == 'y' || input == 'Y' || input == 'n' || input == 'N'
      end
      user_choice.capitalize == "Y"
    end

    def get_opponent_name
      user_choice = get_user_input("Player 2, please enter your name:", "Please re-enter your name, using only letters") do |input|
        input =~ /^[a-zA-Z]+$/
      end
      user_choice.capitalize
    end

    def get_player_value(player_name = "Player 1", taken_value = "")
      user_choice = get_user_input("#{player_name}, please enter your preferred token value, consisting of one letter only. For example, " + Paint["\"X\" ", :blue, :bold] + "and " + Paint["\"O\" ", :blue, :bold] + " are the most common token values in Tic Tac Toe.", "Invalid entry. Must be one letter. Please re-enter.") do |input|
        (input =~ /^[a-zA-Z]$/  && input.upcase != taken_value.upcase)
      end
      user_choice.upcase
    end

    # def get_player_2_name
    #   user_choice = get_user_input("Player 2, please enter your name", "Please re-enter your name, using only letters") do |input|
    #     input =~ /^[a-zA-Z]+$/
    #   end
    #   user_choice.capitalize
    # end

    def get_player_2_type
      user_choice = get_user_input("Please enter " + Paint["\"C\" ", :blue, :bold] +  "if you would like to play the Computer. Enter " + Paint["\"H\" ", :blue, :bold] + "if you would like to play the human sitting next to you:", "Invalid character. Please enter either C(Computer) or H(Human).") do |input|
        input == 'c' || input == 'C' || input == 'h' || input == 'H'
      end
      user_choice = user_choice.upcase
      if user_choice == "C"
        :computer
      elsif user_choice == "H"
        :human
      end
    end

    def get_computer_knowledge_level
      user_choice = get_user_input("Please enter " + Paint["\"E\" ", :blue, :bold] + "if you would like to play an easy Computer. Enter " + Paint["\"D\" ", :blue, :bold] +"if you would like to play an extremely difficult computer.", "Invalid character. Please enter either E (Easy) or D (Difficult).") do |input|
        input == 'd' || input == 'D' || input == 'e' || input == 'E'
      end
      user_choice = user_choice.upcase
      if user_choice == "D"
        :expert
      elsif user_choice == "E"
        :novice
      end
    end

    def get_player_choice(current_player_name, available_choices)
      get_user_input("#{current_player_name}, please enter the number of the square that you would like to change.", "Invalid entry. Please try again.") do |input|
        available_choices.include?(input)
      end
    end
  end
end