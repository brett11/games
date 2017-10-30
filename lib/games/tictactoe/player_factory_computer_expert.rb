require_relative '../tictactoe/computer_player_expert'

module TTT
  class PlayerFactoryComputerExpert < TTT::PlayerFactoryComputer
    def generate_player(args = { taken: ""})
      TTT::ComputerPlayerExpert.new(name: "Computer", value: computer_value(args[:taken]))
    end
  end
end
