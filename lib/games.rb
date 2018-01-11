require File.join('games', 'version')
require File.join('games', 'mastermind')
require File.join('games', 'tictactoe')
require File.join('games', 'shared', 'io_helpers')
require File.join('games', 'shared', 'io_terminal')

io_helpers = Shared::IOHelpers.new(Shared::IOTerminal.new)
choice = io_helpers.choose_game

if choice == :tictactoe
  TicTacToe.run
elsif choice == :mastermind
  Mastermind.run
end
