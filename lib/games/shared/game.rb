Dir[File.join(File.dirname(__FILE__), '*.rb')].each {|file| require file }
# Dir[File.join(File.expand_path("..", File.dirname(__FILE__)), 'tictactoe', '*.rb')].each {|file| require file }
# Dir[File.join(File.expand_path("..", File.dirname(__FILE__)), 'mastermind', '*.rb')].each {|file| require file }

require_relative '../mastermind/board'
require_relative '../mastermind/board_presenter_terminal'
require_relative '../mastermind/colors'
require_relative '../mastermind/game_config'
require_relative '../mastermind/input_helper'
require_relative '../mastermind/peg'
require_relative '../mastermind/pegs'
require_relative '../mastermind/pegs_factory'
require_relative '../mastermind/players_factory'

require_relative '../tictactoe/board'
require_relative '../tictactoe/board_builder'
require_relative '../tictactoe/board_presenter_terminal'
require_relative '../tictactoe/game_config'
require_relative '../tictactoe/game_resetter'
require_relative '../tictactoe/game_state_changer'
require_relative '../tictactoe/input_helper'
require_relative '../tictactoe/minimax'
require_relative '../tictactoe/move_generator'
require_relative '../tictactoe/player'
require_relative '../tictactoe/players_factory'
require_relative '../tictactoe/square'
require_relative '../tictactoe/squares'
require_relative '../tictactoe/squares_factory'


module Games::Shared
  class Game
    attr_accessor :board, :board_presenter, :board_builder
    attr_accessor :players, :players_factory
    attr_accessor :config, :game_state_changer
    attr_accessor :number_of_turns_taken
    attr_accessor :game_resetter
    attr_accessor :move_generator
    attr_reader :io, :input_helper,  :game_module

    def initialize(args = {})
      @game_module = args.fetch(:game_module, nil)
      @io = args.fetch(:io, IOTerminal.new)
      @board_presenter = args.fetch(:board_presenter, nil)

      @input_helper = game_module::InputHelper.new(@io)
      @board_builder = game_module::BoardBuilder.new
      @game_state_changer = game_module::GameStateChanger.new
      @game_resetter = game_module::GameResetter.new
      @move_generator = game_module::MoveGenerator.new
      @players_factory = game_module::PlayersFactory.new
      @config = game_module::GameConfig.new(@input_helper)

      @number_of_turns_taken = 0
    end

    def setup
      #setup gets necessary info from user and stores it in config object
      config.setup
      self.players = players_factory.generate_players(config)
      self.board = board_builder.generate_empty_board(config)
      local_setup
    end

    #to be implemented by subclasses
    def local_setup
    end

    #overriding so that io and input_helper always in harmony
    def io=(new_io)
      @io = new_io
      self.input_helper = game_module::InputHelper.new(new_io)
    end

    def play
      while true
        while !over?
          print_board
          move = move_generator.get_player_choice(self)
          game_state_changer.change_game_state(move, self)
        end

        #need to print_final_iteration of board
        print_board

        if won?
          winning_prompt
        elsif over_with_no_winner?
          no_winner_prompt
        end

        game_resetter.reset_game(self)
        new_game_starting_graphic
      end
    end

    def current_player
      players[current_turn_player_index]
    end

    def current_player_name
      current_player.name
    end

    def current_player_human?
      current_player.type == :human
    end

    def current_player_computer?
      current_player.type == :computer
    end

    def move_forward_one_turn
      self.number_of_turns_taken += 1
    end

    def generate_empty_board(config)
      board_builder.generate_empty_board(config)
    end

    def change_game_state(available_choice, game)
      game_state_changer.change_game_state(available_choice, game)
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

    def over?
      raise 'Called abstract method: over?'
    end

    def over_with_no_winner?
      raise 'Called abstract method: draw?'
    end

    def won?
      raise 'Called abstract method: won?'
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

    def winning_prompt
      input_helper.winning_prompt(current_player.name)
    end

    def no_winner_prompt
      input_helper.no_winner_prompt
    end

    def new_game_starting_graphic
      input_helper.new_game_starting_graphic
    end
  end
end
