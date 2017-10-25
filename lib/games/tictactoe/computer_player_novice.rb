require_relative '../tictactoe/player'

module TTT
  class ComputerPlayerNovice < TTT::Player
    def make_move(game)
      game.input_helper.computer_choosing_graphic
      game.available_choices.sample
    end
  end
end