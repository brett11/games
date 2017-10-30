require_relative '../shared/player_factory'
require_relative '../mastermind/computer_player_expert'

module MM
  class PlayerFactoryComputerExpert < Shared::PlayerFactory
    def generate_player
      MM::ComputerPlayerExpert.new(name: "Computer")
    end
  end
end
