require_relative '../../../lib/games/tictactoe/io_helpers'
require_relative '../../../lib/games/shared/io_terminal'

RSpec.describe TTT::IOHelpers do
  describe "#get_user_input" do
    let(:io_presenter_receiver) { Shared::IOTerminal.new }
    let(:io_helpers) { TTT::IOHelpers.new(io_presenter_receiver)}

    describe "all examples" do
      after do
        $stdin = STDIN
      end

      describe "#get_player_1_value" do
        context "o entered" do
          before do
            $stdin = StringIO.new("o")
          end

          it "returns O" do
            value = io_helpers.get_player_value
            expect(value).to eq("O")
          end
        end
      end

      describe "#get_player_2_name" do
        before do
          $stdin = StringIO.new("brett")
        end

        it "capitalizes name" do
          name = io_helpers.get_opponent_name
          expect(name).to eq("Brett")
        end
      end

      describe "#get_player_2_value" do
        context "o entered" do
          before do
            $stdin = StringIO.new("o")
          end

          it "returns difficult" do
            value = io_helpers.get_player_value("Brett", "X")
            expect(value).to eq("O")
          end
        end
      end

      describe "#get_player_2_type" do
        context "c entered" do
          before do
            $stdin = StringIO.new("c")
          end

          it "returns computer" do
            type = io_helpers.get_player_2_type
            expect(type).to eq(:computer)
          end
        end

        context "h entered" do
          before do
            $stdin = StringIO.new("h")
          end

          it "returns tic tac toe" do
            type = io_helpers.get_player_2_type
            expect(type).to eq(:human)
          end
        end
      end

      describe "#get_computer_difficulty_level" do
        context "d entered" do
          before do
            $stdin = StringIO.new("d")
          end

          it "returns difficult" do
            level = io_helpers.get_computer_knowledge_level
            expect(level).to eq(:expert)
          end
        end

        context "e entered" do
          before do
            $stdin = StringIO.new("e")
          end

          it "returns easy" do
            level = io_helpers.get_computer_knowledge_level
            expect(level).to eq(:novice)
          end
        end
      end

      describe "#get_number_of_rows_cols_max_3" do
        context "3 entered" do
          before do
            $stdin = StringIO.new("3")
          end

          it "returns 3" do
            number_rows_cols = io_helpers.get_number_of_rows_cols_max_3
            expect(number_rows_cols).to eq(3)
          end
        end
      end

      describe "#get_number_of_rows_cols_max_9" do
        context "3 entered" do
          before do
            $stdin = StringIO.new("9")
          end

          it "returns 9" do
            number_rows_cols = io_helpers.get_number_of_rows_cols_max_9
            expect(number_rows_cols).to eq(9)
          end
        end
      end
    end
  end
end
