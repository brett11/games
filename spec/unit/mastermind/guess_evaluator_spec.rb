require 'games/mastermind/guess_evaluator'

RSpec.describe MM::GuessEvaluator do
  describe "#evaluate_guess" do
    it "returns correct result" do
      secret_code = [5, 3, 4, 1]
      guess =       [3, 4, 4, 1]
      result = MM::GuessEvaluator.evaluate_guess(secret_code, guess)
      expect(result.xo_key).to eq(["X", "X", "O"])
      expect(result.partial_match_values).to eq([3])
      expect(result.exact_match_values).to eq([4, 1])
      expect(result.is_won).to eq(false)
    end

    it "returns correct result 2 " do
      secret_code = [5, 3, 4, 1, 8, 8]
      guess =       [3, 4, 4, 1, 8, 5]
      result = MM::GuessEvaluator.evaluate_guess(secret_code, guess)
      expect(result.xo_key).to eq(["X", "X", "X", "O", "O"])
      expect(result.partial_match_values).to eq([3,5])
      expect(result.exact_match_values).to eq([4,1,8])
      expect(result.is_won).to eq(false)
    end

    it "returns correct result 3 " do
      secret_code = [5, 5, 5, 4]
      guess =       [5, 5, 4, 5]
      result = MM::GuessEvaluator.evaluate_guess(secret_code, guess)
      expect(result.xo_key).to eq(["X", "X", "O", "O"])
      expect(result.partial_match_values).to eq([4,5])
      expect(result.exact_match_values).to eq([5,5])
      expect(result.is_won).to eq(false)
    end

    it "returns correct result 4" do
      secret_code = [3, 5, 2, 6]
      guess =       [3, 5, 2, 6]
      result = MM::GuessEvaluator.evaluate_guess(secret_code, guess)
      expect(result.xo_key).to eq(["X", "X", "X", "X"])
      expect(result.partial_match_values).to eq([])
      expect(result.exact_match_values).to eq([3, 5, 2, 6])
      expect(result.is_won).to eq(true)
    end
  end
end