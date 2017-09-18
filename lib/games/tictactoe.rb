Dir[File.join(File.dirname(__FILE__), 'tictactoe', '*.rb')].each {|file| require file }

class TicTacToe
  def self.run
    io = TTT::IOTerminal.new
    board_presenter = TTT::BoardPresenterTerminal.new

    game = TTT::Game.new(io: io, board_presenter: board_presenter)
    game.play
  end
end
