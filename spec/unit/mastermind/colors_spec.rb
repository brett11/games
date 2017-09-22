require_relative '../../../lib/games/mastermind/colors'

RSpec.describe MM::Colors do
  describe "colors" do

    it "can be accessed via key index" do
      expect(MM::Colors.key[1]).to eq(:red)
      expect(MM::Colors.key[2]).to eq(:green)
      expect(MM::Colors.key[3]).to eq(:blue)
      expect(MM::Colors.key[4]).to eq(:orange)
      expect(MM::Colors.key[5]).to eq(:yellow)
      expect(MM::Colors.key[6]).to eq(:brown)

    end
  end
end
