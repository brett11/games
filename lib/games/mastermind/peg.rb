module MM
  class Peg
    attr_accessor :display_value, :row, :col

    def initialize(display_value = nil, row, col)
      @display_value = display_value
      @row = row
      @col = col
    end
  end
end
