require_relative '../tictactoe/player_factory'

module TTT
  class PlayerFactoryComputer < TTT::PlayerFactory
    def computer_value(taken)
      if taken != "O"
        "O"
      else
        "X"
      end
    end
  end
end
