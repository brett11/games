# Dir[File.join(File.expand_path(File.dirname(__FILE__)), 'shared', '*.rb')].each {|file| require file }
# Dir[File.join(File.expand_path(File.dirname(__FILE__)), 'mastermind', '*.rb')].each {|file| require file }

require File.join('shared', 'io_terminal')
require File.join('mastermind', 'io_helpers')
require File.join('mastermind', 'board_presenter_terminal')
require File.join('mastermind', 'board_builder')
require File.join('mastermind', 'players_factory')
require File.join('mastermind', 'game')

class Mastermind
  def self.run
    io = Shared::IOTerminal.new
    io_helpers = MM::IOHelpers.new(io)
    board_presenter = MM::BoardPresenterTerminal.new
    board_builder = MM::BoardBuilder.new
    players_factory = MM::PlayersFactory.new(io_helpers)

    game = MM::Game.new(
                         io_helpers: io_helpers,
                         board_presenter: board_presenter,
                         board_builder: board_builder,
                         players_factory: players_factory
    )
    game.play
  end
end