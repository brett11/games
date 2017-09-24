require_relative "../../../lib/games/mastermind/peg"

RSpec.describe MM::Peg do
  describe "initialized" do
    context "with no display value" do
      let(:peg) { MM::Peg.new( row: 0, col: 1)}

      it "assigns display value a value of nil" do
        expect(peg.display_value).to eq(nil)
      end

      context "then value assigned" do
        it "is full" do
          peg.display_value = 2
          expect(peg.display_value).to eq(2)
        end
      end
    end
  end
end