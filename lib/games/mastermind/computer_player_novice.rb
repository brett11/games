require 'games/shared/player'

module MM
  class ComputerPlayerNovice < Shared::Player
    def make_move(game)
      game.computer_choosing_graphic
      random_move
    end

    def random_move
      guess = []
      4.times do
        guess.push((1..6).to_a.sample)
      end
      guess
    end
  end
end