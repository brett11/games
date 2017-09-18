require_relative '../../../lib/games/tictactoe/input_helper'
require_relative '../../../lib/games/tictactoe/io_terminal'

RSpec.describe TTT::InputHelper do
  describe "#get_user_input" do
    let(:io_presenter_receiver) { TTT::IOTerminal.new }
    let(:input_helper) { TTT::InputHelper.new(io_presenter_receiver)}

    context "if valid user input" do
      #https://stackoverflow.com/questions/17258630/how-do-i-write-an-rspec-test-for-a-ruby-method-that-contains-gets-chomp
      before do
        $stdin = StringIO.new("7")
      end

      after do
        $stdin = STDIN
      end

      it "returns that input" do
        #https://stackoverflow.com/questions/17709317/how-to-test-puts-in-rspec
        expect(STDOUT).to receive(:puts).with('Please give me input')
        result = input_helper.get_user_input("Please give me input", "Input must be greater than 5") do |input|
          input > 5
        end
        expect(result).to eq(7)
      end
    end
  end
end
