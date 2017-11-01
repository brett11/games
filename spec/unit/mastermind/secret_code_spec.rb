require_relative '../../../lib/games/mastermind/secret_code'
require_relative '../../../lib/games/mastermind/io_helpers'

RSpec.describe TTT::PlayersFactory do
  describe "factory" do
    let(:io_helpers) { instance_double "MM::IOHelpers" }

    describe "code guesser is computer" do
      #therefore code setter is human
      before do
        expect(io_helpers).to receive(:get_secret_code_from_user).and_return([1,6,4,3])
      end

      it "returns correct secret code" do
        code = MM::SecretCode.generate(io_helpers, false)
        expect(code).to eq([1,6,4,3])
      end
    end

    describe "code guesser is human" do
      #therefore code setter is computer
      before do
        expect(io_helpers).to_not receive(:get_secret_code_from_user)
      end

      it "returns correct secret code" do
        code = MM::SecretCode.generate(io_helpers, true)
        # should return 4 element array
        expect(code).to be_kind_of(Array)
        expect(code.size).to eq(4)
      end
    end
  end
end

