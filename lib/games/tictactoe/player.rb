require_relative '../shared/player'

module TTT
  class Player < Shared::Player
    attr_accessor :value

    def post_initialize(args = {})
      @value = args.fetch(:value, "X")
    end

    def make_move
      raise 'Called abstract method: make_move'
    end
  end
end