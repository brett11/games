require_relative '../../../lib/games/mastermind/guess_evaluator'

RSpec.describe MM::GuessEvaluator do
  let(:guess_evaluator) { MM::GuessEvaluator.new([5, 3, 4, 1]) }
  let(:guess_evaluator_2) { MM::GuessEvaluator.new([5,3,4,1,8,8]) }

  describe "#evaluate_guess" do
    it "returns correct result" do
      guess = [3, 4, 4, 1]
      result = guess_evaluator.evaluate_guess(guess)
      expect(result).to eq(["X", "X", "O"])
    end

    it "returns correct result 2 " do
      guess =  [3, 4, 4, 1, 8, 5]
      result = guess_evaluator_2.evaluate_guess(guess)
      expect(result).to eq(["X", "X", "X", "O", "O"])
    end
  end
end