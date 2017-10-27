module MM
  class Peg
    attr_accessor :display_value

    def initialize(args = {})
      @display_value = args.fetch(:display_value, nil)
    end

    def change_value(new_value)
      self.display_value = new_value
    end
  end
end
