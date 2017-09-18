module TTT
  class Square
    attr_accessor :value, :display_value
    attr_reader :row, :col

    def initialize(args)
      @value = args[:value]
      @display_value = args[:display_value]
      @row = args[:row]
      @col = args[:col]
    end

    def change_value(new_value)
      self.value = new_value
      self.display_value = new_value
    end

    def empty?
      return true unless full?
    end

    def full?
      if value != nil
        return true
      else
        return false
      end
    end
  end
end