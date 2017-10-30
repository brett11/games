require_relative '../tictactoe/player_factory'

module TTT
  class PlayerFactoryComputerNovice < TTT::PlayerFactoryComputer
    def generate_player(taken="")
      TTT::ComputerPlayerNovice.new(name: "Computer", value: computer_value(taken))
    end
  end
end
