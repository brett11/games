Dir[File.join(File.expand_path(File.dirname(__FILE__)), 'shared', '*.rb')].each {|file| require file }
Dir[File.join(File.expand_path(File.dirname(__FILE__)), 'tictactoe', '*.rb')].each {|file| require file }

class TicTacToe
  def self.run
    io = Shared::IOTerminal.new
    input_helper = TTT::InputHelper.new(io)
    config = TTT::GameConfig.new(input_helper)
    board_presenter = TTT::BoardPresenterTerminal.new
    board_builder = TTT::BoardBuilder.new
    players_factory = TTT::PlayersFactory.new

    game = TTT::Game.new(game_module: TTT,
                         io: io,
                         input_helper: input_helper,
                         board_presenter: board_presenter,
                         board_builder: board_builder,
                         players_factory: players_factory,
                         config: config
    )
    game.play
  end
end
