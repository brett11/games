require_relative '../../../lib/games/mastermind/guess_evaluator'

RSpec.describe MM::GuessEvaluator do
  let(:guess_evaluator) { MM::GuessEvaluator.new }

  describe "#evaluate_guess" do
    it "returns correct result" do
      secret_code = [5, 3, 4, 1]
      guess = [3, 4, 4, 1]
      result = guess_evaluator.evaluate_guess(secret_code, guess)
      expect(result).to eq(["X", "X", "O"])
    end

    it "returns correct result 2 " do
      secret_code = [5, 3, 4, 1, 8, 8]
      guess =  [3, 4, 4, 1, 8, 5]
      result = guess_evaluator.evaluate_guess(secret_code, guess)
      expect(result).to eq(["X", "X", "X", "O", "O"])
    end

    it "returns correct result 3 " do
      secret_code = [5, 5, 5, 4]
      guess =  [5, 5, 4, 5]
      result = guess_evaluator.evaluate_guess(secret_code, guess)
      expect(result).to eq(["X", "X", "O", "O"])
    end
  end
end