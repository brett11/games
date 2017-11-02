require_relative "../../../lib/games/mastermind/guess_evaluator_result"


RSpec.describe MM::GuessEvaluatorResult do
  context "initialized" do
    let(:result) { MM::GuessEvaluatorResult.new }

    it "initializes properly" do
      expect(result.xo_key).to eq([])
      expect(result.exact_match_values).to eq([])
      expect(result.partial_match_values).to eq([])
      expect(result.is_won).to eq(false)
    end
  end
end