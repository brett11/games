Dir[File.join(File.dirname(__FILE__), '*.rb')].each {|file| require file }
Dir[File.join(File.expand_path("..", File.dirname(__FILE__)), 'tictactoe', '*.rb')].each {|file| require file }

module Games::Shared
  class Game
    attr_accessor :board, :board_presenter, :board_builder
    attr_accessor :players, :players_factory
    attr_accessor :config, :game_state_changer
    attr_accessor :number_of_turns_taken
    attr_reader :io, :input_helper,  :game_module

    def initialize(args = {})
      @game_module = args.fetch(:game_module, nil)
      @io = args.fetch(:io, IOTerminal.new)
      @board_presenter = args.fetch(:board_presenter, nil)
      @number_of_turns_taken = 0
      @input_helper = game_module::InputHelper.new(@io)
      # below finds the user needed input needed for initial players and board configuration and stores in config object
      @config = game_module::GameConfig.new(@input_helper)
      @board_builder = game_module::BoardBuilder.new
      @game_state_changer = game_module::GameStateChanger.new
      @players_factory = game_module::PlayersFactory.new
      @players = players_factory.generate_players(config)
      @board = board_builder.generate_empty_board(config)
    end

    #overriding so that io and input_helper always in harmony
    def io=(new_io)
      @io = new_io
      self.input_helper = game_module::InputHelper.new(new_io)
    end

    def reset_board
      self.board = board_builder.generate_empty_board(config)
    end

    def reset_game
      reset_board
      self.number_of_turns_taken = 0
    end

    def play
      while true
        while !over?
          print_board
          player_choice = get_player_choice
          game_state_changer.change_game_state(player_choice, self)
        end

        #need to print_final_iteration of board
        print_board

        if won?
          winning_prompt
        elsif draw?
          draw_prompt
        end

        reset_game
        new_game_starting_graphic
      end
    end

    def over?
      board.full? || board.won?
    end

    def draw?
      board.full? && !board.won?
    end

    def won?
      board.won?
    end

    def winner
      #each move is immediately proceeded by an increment to number_of_selections_made; therefore, need to rewind won to find winner
      if !won?
        return nil
      end
      current_player
    end

    def perfect_move
      move_generator = game_module::MoveGenerator.new(self)
      move_generator.minimax
      move_generator.choice
    end

    def random_move
      available_choices.sample
    end

    def available_choices
      board.available_choices
    end

    def get_player_choice
      if current_player.type == :human
        input_helper.get_player_choice(self)
      elsif current_player.type == :computer
        input_helper.computer_choosing_graphic
        if current_player.difficulty_level == :difficult
          perfect_move
        elsif current_player.difficulty_level == :easy
          random_move
        end
      end
    end

    def print_board
      board_presenter.present_board(board)
    end

    def current_player
      players[current_turn_player_index]
    end

    def move_forward_one_turn
      self.number_of_turns_taken += 1
    end

    private

    def number_of_players
      players.size
    end


    def current_turn_player_index
      (number_of_turns_taken % number_of_players)
    end

    def winning_prompt
      io.present_with_new_line("#{current_player.name} wins!")
    end

    def draw_prompt
      io.present_with_new_line("No winner! Please try again.")
    end

    def new_game_starting_graphic
      input_helper.new_game_starting_graphic
    end
  end
end
