Dir[File.join(File.dirname(__FILE__), 'shared', '*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), 'tictactoe', '*.rb')].each {|file| require file }

class TicTacToe
  io = Games::Shared::IOTerminal.new
  board_presenter = TTT::BoardPresenterTerminal.new

  game = Games::Shared::Game.new(game_module: TTT, io: io, board_presenter: board_presenter)
  game.play
end