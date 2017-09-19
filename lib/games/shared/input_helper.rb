module Games::Shared
  class InputHelper
    attr_accessor :io

    def initialize(io)
      @io = io
    end

    def get_game
      user_choice = get_user_input("Please enter \"M\" if you would like to play Mastermind. Enter \"T\" if you would like to play Tic Tac Toe.", "Invalid character. Please enter either M (Mastermind) or T (Tic Tac Toe).") do |input|
        input == 'm' || input == 'M' || input == 't' || input == 'T'
      end
      user_choice = user_choice.upcase
      if user_choice == "M"
        :mastermind
      elsif user_choice == "T"
        :tictactoe
      end
    end

    def get_player_1_name
      user_choice = get_user_input("Player 1, please enter your name", "Please re-enter your name, using only letters") do |input|
        input =~ /^[a-zA-Z]+$/
      end
      user_choice.capitalize
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

    def get_user_input(prompt, reprompt, &block_validation)
      io.present_with_new_line(prompt)
      user_choice = nil
      while true
        user_choice = io.receive
        if user_choice.to_s.upcase == "EXIT"
          #http://blog.honeybadger.io/how-to-exit-a-ruby-program/
          exit(0)
        end
        #breaks out of input loop if input is valid (the block validation makes sure some rule is true)
        break if block_validation.call(user_choice)
        puts reprompt
      end
      user_choice
    end

    def computer_choosing_graphic
      io.present("Computer choosing.")
      3.times do
        sleep(0.3)
        io.present(".")
      end
      io.present("\n")
    end

    def new_game_starting_graphic
      io.present("New game starting in 3")
      i = 2
      2.times do
        marching_dots
        io.present("#{i.to_s}")
        i = i - 1
      end
      marching_dots
      io.present("\n")
    end

    def marching_dots
      sleep(0.4)
      io.present(".")
      sleep(0.3)
      io.present(".")
      sleep(0.3)
      io.present(".")
    end
  end
end