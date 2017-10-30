require_relative '../tictactoe/computer_player_expert'

module TTT
  class PlayerFactoryComputerExpert < TTT::PlayerFactoryComputer
    def generate_player(taken = "")
      TTT::ComputerPlayerExpert.new(name: "Computer", value: computer_value(taken))
    end
  end
end
