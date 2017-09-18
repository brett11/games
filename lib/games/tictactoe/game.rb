require_relative 'io_terminal'
require_relative 'board_presenter_terminal'
require_relative 'game_config'
require_relative 'squares_factory'

module TTT
  class Game
    attr_accessor :board, :players, :board_presenter, :number_of_turns_taken, :config
    attr_reader :io, :input_helper

    def initialize(args = {})
      @io = args.fetch(:io, IOTerminal.new)
      @board_presenter = args.fetch(:board_presenter, BoardPresenterTerminal.new)
      @input_helper = InputHelper.new(@io)
      @number_of_turns_taken = 0
      # below finds the user needed input needed for initial players and board configuration and stores in config object
      @config = GameConfig.new(@input_helper)
      @players = generate_players
      @board = generate_empty_board
    end

    #overriding so that io and input_helper always in harmony
    def io=(new_io)
      @io = new_io
      self.input_helper = InputHelper.new(new_io)
    end

    def generate_players
      player_1 = Player.new(value: config.player_1_value, name: config.player_1_name, type: :human)
      player_2 = Player.new(value: config.player_2_value, name: config.player_2_name, type: config.player_2_type, difficulty_level: config.computer_difficulty_level)
      [player_1, player_2]
    end

    def generate_empty_board
      number_of_rows_cols = config.number_of_rows_cols
      Board.new(rows_and_cols: number_of_rows_cols, squares: SquaresFactory.build_empty_squares(number_of_rows_cols) )
    end

    def reset_board
      self.board = generate_empty_board
    end

    def reset_game
      reset_board
      self.number_of_turns_taken = 0
    end

    def play
      while true
        while !over?
          print_board
          square_choice = get_square_choice
          #note that change_square moves current_player forward only if game is not won
          if square_choice == :exit
            break
          else
            change_square(square_choice, current_player.value)
          end
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


    def get_square_choice
      if current_player.type == :human
        input_helper.get_square_to_change(current_player.name, available_choices)
      elsif current_player.type == :computer
        input_helper.computer_choosing_graphic
        if current_player.difficulty_level == :difficult
          perfect_move
        elsif current_player.difficulty_level == :easy
          random_move
        end
      end
    end

    def change_square(display_value, new_value)
      board.change_square(display_value, new_value)
      if !won?
        move_forward_one_turn
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
      move_generator = MoveGenerator.new(self)
      move_generator.minimax
      move_generator.choice
    end

    def random_move
      available_choices.sample
    end

    def available_choices
      board.available_choices
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
      io.present_with_new_line("Draw!")
    end

    def new_game_starting_graphic
      input_helper.new_game_starting_graphic
    end
  end
end