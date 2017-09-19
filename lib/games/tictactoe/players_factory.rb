require_relative '../shared/player'

module TTT
  class PlayersFactory
    def generate_players(config)
      player_1 = Games::Shared::Player.new(value: config.player_1_value, name: config.player_1_name, type: :human)
      player_2 = Games::Shared::Player.new(value: config.player_2_value, name: config.player_2_name, type: config.player_2_type, difficulty_level: config.computer_difficulty_level)
      [player_1, player_2]
    end
  end
end