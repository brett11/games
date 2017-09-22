require_relative "../../../lib/games/tictactoe/square"
require_relative "../../../lib/games/tictactoe/squares"
require_relative '../../../lib/games/tictactoe/squares_factory'
require_relative '../../support/test_config'

RSpec.describe TTT::Squares do
  describe "factory" do
    context "creates empty board" do
      let(:squares) { TTT::SquaresFactory.build_empty_squares(3)}

      it "holds a collection of squares" do
        expect(squares.collection_of_squares).to respond_to(:each)
      end

      context "and returns the correct" do
        specify "#display_values" do
          expect(squares.display_values).to eq([ [1, 2, 3 ],
                                                 [4, 5, 6 ],
                                                 [7, 8, 9 ]
                                                ] )
        end
      end

      it "#retrieves_square" do
        expect(squares.retrieve_square(4)).to_not be_nil
      end

      it "#retrieve_square returns nil that does not match square" do
        expect(squares.retrieve_square(11)).to be_nil
      end
    end

    context "creates full board" do
      let(:squares) { TTT::SquaresFactory.build_custom_squares(TTT::TestConfig.board_config_full) }

      it "is full" do
        expect(squares).to be_full
      end
    end

    context "creates partially completed board" do
      let(:squares) { TTT::SquaresFactory.build_custom_squares(TTT::TestConfig.board_config_partial) }

      it "is not full" do
        expect(squares).to_not be_full
      end
    end
  end

  describe "can tell if squares are" do
    context "#any_combination_won" do
      let(:squares) { TTT::SquaresFactory.build_custom_squares(TTT::TestConfig.board_config_full_won) }

      specify do
        expect(squares.any_combination_won?).to be_truthy
      end
    end

    context "not won" do
      let(:squares) { TTT::SquaresFactory.build_custom_squares(TTT::TestConfig.board_config_full_draw) }

      specify do
        expect(squares.any_combination_won?).to be_falsy
      end
    end
  end

  describe "finds available choices" do
    let(:squares) { TTT::SquaresFactory.build_custom_squares(TTT::TestConfig.board_config_partial) }

    specify do
      expect(squares.available_choices).to eq([1, 2, 3, 4, 5])
    end
  end
end