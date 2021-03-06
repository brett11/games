require File.join('games', 'tictactoe', 'computer_player_expert')

module Shared
  class Game
    attr_accessor :board, :board_presenter, :board_builder
    attr_accessor :players, :players_factory
    attr_accessor :number_of_turns_taken, :won_flag
    attr_reader :io_helpers

    def initialize(args = {})
      @board_presenter = args.fetch(:board_presenter)

      @io_helpers = args.fetch(:io_helpers)
      @board_builder = args.fetch(:board_builder)
      @players_factory = args.fetch(:players_factory)

      @number_of_turns_taken = 0
    end

    def play
      initial_instructions
      one_time_setup
      loop do
        every_time_setup
        while !over?
          print_board
          move = current_player.make_move(self)
          change_game_state(move)
        end

        #need to print_final_iteration of board
        print_board

        if won?
          winning_prompt
        elsif no_more_turns?
          no_winner_prompt(self)
          custom_final_message(self)
        end

        reset_game
        new_game_starting_graphic
      end
    end

    def current_player
      players[current_turn_player_index]
    end

    def current_player_name
      current_player.name
    end

    def move_forward_one_turn
      self.number_of_turns_taken += 1
    end

    def winner
      #each move is immediately proceeded by an increment to number_of_selections_made; therefore, need to rewind won to find winner
      if !won?
        nil
      end
      current_player
    end

    def display_values
      board.display_values
    end


    def computer_choosing_graphic
      io_helpers.computer_choosing_graphic
    end

    private

    #hook
    def one_time_setup
    end

    #hook
    def every_time_setup
    end


    def second_player_expert_computer?
      players[1].kind_of?(TTT::ComputerPlayerExpert)
    end

    #overriding so that io and io_helpers always in harmony

    def over?
      raise 'Called abstract method: over?'
    end

    def no_more_turns?
      raise 'Called abstract method: no_more_turns?'
    end

    def won?
      raise 'Called abstract method: won?'
    end

    def change_game_state(move)
      raise 'Called abstract method: change_game_state'
    end

    def reset_game
      raise 'Called abstract method: reset_game'
    end

    def reset_board
      raise 'Called abstract method: reset_board'
    end

    def print_board
      board_presenter.present_board(board)
    end

    def number_of_players
      players.size
    end

    def current_turn_player_index
      (number_of_turns_taken % number_of_players)
    end

    def custom_final_message(game)
      io_helpers.custom_final_message(game)
    end

    def initial_instructions
      io_helpers.initial_instructions
    end

    def winning_prompt
      io_helpers.winning_prompt(current_player_name)
    end

    def no_winner_prompt(game)
      io_helpers.no_winner_prompt(game)
    end

    def new_game_starting_graphic
      io_helpers.new_game_starting_graphic
    end
  end
end
