require_relative '../shared/player'

module TTT
  class Player < Games::Shared::Player
    attr_accessor :value

    def post_initialize(args = {})
      @value = args.fetch(:value, "X")
    end
  end
end