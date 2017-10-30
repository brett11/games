require_relative '../shared/player_factory'

module TTT
  class PlayerFactoryComputer < Shared::PlayerFactory
    def computer_value(taken)
      if taken != "O"
        "O"
      else
        "X"
      end
    end
  end
end
