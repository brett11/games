require_relative '../mastermind/human_player'
require_relative '../mastermind/computer_player'

module MM
  class PlayersFactory
    #returns an array in case we would like to extend the game to allow for multiple players
    def generate_players(config)
      if config.code_setter == :computer
        player_1 = MM::HumanPlayer.new(name: config.player_1_name)
      else
        player_1 = MM::ComputerPlayer.new(name: config.player_1_name)
      end
      [player_1]
    end
  end
end