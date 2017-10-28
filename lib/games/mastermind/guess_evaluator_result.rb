module MM
  class GuessEvaluatorResult
    attr_accessor :xo_key, :partial_match_values, :exact_match_values
    def initialize
      @xo_key = []
      @exact_match_values = []
      @partial_match_values = []
    end
  end
end
