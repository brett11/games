Dir[File.join(File.expand_path(File.dirname(__FILE__)), 'tictactoe', '*.rb')].each {|file| require file }
Dir[File.join(File.expand_path(File.dirname(__FILE__)), 'shared', '*.rb')].each {|file| require file }

class TicTacToe
  def self.run
    io = Games::Shared::IOTerminal.new
    board_presenter = TTT::BoardPresenterTerminal.new

    game = TTT::Game.new(game_module: TTT, io: io, board_presenter: board_presenter)
    # game.setup
    game.play
  end
end
