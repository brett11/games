require_relative '../tictactoe/computer_player_novice'

module TTT
  class PlayerFactoryComputerNovice < TTT::PlayerFactoryComputer
    def generate_player(taken="")
      TTT::ComputerPlayerNovice.new(name: "Computer", value: computer_value(taken))
    end
  end
end
