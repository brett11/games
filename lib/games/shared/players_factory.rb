module Shared
  class PlayersFactory
    attr_accessor :io_helpers

    def initialize(io_helpers)
      @io_helpers = io_helpers
    end
  end
end