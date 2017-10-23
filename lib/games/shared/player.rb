module Shared
  class Player
    attr_accessor :name

    def initialize(args = {})
      @name = args.fetch(:name, "Player 1")
      post_initialize(args)
    end

    def post_initialize(args)
    end
  end
end