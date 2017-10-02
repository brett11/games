# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
games = File.expand_path('../lib/games', __FILE__)
mastermind = File.expand_path('../lib/games/mastermind', __FILE__)
shared = File.expand_path('../lib/games/shared', __FILE__)
tictactoe = File.expand_path('../lib/games/tictactoe', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
$LOAD_PATH.unshift(games) unless $LOAD_PATH.include?(games)
$LOAD_PATH.unshift(mastermind) unless $LOAD_PATH.include?(mastermind)
$LOAD_PATH.unshift(shared) unless $LOAD_PATH.include?(shared)
$LOAD_PATH.unshift(tictactoe) unless $LOAD_PATH.include?(tictactoe)
require 'games/version'

Gem::Specification.new do |spec|
  spec.name          = "games_bfox"
  spec.version       = Games::VERSION
  spec.authors       = ["Brett Fox"]
  spec.email         = ["brettfox11@gmail.com"]

  spec.summary       = %q{Play tic tac toe and mastermind on the command line}
  spec.description   = %q{In order to play, download the gem, and type tictactoe or mastermind at your terminal.}
  spec.homepage      = "https://github.com/brett11/games"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.6"
  spec.add_development_dependency 'pry', '~> 0.10.4'
  spec.add_development_dependency 'logging', '~> 2.2', '>= 2.2.2'
end
