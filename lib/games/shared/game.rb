Dir[File.join(File.dirname(__FILE__), '*.rb')].each {|file| require file }
# note the below exclude the game subclasses, because these classes inherit from this class, so if we require these before the parent class is read, an error will be generated.
Dir[File.join(File.expand_path("..", File.dirname(__FILE__)), 'tictactoe', '*.rb')].each {|file| require file unless file == File.join(File.expand_path("..", File.dirname(__FILE__)), 'tictactoe', 'game.rb')}
Dir[File.join(File.expand_path("..", File.dirname(__FILE__)), 'mastermind', '*.rb')].each {|file| require file unless file == File.join(File.expand_path("..", File.dirname(__FILE__)), 'mastermind', 'game.rb')}

module Shared
  class Game
    attr_accessor :board, :board_presenter, :board_builder
    attr_accessor :players, :players_factory
    attr_accessor :config
    attr_accessor :number_of_turns_taken, :won_flag
    attr_reader :io, :io_helpers,  :game_module


    def initialize(args = {})
      @game_module = args.fetch(:game_module)
      @io = args.fetch(:io)
      @board_presenter = args.fetch(:board_presenter)

      @io_helpers = args.fetch(:io_helpers)
      @board_builder = args.fetch(:board_builder)
      @players_factory = args.fetch(:players_factory)
      @config = args.fetch(:config)

      @number_of_turns_taken = 0
    end

    def play
      initial_instructions
      one_time_setup
      while true
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
        elsif over_with_no_winner?
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

    def generate_empty_board(config)
      board_builder.generate_empty_board(config)
    end

    def winner
      #each move is immediately proceeded by an increment to number_of_selections_made; therefore, need to rewind won to find winner
      if !won?
        return nil
      end
      current_player
    end

    def display_values
      board.display_values
    end

    private

    def one_time_setup
      #setup gets necessary info from user and stores it in config object
      config.one_time_setup
    end

    def every_time_setup
      #setup gets necessary info from user and stores it in config object
      config.every_time_setup
      self.players = players_factory.generate_players(config)
      self.board = board_builder.generate_empty_board(config)
      local_setup
    end

    #to be implemented by subclasses
    def local_setup
    end

    #overriding so that io and io_helpers always in harmony
    def io=(new_io)
      @io = new_io
      self.io_helpers = game_module::IOHelpers.new(new_io)
    end

    def over?
      raise 'Called abstract method: over?'
    end

    def over_with_no_winner?
      raise 'Called abstract method: draw?'
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
      self.board = generate_empty_board(config)
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
