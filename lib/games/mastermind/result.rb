module MM
  class Result
    attr_accessor :xo_key, :partial_match_values, :exact_match_values, :is_won
    def initialize
      @xo_key = []
      @exact_match_values = []
      @partial_match_values = []
      @is_won = false
    end
  end
end
