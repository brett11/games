Dir[File.join(File.expand_path(File.dirname(__FILE__)), 'shared', '*.rb')].each {|file| require file }
Dir[File.join(File.expand_path(File.dirname(__FILE__)), 'mastermind', '*.rb')].each {|file| require file }

class Mastermind
  def self.run
    io = Shared::IOTerminal.new
    board_presenter = MM::BoardPresenterTerminal.new

    game = MM::Game.new(game_module: MM, io: io, board_presenter: board_presenter)
    # game.setup
    game.play
  end
end