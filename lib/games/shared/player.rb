module Shared
  class Player
    attr_accessor :value, :name, :type, :difficulty_level

    def initialize(args = {})
      @name = args.fetch(:name, "Player 1")
      @type = args.fetch(:type, :human)
      @difficulty_level = args.fetch(:difficulty_level, nil)
      post_initialize(args)
    end

    def post_initialize(args)
    end
  end
end