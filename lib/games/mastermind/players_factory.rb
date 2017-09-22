require_relative '../shared/player'

module MM
  class PlayersFactory
    #returns an array in case we would like to extend the game to allow for multiple players
    def generate_players(config)
      player_1 = Games::Shared::Player.new(name: config.player_1_name)
      [player_1]
    end
  end
end