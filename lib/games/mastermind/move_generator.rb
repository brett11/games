module MM
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
        computer_move
      end
    end

    def computer_move
      secret_code = []
      4.times do
        secret_code.push((1..6).to_a.sample)
      end
      secret_code
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
  end
end

