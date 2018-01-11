require 'games/tictactoe/player'

module TTT
  class HumanPlayer < TTT::Player
    def make_move(game)
      game.get_player_choice(game.current_player_name, game.available_choices)
    end
  end
end