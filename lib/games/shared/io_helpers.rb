require 'paint'

module Shared
  class IOHelpers
    attr_accessor :io

    def initialize(io)
      @io = io
    end

    def is_player_1_saved?
      user_choice = get_user_input("Would you like to play with your saved profile? Please enter either Y(yes) or N(no).", "Invalid entry. Please enter either Y(yes) or N(no).") do |input|
        input == 'y' || input == 'Y' || input == 'n' || input == 'N'
      end
      user_choice.capitalize == "Y"
    end

    def get_player_1_name
      user_choice = get_user_input("Player 1, please enter your name:", "Please re-enter your name, using only letters") do |input|
        input =~ /^[a-zA-Z]+$/
      end
      user_choice.capitalize
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

    def winning_prompt(current_player_name)
      if current_player_name == "Computer"
        io.present_with_new_line(Paint["#{current_player_name} wins!", :red, :bold])
      else
        io.present_with_new_line(Paint["#{current_player_name} wins!", :green, :bold])
      end
    end

    def custom_final_message(game)
      #hook
    end

    private

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

    def marching_dots
      sleep(0.2)
      io.present(".")
      sleep(0.2)
      io.present(".")
      sleep(0.1)
      io.present(".")
    end
  end
end