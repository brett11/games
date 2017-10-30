require_relative '../shared/player_factory'
require_relative '../tictactoe/human_player'

module TTT
  class PlayerFactoryHumanNew < Shared::PlayerFactory
    def generate_player(is_first_player, taken = "")
      if is_first_player
        player_name = io_helpers.get_player_1_name
      else
        player_name = io_helpers.get_opponent_name
      end
      player_value = io_helpers.get_player_value(player_name, taken)
      TTT::HumanPlayer.new(name: player_name, value: player_value)
    end
  end
end
