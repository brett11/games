require_relative '../shared/player_factory'
require_relative '../mastermind/human_player'

module MM
  class PlayerFactoryHumanNew < Shared::PlayerFactory
    def generate_player
      player_name = io_helpers.get_player_1_name
      MM::HumanPlayer.new(name: player_name)
    end
  end
end
