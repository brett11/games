require "games/mastermind/peg"
require "shared_examples/mastermind/peg"

RSpec.describe MM::Peg do
  it_behaves_like "MMPeg-able"

  describe "initialized" do
    context "with no display value" do
      let(:peg) { MM::Peg.new }

      it "assigns display value a value of nil" do
        expect(peg.display_value).to eq(nil)
      end

      describe "#change_value" do
        it "changes display_value" do
          peg.change_value(5)
          expect(peg.display_value).to eq(5)
        end
      end
    end
  end
end