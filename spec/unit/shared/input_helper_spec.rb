require_relative '../../../lib/games/tictactoe/input_helper'
require_relative '../../../lib/games/shared/io_terminal'

RSpec.describe Games::Shared::InputHelper do
  describe "#get_user_input" do
    let(:io_presenter_receiver) { Games::Shared::IOTerminal.new }
    let(:input_helper) { TTT::InputHelper.new(io_presenter_receiver)}

    describe "all examples" do
      after do
        $stdin = STDIN
      end

      describe "#get_user_input" do
        #https://stackoverflow.com/questions/17258630/how-do-i-write-an-rspec-test-for-a-ruby-method-that-contains-gets-chomp
        before do
          $stdin = StringIO.new("7")
        end

        it "if valid user input, returns that input" do
          #https://stackoverflow.com/questions/17709317/how-to-test-puts-in-rspec
          expect(STDOUT).to receive(:puts).with('Please give me input')
          result = input_helper.get_user_input("Please give me input", "Input must be greater than 5") do |input|
            input > 5
          end
          expect(result).to eq(7)
        end
      end

      describe "#get_game" do
        context "m entered" do
          before do
            $stdin = StringIO.new("m")
          end

          it "returns mastermind" do
            game = input_helper.get_game
            expect(game).to eq(:mastermind)
          end
        end

        context "t entered" do
          before do
            $stdin = StringIO.new("t")
          end

          it "returns tic tac toe" do
            game = input_helper.get_game
            expect(game).to eq(:tictactoe)
          end
        end
      end

      describe "#get_player_1_name" do
        before do
          $stdin = StringIO.new("brett")
        end

        it "capitalizes name" do
          name = input_helper.get_player_1_name
          expect(name).to eq("Brett")
        end
      end
    end
  end
end