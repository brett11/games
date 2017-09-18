# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'games/version'

Gem::Specification.new do |spec|
  spec.name          = "games_bfox"
  spec.version       = Games::VERSION
  spec.authors       = ["Brett Fox"]
  spec.email         = ["brettfox11@gmail.com"]

  spec.summary       = %q{Play tic tac toe and mastermind on the command line}
  spec.description   = %q{In order to play, download the gem, and type tictactoe or mastermind at your terminal.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
