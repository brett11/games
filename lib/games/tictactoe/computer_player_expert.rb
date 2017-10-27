require_relative '../tictactoe/player'

module TTT
  class ComputerPlayerExpert < TTT::Player
    def make_move(game)
      game.io_helpers.computer_choosing_graphic
      minimax = TTT::Minimax.new(game.board, game.number_of_turns_taken, game.player_1_value, game.player_2_value)
      minimax.run_minimax
      minimax.choice
    end
  end
end
