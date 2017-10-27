Dir[File.join(File.expand_path(File.dirname(__FILE__)), 'shared', '*.rb')].each {|file| require file }
Dir[File.join(File.expand_path(File.dirname(__FILE__)), 'mastermind', '*.rb')].each {|file| require file }

class Mastermind
  def self.run
    io = Shared::IOTerminal.new
    io_helpers = MM::IOHelpers.new(io)
    config = MM::GameConfig.new(io_helpers)
    board_presenter = MM::BoardPresenterTerminal.new
    board_builder = MM::BoardBuilder.new
    players_factory = MM::PlayersFactory.new

    game = MM::Game.new(game_module: MM,
                         io: io,
                         io_helpers: io_helpers,
                         board_presenter: board_presenter,
                         board_builder: board_builder,
                         players_factory: players_factory,
                         config: config
    )
    game.play
  end
end