require_relative 'minimax'

module TTT
  class MoveGenerator

    attr_accessor :game

    def get_player_choice(game)
      @game = game
      get_move
    end

    def get_move
      if human?
        input_helper.get_player_choice(game)
      elsif computer?
        input_helper.computer_choosing_graphic
        if difficult?
          perfect_move
        elsif easy?
          random_move
        end
      end
    end

    def perfect_move
      minimax = game_module::Minimax.new(game.board, game.number_of_turns_taken, game.player_1_value, game.player_2_value)
      minimax.run_minimax
      minimax.choice
    end

    def random_move
      available_choices.sample
    end

    def available_choices
      game.available_choices
    end

    def game_module
      game.game_module
    end

    def current_player
      game.current_player
    end

    def input_helper
      game.input_helper
    end

    def human?
      game.current_player_human?
    end

    def computer?
      game.current_player_computer?
    end

    def difficult?
      game.current_player_difficult_computer?
    end

    def easy?
      game.current_player_easy_computer?
    end
  end
end