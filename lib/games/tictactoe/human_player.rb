require_relative '../tictactoe/player'

module TTT
  class HumanPlayer < TTT::Player
    def make_move(game)
      game.input_helper.get_player_choice(game)
    end
  end
end