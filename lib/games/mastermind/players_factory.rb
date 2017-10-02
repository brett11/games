require_relative '../shared/player'

module MM
  class PlayersFactory
    #returns an array in case we would like to extend the game to allow for multiple players
    def generate_players(config)
      if config.code_setter == :computer
        player_1 = Games::Shared::Player.new(name: config.player_1_name)
      else
        player_1 = Games::Shared::Player.new(name: config.player_1_name, type: :computer)
      end
      [player_1]
    end
  end
end