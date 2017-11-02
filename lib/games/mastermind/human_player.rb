require_relative '../shared/player'

module MM
  class HumanPlayer < Shared::Player
    def make_move(game)
      game.get_player_choice(game.current_player_name)
    end
  end
end