require_relative '../tictactoe/computer_player_novice'

module TTT
  class PlayerFactoryComputerNovice < TTT::PlayerFactoryComputer
    def generate_player(args = { taken: ""})
      TTT::ComputerPlayerNovice.new(name: "Computer", value: computer_value(args[:taken]))
    end
  end
end
