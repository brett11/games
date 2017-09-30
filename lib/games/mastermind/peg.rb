module MM
  class Peg
    attr_accessor :display_value, :row, :col

    def initialize(args)
      @display_value = args.fetch(:display_value, nil)
      @row = args[:row]
      @col = args[:col]
    end

    def change_value(new_value)
      self.display_value = new_value
    end
  end
end
