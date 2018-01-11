require "games/tictactoe/square"
require "shared_examples/tictactoe/square"

RSpec.describe TTT::Square do
  let(:display_value) { double }
  let(:value) { double }
  subject { TTT::Square.new(display_value: display_value, value: value)}
  it_behaves_like "TTTSquare-able"

  describe "initialized" do
    context "with no value" do
      let(:square) { TTT::Square.new(display_value: 1)}

      it "is empty" do
        expect(square).to be_empty
      end

      context "then value assigned" do
        it "is full" do
          square.value = "X"
          expect(square).to be_full
        end
      end
    end

    context "with a value" do
      let(:square) { TTT::Square.new(value: "X", display_value: 1)}

      it "is full" do
        expect(square).to be_full
      end
    end
  end

  describe "#change_value" do
    let(:square) { TTT::Square.new(value: 1, display_value: 1, row: 0, col: 0)}

    it "changes display_value and value" do
      square.change_value("O")
      expect(square.value).to eq("O")
      expect(square.display_value).to eq("O")
    end
  end
end