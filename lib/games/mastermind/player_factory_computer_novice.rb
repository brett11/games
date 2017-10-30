require_relative '../shared/player_factory'
require_relative '../mastermind/computer_player_novice'

module MM
  class PlayerFactoryComputerNovice < Shared::PlayerFactory
    def generate_player
      MM::ComputerPlayerNovice.new(name: "Computer")
    end
  end
end
