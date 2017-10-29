require_relative '../tictactoe/player'

module TTT
  class HumanPlayer < TTT::Player
    def make_move(game)
      game.io_helpers.get_player_choice(game.current_player_name, game.available_choices)
    end
  end
end