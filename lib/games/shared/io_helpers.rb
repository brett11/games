require 'paint'

module Shared
  class IOHelpers
    attr_accessor :io

    def initialize(io)
      @io = io
    end

    def initial_instructions
      raise 'Called abstract method: initial_instructions'
    end

    def choose_game
      user_choice = get_user_input("Please enter " + Paint["\"1\" ", :blue, :bold] + "if you would like to play tictactoe. Enter " + Paint["\"2\" ", :blue, :bold] + "if you would like to play mastermind.", "Invalid entry. Please enter either 1(tictactoe) or 2 (mastermind)") do |input|
        input == 1 || input == 2
      end
      if user_choice == 1
        return :tictactoe
      elsif user_choice == 2
        return :mastermind
      end
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

    def no_winner_prompt
      raise 'Called abstract method: no_winner_prompt'
    end

    def custom_final_message(game)
      #hook
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

    private

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