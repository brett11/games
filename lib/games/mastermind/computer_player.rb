require_relative '../shared/player'

module MM
  class ComputerPlayer < Shared::Player
    def make_move(game)
      game.input_helper.computer_choosing_graphic
      random_move
    end

    def random_move
      secret_code = []
      4.times do
        secret_code.push((1..6).to_a.sample)
      end
      secret_code
    end
  end
end