require_relative '../shared/player'

module MM
  class HumanPlayer < Shared::Player
    def make_move(game)
      game.input_helper.get_player_choice(game)
    end
  end
end