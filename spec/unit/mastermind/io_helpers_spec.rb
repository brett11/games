require_relative '../../../lib/games/mastermind/io_helpers'
require_relative '../../../lib/games/shared/io_terminal'
require_relative '../../../spec/shared_examples/mastermind/io_helpers'
require_relative '../../../spec/shared_examples/shared/io_helpers'

RSpec.describe MM::IOHelpers do
  let(:io_terminal) { Shared::IOTerminal.new }
  let(:io_helpers) { MM::IOHelpers.new(io_terminal)}
  subject { MM::IOHelpers.new(io_terminal)}

  it_behaves_like "MMIOHelpers Game-able"
  it_behaves_like "MMIOHelpers PlayersFactory-able"
  it_behaves_like "MMIOHelpers SecretCodeGenerate-able"
  it_behaves_like "IOHelpers subclass"

  describe "all examples" do
    after do
      $stdin = STDIN
    end

    describe "#computer_or_human_guesser_inquiry" do
      context "1 entered" do
        before do
          $stdin = StringIO.new("1")
        end

        it "returns human" do
          guesser = io_helpers.computer_or_human_guesser_inquiry
          expect(guesser).to eq(:human)
        end
      end

      context "2 entered" do
        before do
          $stdin = StringIO.new("2")
        end

        it "returns novice" do
          guesser = io_helpers.computer_or_human_guesser_inquiry
          expect(guesser).to eq(:computer)
        end
      end
    end

    describe "#get_computer_knowledge_level" do
      #d for dumb
      context "d entered" do
        before do
          $stdin = StringIO.new("d")
        end

        it "returns expert" do
          level = io_helpers.get_computer_knowledge_level
          expect(level).to eq(:novice)
        end
      end

      #s for smart
      context "s entered" do
        before do
          $stdin = StringIO.new("s")
        end

        it "returns novice" do
          level = io_helpers.get_computer_knowledge_level
          expect(level).to eq(:expert)
        end
      end
    end

    describe "#get_secret_code_from_user" do
      context "5124 entered" do
        before do
          $stdin = StringIO.new("5124")
        end

        it "returns [5,1,2,4]" do
          secret_code = io_helpers.get_secret_code_from_user
          expect(secret_code).to eq([5,1,2,4])
        end
      end
    end

    describe "#get_player_choice" do
      context "4351 entered" do
        before do
          $stdin = StringIO.new("4351")
        end

        it "returns [5,1,2,4]" do
          choice = io_helpers.get_player_choice("Player name")
          expect(choice).to eq([4,3,5,1])
        end
      end
    end
  end
end
