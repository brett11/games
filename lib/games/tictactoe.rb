Dir[File.join(File.expand_path(File.dirname(__FILE__)), 'shared', '*.rb')].each {|file| require file }
Dir[File.join(File.expand_path(File.dirname(__FILE__)), 'tictactoe', '*.rb')].each {|file| require file }

class TicTacToe
  def self.run
    io = Shared::IOTerminal.new
    io_helpers = TTT::IOHelpers.new(io)
    board_presenter = TTT::BoardPresenterTerminal.new
    board_builder = TTT::BoardBuilder.new
    players_factory = TTT::PlayersFactory.new(io_helpers)

    game = TTT::Game.new(
                         io_helpers: io_helpers,
                         board_presenter: board_presenter,
                         board_builder: board_builder,
                         players_factory: players_factory,
    )
    game.play
  end
end
